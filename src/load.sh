#!/bin/bash
#
#
#

set -e
set -o pipefail
set -u

DATA_DIR=../data
DB=${DATA}/mimic-iv.db
SCHEMA=${DATA}/mimic-iv.sql

# Prevent clobbering.
[[ -e "${DB}" ]] && echo "FATAL: database already exists!" && exit 1

# TODO: add a flag to allow clobbering.

# Set the DB schema using the provided mimic-iv.sql.
sqlite3 "${DB}" < "${SCHEMA}"

function table_name() {
  local csv="${1}"
  echo "${csv#*/}" \
    | sed -e 's:.csv$::' \
    | sed -e 's:/:_:'
}


echo "Loading ${DB}..."
W1=$( ls ${DATA}/*/*.csv | wc -L )
W2=$( stat -c %s ${DATA}/*/*.csv | wc -L )

# Load the mimic-iv data files into the DB.
for csv in ${DATA}/*/*.csv; do
  table=$( table_name ${csv} )
  bytes=$( stat -c %s ${csv} )
  printf "  %-$(( W1 - 6 ))s : loading %${W2}d bytes...\n" ${table} ${bytes}
  sqlite3 ${DB} ".import ${csv} ${table} --csv --skip 1"
done

# TODO: vacuum the DB to preserve space.

echo "DONE!"
