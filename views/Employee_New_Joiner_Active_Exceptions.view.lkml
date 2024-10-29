view: employee_new_joiner_active_exceptions {
  derived_table: {
    sql:SELECT  UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type,rule_column,error_description, globalgroupid as ggid,country_of_company, ou_code ,"Not available in interface" as pernr_id,severity, created_timestamp FROM
       datacloud_adm_dq.corp_newjoiner_dq_active_error_details
          UNION ALL
          SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type,rule_column,error_description, global_group_id as ggid,country_of_company, ou_code, pernr_id,severity, created_timestamp FROM
       datacloud_adm_dq.gdh_newjoiner_dq_active_error_details
        UNION ALL
            SELECT "SFEC_EMPLOYEE" AS interface_name,"INBOUND" AS interface_type, rule_column , "Not available in interface" as severity, global_group_id as ggid,error_description, "Not available in interface" as ou_code,  employee_status_code ,country_of_company, blocked_since as created_timestamp from sfec_employee_active_dq_error_details
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
    description: "Column on which the Exception is reported"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"
    sql: ${TABLE}.severity ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: ggid {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.ggid;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr_id ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company;;
  }
  measure: count {
    type: count
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
}
