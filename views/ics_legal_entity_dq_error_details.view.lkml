view: ics_legal_entity_dq_error_details {
  sql_table_name: `premi0541131-dataclou.finance_dq.ics_legal_entity_dq_error_details` ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.Country_of_Company ;;
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
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: dc_file_id {
    type: string
    description: "Only required for Data Cloud Traceability"
    sql: ${TABLE}.dc_file_id ;;
  }
  dimension: dc_lineage_id {
    type: string
    description: "Only required for Data Cloud Traceability"
    sql: ${TABLE}.dc_lineage_id ;;
  }
  dimension: dc_rowhash {
    type: string
    sql: ${TABLE}.dc_rowhash ;;
  }
  dimension: dc_source_id {
    type: string
    description: "Only required for Data Cloud Traceability"
    sql: ${TABLE}.dc_source_id ;;
  }
  dimension_group: dc_updated_timestamp {
    type: time
    description: "Only required for Data Cloud Traceability"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_updated_timestamp ;;
  }
  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }
  dimension: entity_code {
    type: string
    sql: ${TABLE}.entity_code ;;
  }
  dimension: entity_country {
    type: string
    sql: ${TABLE}.entity_country ;;
  }
  dimension: entity_local_currency {
    type: string
    sql: ${TABLE}.entity_local_currency ;;
  }
  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }
  dimension: entity_source_system {
    type: string
    sql: ${TABLE}.entity_source_system ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: rule_column {
    type: string
    description: "Column on which the Exception is reported"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"
    sql: ${TABLE}.severity ;;
  }
  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }
  measure: count {
    type: count
    drill_fields: [entity_name]
  }
}
