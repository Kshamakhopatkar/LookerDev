view: employee_new_joiner_active_exceptions {
  derived_table: {
    sql: with distinct_rec as(SELECT *, row_number() over (partition by global_group_id, pernr order by last_updated_adm_timestamp desc , created_timestamp desc) rn
      FROM `datacloud_adm_dq.gdh_newjoiner_dq_error_details` where severity = 'error'
      qualify rn = 1)
      select * except(rn, last_updated_adm_timestamp) from distinct_rec
      where created_timestamp >  coalesce(last_updated_adm_timestamp,'1900-01-01 00:00:00.000000 UTC') ;;
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
  dimension: global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.global_group_id;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.PERNR ;;
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
