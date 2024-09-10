view: s4_work_item_dq_error_details {
  derived_table: {
    sql:
    SELECT "S4_WORK_ITEM" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, dc_created_timestamp,project_role_id, wbs_level_1_id FROM finance_dq.s4_work_item_dq_error_details;;
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
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: project_role_id {
    type: string
    sql: ${TABLE}.Project_Role_ID ;;
  }
  dimension: wbs_level_1_id {
    type: string
    sql: ${TABLE}.WBS_Level_1_ID ;;
  }
  measure: count {
    type: count
  }
}
