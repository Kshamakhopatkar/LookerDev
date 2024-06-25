view: gdh_newjoiner_dq_error_details {
  sql_table_name: `premi0436563-gitenter.datacloud_adm_dq.gdh_newjoiner_dq_error_details` ;;

  dimension: adm_lineage_id {
    type: string
    sql: ${TABLE}.adm_lineage_id ;;
  }
  dimension: adm_table_name {
    type: string
    sql: ${TABLE}.adm_table_name ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
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
  dimension: global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.global_group_id ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr ;;
  }
  dimension: rowhash {
    type: string
    sql: ${TABLE}.rowhash ;;
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
  dimension_group: updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [interface_name, adm_table_name]
  }
}
