view: isgdb_employee_dependents_info_dq_error_details {
  sql_table_name: `premi0436563-gitenter.datacloud_adm_dq.isgdb_employee_dependents_info_dq_error_details` ;;

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
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: ggid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ggid ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: ou_code {
    type: number
    sql: ${TABLE}.ou_code ;;
  }
  dimension: pernr {
    type: number
    sql: ${TABLE}.pernr ;;
  }
  dimension: relationship {
    type: string
    sql: ${TABLE}.relationship ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  measure: count {
    type: count
    drill_fields: [interface_name, last_name, adm_table_name, first_name]
  }
}
