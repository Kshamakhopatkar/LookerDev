view: Inbound {
  derived_table: {
    sql: SELECT rule_column,severity,error_description,Global_id,country_of_company, dc_created_timestamp FROM
          hr_dq.corp_identity_dq_error_details

            UNION ALL
            SELECT rule_column,severity,error_description,GGID,country_of_company, dc_created_timestamp FROM
            hr_dq.sfec_employee_dq_error_details
            UNION ALL
             SELECT rule_column,severity,error_description,GGID,country_of_company, dc_created_timestamp FROM
            hr_dq.supvrsys_supervisor_mapping_dq_error_details;;

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
  dimension: global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.global_group_id;;
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
  dimension_group: dc_created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
}
