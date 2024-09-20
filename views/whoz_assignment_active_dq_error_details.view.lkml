view: whoz_assignment_active_dq_error_details {

  derived_table: {
    sql:SELECT "GTD" as interface_name ,"INBOUND" as interface_type,allocationid, blocked_age_in_days, blocked_since, error_description, ggid, latest_dc_lineage_id, localemployeenumber, project_ou, provider_ou, rule_column, severity, status FROM
      gtd_dq.whoz_assignment_active_dq_error_details;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type  {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: allocationid {
    type: string
    sql: ${TABLE}.allocationid ;;
  }
  dimension: blocked_age_in_days {
    type: number
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: ggid {
    type: string
    sql: ${TABLE}.ggid ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: localemployeenumber {
    type: string
    sql: ${TABLE}.localemployeenumber ;;
  }
  dimension: project_ou {
    type: string
    sql: ${TABLE}.project_ou ;;
  }
  dimension: provider_ou {
    type: string
    sql: ${TABLE}.provider_ou ;;
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
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
