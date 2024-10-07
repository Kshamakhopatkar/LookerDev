view: gfs_task_active_dq_error_details {

  derived_table: {
    sql:
    SELECT "GFS_TASK" as interface_name,"INBOUND" as interface_type,blocked_age_in_days,rule_column,severity,error_description, project_number, task_number,ou_code, blocked_since FROM finance_dq.gfs_task_active_dq_error_details;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: blocked_age_in_days {
    type: string
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension: blocked_since {
    type: string
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: project_number {
    type: string
    sql: ${TABLE}.Project_Number ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: task_number {
    type: string
    sql: ${TABLE}.Task_Number ;;
  }
  measure: count {
    type: count
  }
}
