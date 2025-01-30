view: replicon_absence_request_dq_error_details {
  derived_table: {
    sql: SELECT "REPLICON ABSENCE REQUEST" as interface_name ,"INBOUND" as interface_type, dc_created_timestamp, country_of_company, error_description, employee_id, leave_request_id, rule_column, severity,ou_code FROM
      gtm_dq.replicon_absence_request_dq_error_details
      UNION ALL
       SELECT "REPLICON ABSENCE REQUEST" as interface_name ,"INBOUND" as interface_type, timestamp("1900-01-01") as dc_created_timestamp, "" as country_of_company,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as employee_id, "" as leave_request_id,"" as rule_column,"" as severity,"" as ou_code
       UNION ALL
    SELECT "REPLICON CANCELLED LEAVE REQUEST" as interface_name ,"INBOUND" as interface_type, dc_created_timestamp,country_of_company, error_description, employee_id, leave_request_id, rule_column, severity,ou_code FROM
    gtm_dq.replicon_cancelled_leave_requests_dq_error_details
      UNION ALL
       SELECT "REPLICON CANCELLED LEAVE REQUEST" as interface_name ,"INBOUND" as interface_type, timestamp("1900-01-01") as dc_created_timestamp, "" as country_of_company,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as employee_id, "" as leave_request_id,"" as rule_column,"" as severity,"" as ou_code;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }

  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.Employee_ID ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: leave_request_id {
    type: string
    sql: ${TABLE}.Leave_Request_ID ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"
    sql:case when severity in ('technical-error') then "error"  else substr(severity,10) end ;;

  }
  measure: count {
    type: count
  }
}
