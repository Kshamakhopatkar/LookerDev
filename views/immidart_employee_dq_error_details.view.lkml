view: immidart_employee_dq_error_details {
  sql_table_name: `premi0436563-gitenter.datacloud_adm_dq.immidart_employee_dq_error_details` ;;

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
    sql: ${TABLE}.country_of_company ;;
  }
  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension_group: modified_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modified_timestamp ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: pernr_id {
    type: string
    sql: ${TABLE}.pernr_id ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: scan_tbl_row_hash {
    type: string
    sql: ${TABLE}.scan_tbl_row_hash ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  measure: count {
    type: count
    drill_fields: [interface_name, adm_table_name]
  }
}
