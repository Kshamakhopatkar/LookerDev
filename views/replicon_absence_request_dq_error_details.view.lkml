view: replicon_absence_request_dq_error_details {
  derived_table: {
    sql: SELECT "replicon_absence" as interface_name ,"INBOUND" as interface_type,data_quality_job_id , data_scan_id, dc_created_timestamp, dc_file_id, dc_lineage_id, dc_rowhash, dc_source_id, dc_updated_timestamp, Employee_ID, error_description, error_value, Leave_Request_ID,ou_code, rule_column, rule_type, severity from
      gtm_dq.replicon_absence_request_dq_error_details ;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: data_quality_job_id {
    type: string
    sql: ${TABLE}.data_quality_job_id ;;
  }
  dimension: data_scan_id {
    type: string
    sql: ${TABLE}.data_scan_id ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: dc_file_id {
    type: string
    sql: ${TABLE}.dc_file_id ;;
  }
  dimension: dc_lineage_id {
    type: string
    sql: ${TABLE}.dc_lineage_id ;;
  }
  dimension: dc_rowhash {
    type: string
    sql: ${TABLE}.dc_rowhash ;;
  }
  dimension: dc_source_id {
    type: string
    sql: ${TABLE}.dc_source_id ;;
  }
  dimension_group: dc_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_updated_timestamp ;;
  }
  dimension: employee_id {
    type: string
    sql: ${TABLE}.Employee_ID ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
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
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  measure: count {
    type: count
  }
}
