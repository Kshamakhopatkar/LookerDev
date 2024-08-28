view: active_report_outbound {
  derived_table: {
    sql:  SELECT "GDH_EMPLOYEE" as interface_name,"OUTBOUND" as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company,"Not available in Interface" as employee_status_code FROM
    datacloud_adm_dq.gdh_employee_global_dq_error_details
    UNION ALL
    SELECT "SFEC_EMPLOYEE_Active" as interface_name,"INBOUND" as interface_type,rule_column,"Not available in Interface" as severity,error_description,global_group_id as ggid,pernr,"Not available in Interface" as ou_code,country_of_company,employee_status_code FROM
    hr_dq.sfec_employee_active_dq_error_details ;;
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
  dimension: global_group_id {
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
  dimension: status {
    type: string
    description: "Will have one of the two values: 1.Record Blocked-(DC never passed this record in DQ validation. This record was never moved to cleansed). 2.Update Blocked - (Sometime in the past, this record moved to cleaned, but update on this record is blocked due to DQ issue)"
    sql: ${TABLE}.status ;;
  }


}
