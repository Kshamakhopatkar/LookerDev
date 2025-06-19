view: corp_employee_dq_active_error_details {
  derived_table: {
    sql:
           SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr as pernr_id , country_of_company,"Not available in Interface" as employee_status_code, created_timestamp FROM `datacloud_adm_dq.gfs_employee_dq_active_error_details` NOLOCK where (rule_column <> 'qualification')
          or
(pernr in(select distinct pernr from hr_curated.vw_cost_rate_code where crc is null) and rule_column = 'qualification')


union all
 SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, globalgroupid as ggid, error_description, ou_code,"Not available in interface" as pernr_id, country_of_company,"Not available in Interface" as employee_status_code, created_timestamp from datacloud_adm_dq.corp_employee_dq_active_error_details NOLOCK
          UNION ALL
           SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr_id, country_of_company,"Not available in Interface" as employee_status_code, created_timestamp from datacloud_adm_dq.gdh_employee_global_dq_active_error_details NOLOCK
union all
SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr as pernr_id , country_of_company,"Not available in Interface" as employee_status_code, created_timestamp, FROM `premi0541131-dataclou.datacloud_adm_dq.gfs_employee_dq_active_error_details` NOLOCK
where rule_column<>'qualification'
            UNION ALL
            SELECT "SFEC" AS interface_name,"INBOUND" AS interface_type, rule_column , "Not available in interface" as severity, global_group_id as ggid,error_description, "Not available in interface" as ou_code, pernr as pernr_id,country_of_company, employee_status_code , blocked_since as created_timestamp from hr_dq.sfec_employee_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SAPNL" as interface_name,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity,global_group as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
            hr_dq.sapnl_employee_active_dq_error_details NOLOCK
          UNION ALL
          SELECT "INAZ" as interface_name,"INBOUND" as interface_type,rule_column ,"Not available in interface" as severity,global_group as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
           hr_dq.inaz_employee_master_active_dq_error_details NOLOCK
           UNION ALL
           SELECT "HRDB" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, global_group_GGID as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code ,blocked_since as dc_created_timestamp FROM
             hr_dq.hrdb_employee_master_active_dq_error_details NOLOCK

                         UNION ALL
            SELECT "OLDSF" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, Global_ID as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
             hr_dq.oldsf_employee_master_active_dq_error_details NOLOCK
           UNION ALL
           SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, employee_number as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.dtx_employee_dq_active_error_details NOLOCK
             UNION ALL
             SELECT UPPER(interface_name) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.ibm_ecm_employee_dq_active_error_details NOLOCK
             UNION ALL
             SELECT UPPER(substring(interface_name,1,3)) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.gbi_employee_dq_active_error_details NOLOCK
             UNION ALL
             SELECT UPPER(interface_name) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.s4_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_ABSENCE" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, global_group_id as ggid,error_description,"Not available in interface" as ou_code,"Not available in interface" as   pernr_id,country_of_company,"Not available in interface" as  employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_absence_master_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_JOB" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, "Not available in interface" as ggid,error_description,"Not available in interface" as ou_code,"Not available in interface" as  pernr_id,company_code as country_of_company ,"Not available in interface" as employee_status_code, timestamp(blocked_since) as dc_created_timestamp FROM hr_dq.sfec_job_position_master_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_LOCATION" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, "Not available in interface" as ggid,error_description,"Not available in interface" as ou_code,"Not available in interface" as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_location_master_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_LOV" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, "Not available in interface" as ggid,error_description,"Not available in interface" as ou_code,"Not available in interface" as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_lov_master_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_PAY" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, Global_Group_ID as ggid,error_description,"Not available in interface" as ou_code,  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_pay_component_active_dq_error_details NOLOCK
            UNION ALL

            SELECT "SFEC_VOLUNTARY" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity,"Not available in interface" as ggid,error_description,"Not available in interface" as ou_code, pernr as  pernr_id,country_of_company,'' as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_voluntary_separation_active_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.immidart_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_id as ggid,error_description,ou_code,"Not available in interface" AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.psa_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_id as ggid,error_description,ou_code,"Not available in interface" AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.gras_savoye_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.dtsi_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,PERNR AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.dpae_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.cgverzuimsignaal_active_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.sgverzuimsignaal_employee_dq_active_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,PERNR AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.capp_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "IMAGENOW_BNL_CAPGEMINI" as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,PERNR AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.imagenow_bnl_capgemini_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "IMAGENOW_BNL_SOGETI" as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code,PERNR AS pernr_id,country_of_company, "Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.imagenow_bnl_sogeti_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SPAIN" as interface_name ,"OUTBOUND" as interface_type,rule_column,"Not available in interface" as severity,global_group_id as ggid,"Not available in interface" as error_description,"Not available in interface" as ou_code, "Not available in interface" as  pernr_id,country_of_company,employee_status_code, blocked_since as dc_created_timestamp FROM datacloud_adm_dq.spain_new_portal_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SIG" as interface_name ,"OUTBOUND" as interface_type,rule_column, severity, ggid,error_description, ou_code, PERNR as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.sig_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "CORP_IDENTITY" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity,Global_id as  ggid,error_description, "Not available in interface" as ou_code, "Not available in interface" as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.corp_identity_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC_BANK" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity,"Not available in interface" as  ggid,error_description, "Not available in interface" as ou_code, "Not available in interface" as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.sfec_bank_master_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "SUPERVISOR" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, ggid,error_description, "Not available in interface" as ou_code, "Not available in interface" as  pernr_id,country_of_company,"Not available in interface" as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.supvrsys_supervisor_mapping_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "REPLICON_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,"Not available in interface" as ggid,error_description,  ou_code,   pernr as pernr_id,country_of_company,"Not available in interface" as employee_status_code,created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.replicon_employee_active_dq_error_details NOLOCK
            UNION ALL
            SELECT "REPLICON_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,""as ou_code,   "" as pernr_id,"" as country_of_company," " as employee_status_code,timestamp("1900-01-01") as dc_created_timestamp

          UNION ALL

 SELECT "UKRAINE_CUBE" as interface_name, "INBOUND" as interface_type,rule_column,"Not Available in Interface"  as severity, GGID as ggid,error_description,company_code as ou_code,"Not Available in Interface"  as pernr_id,  country_of_company,"Not Available in Interface"  as employee_status_code,blocked_since as  created_timestamp  FROM hr_dq.cube_employee_master_active_dq_error_details
 UNION ALL
 SELECT "UKRAINE_CUBE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code, "" as pernr_id,  "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
 UNION ALL
SELECT "SERBIA" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description, ou_code, "Not available in interface" as pernr_id,  Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.serbia_employee_master_active_dq_error_details
UNION ALL
SELECT "GREECE" as interface_name ,"INBOUND" as interface_type,rule_column,severity,GLOBAL_ID as ggid,error_description,ou_code, "Not available in interface" as pernr_id,  Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM
hr_dq.greece_employee_master_active_dq_error_details
UNION ALL
SELECT "SERBIA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id,   "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "GREECE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id,  "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "CAMBRIDGE" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description,  " "as ou_code,"Not available in interface" as pernr_id,  Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM
 hr_dq.cambridge_employee_master_active_dq_error_details
UNION ALL
SELECT "CAMBRIDGE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id,   "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "SOGETIUSA" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description, ou_code,"Not available in interface" as pernr_id, Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM
hr_dq.sogetiusa_employee_master_active_dq_error_details
UNION ALL
SELECT "ARGENTINA" as interface_name ,"INBOUND" as interface_type,rule_column, severity, GLOBAL_ID as ggid,error_description,ou_code, "Not available in interface" as pernr_id,  Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.argentina_employee_master_active_dq_error_details
UNION ALL
SELECT "SOGETIUSA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity, " " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," "as ou_code, "" as pernr_id,  "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "ARGENTINA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity, " " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," "as ou_code, "" as pernr_id, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "COLOMBIA" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description, ou_code, "Not available in interface" as pernr_id,   Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestampp FROM hr_dq.colombia_employee_master_active_dq_error_details
UNION ALL
SELECT "COLOMBIA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity, " " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," "as ou_code, "" as pernr_id,  "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "RDI_BRAZIL" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description, ou_code, "Not available in interface" as pernr_id,  Country_of_Company ,EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.rdi_brazil_employee_master_active_dq_error_details
UNION ALL
SELECT "RDI_HUNGARY" as interface_name ,"INBOUND" as interface_type,rule_column, severity,GLOBAL_ID as ggid,error_description, ou_code, "Not available in interface" as pernr_id, Country_of_Company, EMPLOYEE_STATUS as employee_status_code, blocked_since as dc_created_timestamp FROM hr_dq.rdi_hungary_employee_master_active_dq_error_details
UNION ALL
SELECT "RDI_BRAZIL" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id,   "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "RDI_HUNGARY" as interface_name ,"INBOUND" as interface_type,"" as rule_column," " as ggid,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
UNION ALL
SELECT "COSTARICA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity," " as ggid,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " "as ou_code,"" as pernr_id, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp


      ;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: rule_column {
    type: string
    description: "Field from Success Factors(Pxcell) which has error"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension:global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.ggid ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }

  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: pernr_id {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr_id ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: employee_status_code {
    type: string
    sql: ${TABLE}.employee_status_code ;;
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
  dimension: status {
    type: string
    description: "Will have one of the two values: 1.Record Blocked-(DC never passed this record in DQ validation. This record was never moved to cleansed). 2.Update Blocked - (Sometime in the past, this record moved to cleaned, but update on this record is blocked due to DQ issue)"
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }


}
