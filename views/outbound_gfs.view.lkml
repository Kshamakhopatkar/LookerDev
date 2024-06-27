view: outbound_gfs {
  sql_table_name: `hr_dq.outbound_gfs` ;;

  dimension: adm_lineage_id {
    type: string
    description: "description string"
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
  dimension: global_group_id {
    type: number
    sql: ${TABLE}.global_group_id ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: ou_code {
    type: number
    sql: ${TABLE}.ou_code ;;
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
    drill_fields: [interface_name, adm_table_name]
  }
}
