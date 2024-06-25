view: isgdb_employee_exception_details{
  derived_table: {
    sql: SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
         datacloud_adm_dq.isgdb_employee_address_info_dq_error_details
        UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
         datacloud_adm_dq.isgdb_employee_dependents_info_dq_error_details
        UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
         datacloud_adm_dq.isgdb_employee_master_dq_error_details
       UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
         datacloud_adm_dq.isgdb_employee_org_assignment_dq_error_details
       UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
       datacloud_adm_dq.isgdb_employee_passport_info_dq_error_details
       UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
       datacloud_adm_dq.isgdb_employee_personal_info_dq_error_details
      UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
       datacloud_adm_dq.isgdb_employee_personal_phone_info_dq_error_details
      UNION ALL
        SELECT interface_name,interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
       datacloud_adm_dq.isgdb_employee_work_info_dq_error_details;;
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
    sql: ${TABLE}.pernr ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company;;
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
}
