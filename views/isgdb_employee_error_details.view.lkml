view: isgdb_employee_exception_details {
  derived_table: {
    sql: SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
        "datacloud_adm_dq"."isgdb_employee_address_info_dq_error_details"
        UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
        "datacloud_adm_dq"."isgdb_employee_dependents_info_dq_error_details"
        UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
        "datacloud_adm_dq"."isgdb_employee_master_dq_error_details"
       UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
        "datacloud_adm_dq"."isgdb_employee_org_assignment_dq_error_details"
       UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
      "datacloud_adm_dq"."isgdb_employee_passport_info_dq_error_details"
       UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
      "datacloud_adm_dq"."isgdb_employee_personal_info_dq_error_details"
      UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
      "datacloud_adm_dq"."isgdb_employee_personal_phone_info_dq_error_details"
      UNION ALL
        SELECT interface_name,rule_column,severity,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
      "datacloud_adm_dq"."isgdb_employee_work_info_dq_error_details" ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}."severity" ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}."error_description" ;;
  }
  dimension: ggid {
    type: number
    sql: ${TABLE}."ggid" ;;
  }
  dimension: pernr {
    type: number
    sql: ${TABLE}."pernr" ;;
  }
  dimension: ou_code {
    type: number
    sql: ${TABLE}.ou_code ;;
  }
  dimension: country_of_company {
    type: string
    sql: ${TABLE}."country_of_company" ;;
  }
  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_timestamp" ;;
  }
}
