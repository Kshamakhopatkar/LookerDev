view: Employee_Exceptions_Active {

  derived_table: {
    sql:  with distinct_rec as(SELECT UPPER(interface_name) as interface_name,UPPER(interface_type) as interface_type,rule_column, error_description, global_group_id,pernr_id as pernr,ou_code,country_of_company,"not available" AS employee_status_code,severity,created_timestamp,last_updated_adm_timestamp,row_number() over (partition by global_group_id, pernr_id order by last_updated_adm_timestamp desc , created_timestamp desc) rn
      FROM `datacloud_adm_dq.gdh_employee_global_dq_error_details` where severity = 'error'
      qualify rn = 1)
      select * except(rn, last_updated_adm_timestamp)  from distinct_rec dist_rec
      where created_timestamp >  coalesce(last_updated_adm_timestamp,'1900-01-01 00:00:00.000000 UTC')
      UNION ALL
      (with distinct_rec as(SELECT UPPER(interface_name) as interface_name,UPPER(interface_type) as interface_type,rule_column, error_description, global_group_id,"Not available in Interface" AS pernr,ou_code,country_of_company,"not available" AS employee_status_code,severity,created_timestamp,last_updated_adm_timestamp, row_number() over (partition by global_group_id order by last_updated_adm_timestamp desc , created_timestamp desc) rn
      FROM `datacloud_adm_dq.gfs_employee_dq_error_details` where severity = 'error'
      qualify rn = 1)
      select * except(rn, last_updated_adm_timestamp) from distinct_rec dist_rec
      where created_timestamp >  coalesce(last_updated_adm_timestamp,'1900-01-01 00:00:00.000000 UTC'))
      UNION ALL
      (SELECT "SFEC_EMPLOYEE" AS interface_name,"INBOUND" AS interface_type,rule_column,error_description,global_group_id, pernr,"Not available in Interface" AS ou_code,country_of_company,employee_status_code,"NA" AS severity,blocked_since as created_timestamp
      FROM `hr_dq.sfec_employee_active_dq_error_details`)
      UNION ALL
            (with distinct_rec as(SELECT UPPER(interface_name) as interface_name,UPPER(interface_type) as interface_type,rule_column, error_description, globalgroupid as global_group_id,"Not available in Interface" AS pernr,ou_code,country_of_company,"not available" AS employee_status_code,severity,created_timestamp,last_updated_adm_timestamp, row_number() over (partition by globalgroupid order by last_updated_adm_timestamp desc , created_timestamp desc) rn
      FROM `datacloud_adm_dq.corp_employee_dq_error_details` where severity = 'error'
      qualify rn = 1)
      select * except(rn, last_updated_adm_timestamp) from distinct_rec dist_rec
      where created_timestamp >  coalesce(last_updated_adm_timestamp,'1900-01-01 00:00:00.000000 UTC'));;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: blocked_age_in_days {
    type: number
    description: "Number of days since this record is blocked due to DQ issue"
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension_group: blocked_since {
    type: time
    description: "Timetsamp from raw table since this record is blocked due to DQ issue"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: company_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.company_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension:global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.global_group_id ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    description: "Job ID of latest feed in from SF to DC in which this record is blocked. Record can come as delta in multiple feeds and get blocked multiple times, this will specify latest job id in DC which blocked the record"
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr ;;
  }
  dimension: rule_column {
    type: string
    description: "Field from Success Factors(Pxcell) which has error"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: employee_status_code {
    type: string
    sql: ${TABLE}.employee_status_code ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
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


}
