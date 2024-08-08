CREATE TABLE
    IF NOT EXISTS "ed_diagnosis" (
        "subject_id" INTEGER,
        "stay_id" INTEGER,
        "seq_num" INTEGER,
        "icd_code" TEXT,
        "icd_version" INTEGER,
        "icd_title" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "ed_edstays" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "intime" INTEGER,
        "outtime" INTEGER,
        "gender" TEXT,
        "race" TEXT,
        "arrival_transport" TEXT,
        "disposition" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "ed_medrecon" (
        "subject_id" INTEGER,
        "stay_id" INTEGER,
        "charttime" INTEGER,
        "name" TEXT,
        "gsn" TEXT,
        "ndc" INTEGER,
        "etc_rn" INTEGER,
        "etccode" TEXT,
        "etcdescription" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "ed_pyxis" (
        "subject_id" INTEGER,
        "stay_id" INTEGER,
        "charttime" INTEGER,
        "med_rn" INTEGER,
        "name" TEXT,
        "gsn_rn" INTEGER,
        "gsn" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "ed_triage" (
        "subject_id" INTEGER,
        "stay_id" INTEGER,
        "temperature" NUMERIC,
        "heartrate" NUMERIC,
        "resprate" NUMERIC,
        "o2sat" NUMERIC,
        "sbp" NUMERIC,
        "dbp" NUMERIC,
        "pain" INTEGER,
        "acuity" NUMERIC,
        "chiefcomplaint" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "ed_vitalsign" (
        "subject_id" INTEGER,
        "stay_id" INTEGER,
        "charttime" INTEGER,
        "temperature" NUMERIC,
        "heartrate" NUMERIC,
        "resprate" NUMERIC,
        "o2sat" NUMERIC,
        "sbp" INTEGER,
        "dbp" INTEGER,
        "rhythm" TEXT,
        "pain" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_admissions" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "admittime" INTEGER,
        "dischtime" INTEGER,
        "deathtime" INTEGER,
        "admission_type" TEXT,
        "admit_provider_id" INTEGER,
        "admission_location" TEXT,
        "discharge_location" TEXT,
        "insurance" TEXT,
        "language" TEXT,
        "marital_status" TEXT,
        "race" TEXT,
        "edregtime" INTEGER,
        "edouttime" INTEGER,
        "hospital_expire_flag" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_d_hcpcs" (
        "code" TEXT,
        "category" INTEGER,
        "long_description" TEXT,
        "short_description" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_d_icd_diagnoses" (
        "icd_code" TEXT,
        "icd_version" INTEGER,
        "long_title" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_d_icd_procedures" (
        "icd_code" TEXT,
        "icd_version" INTEGER,
        "long_title" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_d_labitems" (
        "itemid" INTEGER,
        "label" TEXT,
        "fluid" TEXT,
        "category" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_diagnoses_icd" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "seq_num" INTEGER,
        "icd_code" TEXT,
        "icd_version" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_drgcodes" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "drg_type" TEXT,
        "drg_code" TEXT,
        "description" TEXT,
        "drg_severity" INTEGER,
        "drg_mortality" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_emar" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "emar_id" TEXT,
        "emar_seq" INTEGER,
        "poe_id" TEXT,
        "pharmacy_id" INTEGER,
        "enter_provider_id" INTEGER,
        "charttime" INTEGER,
        "medication" TEXT,
        "event_txt" TEXT,
        "scheduletime" INTEGER,
        "storetime" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_emar_detail" (
        "subject_id" INTEGER,
        "emar_id" TEXT,
        "emar_seq" INTEGER,
        "parent_field_ordinal" TEXT,
        "administration_type" TEXT,
        "pharmacy_id" INTEGER,
        "barcode_type" TEXT,
        "reason_for_no_barcode" TEXT,
        "complete_dose_not_given" TEXT,
        "dose_due" TEXT,
        "dose_due_unit" TEXT,
        "dose_given" TEXT,
        "dose_given_unit" TEXT,
        "will_remainder_of_dose_be_given" TEXT,
        "product_amount_given" TEXT,
        "product_unit" TEXT,
        "product_code" TEXT,
        "product_description" TEXT,
        "product_description_other" TEXT,
        "prior_infusion_rate" TEXT,
        "infusion_rate" TEXT,
        "infusion_rate_adjustment" TEXT,
        "infusion_rate_adjustment_amount" TEXT,
        "infusion_rate_unit" TEXT,
        "route" TEXT,
        "infusion_complete" TEXT,
        "completion_interval" TEXT,
        "new_iv_bag_hung" TEXT,
        "continued_infusion_in_other_location" TEXT,
        "restart_interval" TEXT,
        "side" TEXT,
        "site" TEXT,
        "non_formulary_visual_verification" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_hcpcsevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "chartdate" TEXT,
        "hcpcs_cd" TEXT,
        "seq_num" INTEGER,
        "short_description" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_labevents" (
        "labevent_id" INTEGER PRIMARY KEY,
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "specimen_id" INTEGER,
        "itemid" INTEGER,
        "order_provider_id" TEXT,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "value" TEXT,
        "valuenum" TEXT,
        "valueuom" TEXT,
        "ref_range_lower" TEXT,
        "ref_range_upper" TEXT,
        "flag" TEXT,
        "priority" TEXT,
        "comments" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_microbiologyevents" (
        "microevent_id" INTEGER PRIMARY KEY,
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "micro_specimen_id" TEXT,
        "order_provider_id" TEXT,
        "chartdate" TEXT,
        "charttime" INTEGER,
        "spec_itemid" INTEGER,
        "spec_type_desc" TEXT,
        "test_seq" INTEGER,
        "storedate" TEXT,
        "storetime" INTEGER,
        "test_itemid" INTEGER,
        "test_name" TEXT,
        "org_itemid" INTEGER,
        "org_name" TEXT,
        "isolate_num" INTEGER,
        "quantity" INTEGER,
        "ab_itemid" INTEGER,
        "ab_name" TEXT,
        "dilution_text" TEXT,
        "dilution_comparison" TEXT,
        "dilution_value" TEXT,
        "interpretation" TEXT,
        "comments" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_omr" (
        "subject_id" INTEGER,
        "chartdate" TEXT,
        "seq_num" INTEGER,
        "result_name" TEXT,
        "result_value" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_patients" (
        "subject_id" INTEGER PRIMARY KEY,
        "gender" TEXT,
        "anchor_age" INTEGER,
        "anchor_year" INTEGER,
        "anchor_year_group" TEXT,
        "dod" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_pharmacy" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "pharmacy_id" INTEGER,
        "poe_id" TEXT,
        "starttime" INTEGER,
        "stoptime" INTEGER,
        "medication" TEXT,
        "proc_type" TEXT,
        "status" TEXT,
        "entertime" INTEGER,
        "verifiedtime" INTEGER,
        "route" TEXT,
        "frequency" TEXT,
        "disp_sched" TEXT,
        "infusion_type" TEXT,
        "sliding_scale" TEXT,
        "lockout_interval" TEXT,
        "basal_rate" TEXT,
        "one_hr_max" TEXT,
        "doses_per_24_hrs" TEXT,
        "duration" TEXT,
        "duration_interval" TEXT,
        "expiration_value" TEXT,
        "expiration_unit" TEXT,
        "expirationdate" TEXT,
        "dispensation" TEXT,
        "fill_quantity" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_poe" (
        "poe_id" TEXT PRIMARY KEY,
        "poe_seq" INTEGER,
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "ordertime" INTEGER,
        "order_type" TEXT,
        "order_subtype" TEXT,
        "transaction_type" TEXT,
        "discontinue_of_poe_id" TEXT,
        "discontinued_by_poe_id" TEXT,
        "order_provider_id" TEXT,
        "order_status" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_poe_detail" (
        "poe_id" TEXT,
        "poe_seq" INTEGER,
        "subject_id" INTEGER,
        "field_name" TEXT,
        "field_value" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_prescriptions" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "pharmacy_id" INTEGER,
        "poe_id" TEXT,
        "poe_seq" INTEGER,
        "order_provider_id" TEXT,
        "starttime" INTEGER,
        "stoptime" INTEGER,
        "drug_type" TEXT,
        "drug" TEXT,
        "formulary_drug_cd" TEXT,
        "gsn" TEXT,
        "ndc" TEXT,
        "prod_strength" TEXT,
        "form_rx" TEXT,
        "dose_val_rx" TEXT,
        "dose_unit_rx" TEXT,
        "form_val_disp" TEXT,
        "form_unit_disp" TEXT,
        "doses_per_24_hrs" TEXT,
        "route" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_procedures_icd" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "seq_num" INTEGER,
        "chartdate" TEXT,
        "icd_code" TEXT,
        "icd_version" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "hosp_provider" (
        "provider_id" TEXT PRIMARY KEY
    );

CREATE TABLE
    IF NOT EXISTS "hosp_services" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "transfertime" INTEGER,
        "prev_service" TEXT,
        "curr_service" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "hosp_transfers" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "transfer_id" INTEGER,
        "eventtype" TEXT,
        "careunit" TEXT,
        "intime" INTEGER,
        "outtime" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "icu_caregiver" (
        "caregiver_id" INTEGER PRIMARY KEY
    );

CREATE TABLE
    IF NOT EXISTS "icu_chartevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "value" TEXT,
        "valuenum" TEXT,
        "valueuom" TEXT,
        "warning" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_d_items" (
        "itemid" INTEGER PRIMARY KEY,
        "label" TEXT,
        "abbreviation" TEXT,
        "linksto" TEXT,
        "category" TEXT,
        "unitname" TEXT,
        "param_type" TEXT,
        "lownormalvalue" TEXT,
        "highnormalvalue" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_datetimeevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "value" TEXT,
        "valueuom" TEXT,
        "warning" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_icustays" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "first_careunit" TEXT,
        "last_careunit" TEXT,
        "intime" INTEGER,
        "outtime" INTEGER,
        "los" NUMERIC
    );

CREATE TABLE
    IF NOT EXISTS "icu_ingredientevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "starttime" INTEGER,
        "endtime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "amount" TEXT,
        "amountuom" TEXT,
        "rate" TEXT,
        "rateuom" TEXT,
        "orderid" INTEGER,
        "linkorderid" INTEGER,
        "statusdescription" TEXT,
        "originalamount" TEXT,
        "originalrate" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_inputevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "starttime" INTEGER,
        "endtime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "amount" TEXT,
        "amountuom" TEXT,
        "rate" TEXT,
        "rateuom" TEXT,
        "orderid" INTEGER,
        "linkorderid" INTEGER,
        "ordercategoryname" TEXT,
        "secondaryordercategoryname" TEXT,
        "ordercomponenttypedescription" TEXT,
        "ordercategorydescription" TEXT,
        "patientweight" NUMERIC,
        "totalamount" TEXT,
        "totalamountuom" TEXT,
        "isopenbag" TEXT,
        "continueinnextdept" TEXT,
        "statusdescription" TEXT,
        "originalamount" TEXT,
        "originalrate" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_outputevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "value" TEXT,
        "valueuom" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "icu_procedureevents" (
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "stay_id" INTEGER,
        "caregiver_id" INTEGER,
        "starttime" INTEGER,
        "endtime" INTEGER,
        "storetime" INTEGER,
        "itemid" INTEGER,
        "value" TEXT,
        "valueuom" TEXT,
        "location" TEXT,
        "locationcategory" TEXT,
        "orderid" INTEGER,
        "linkorderid" INTEGER,
        "ordercategoryname" TEXT,
        "ordercategorydescription" TEXT,
        "patientweight" NUMERIC,
        "isopenbag" TEXT,
        "continueinnextdept" TEXT,
        "statusdescription" TEXT,
        "originalamount" TEXT,
        "originalrate" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "note_discharge" (
        "note_id" TEXT PRIMARY KEY,
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "note_type" TEXT,
        "note_seq" INTEGER,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "text" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "note_discharge_detail" (
        "note_id" TEXT PRIMARY KEY,
        "subject_id" INTEGER,
        "field_name" TEXT,
        "field_value" TEXT,
        "field_ordinal" INTEGER
    );

CREATE TABLE
    IF NOT EXISTS "note_radiology" (
        "note_id" TEXT PRIMARY KEY,
        "subject_id" INTEGER,
        "hadm_id" INTEGER,
        "note_type" TEXT,
        "note_seq" INTEGER,
        "charttime" INTEGER,
        "storetime" INTEGER,
        "text" TEXT
    );

CREATE TABLE
    IF NOT EXISTS "note_radiology_detail" (
        "note_id" TEXT,
        "subject_id" INTEGER,
        "field_name" TEXT,
        "field_value" TEXT,
        "field_ordinal" INTEGER
    );
