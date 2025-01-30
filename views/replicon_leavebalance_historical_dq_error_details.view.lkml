view: replicon_leavebalance_historical_dq_error_details {
  derived_table: {
    sql:SELECT "LEAVEBALANCE" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,global_group_id,  local_id, country_of_company, dc_created_timestamp,absence_type_code  FROM
         gtm_dq.replicon_leavebalance_dq_error_details
        UNION ALL
        SELECT "LEAVEBALANCE" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"Dummy Exception inserted to handle No Exception Scenario" as error_descripition,""global_group_id,"" as local_id,"" as country_of_company,timestamp("1900-01-01") as dc_created_timestamp ,"" as absence_type_code
      ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type  {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension:
  global_group_id  {
    type: string
    sql: ${TABLE}.
      global_group_id ;;
  }

  dimension: absence_type_code {
    type: string
    sql: ${TABLE}.absence_type_code ;;
  }
  dimension: Time_Off_Type  {
    type: string
    sql: ${TABLE}.Time_Off_Type ;;
  }
  dimension: local_id  {
    type: string
    sql: ${TABLE}.local_id ;;
  }
  dimension: blocked_age_in_days  {
    type: string
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    description: "Only required for Data Cloud Traceability"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }


  dimension: country_of_company {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.country_of_company ;;
  }

  dimension: rule_column {
    type: string
    description: "Column on which the Exception is reported"
    sql: ${TABLE}.rule_column ;;
  }

  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }

  measure: count {
    type: count
  }
}
