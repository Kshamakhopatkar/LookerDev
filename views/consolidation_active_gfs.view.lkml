view: consolidation_active_gfs {
  derived_table: {
    sql:
      SELECT "GFS_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,date(blocked_since) as blocked_since FROM finance_dq.gfs_project_active_dq_error_details
    UNION ALL
      SELECT "GFS_PROJECT_CLASSIFICATION" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,date(blocked_since) as blocked_since FROM finance_dq.gfs_project_classification_active_dq_error_details
    UNION ALL
      SELECT "GFS_PROJECT_MEMBER" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,date(blocked_since) as blocked_since FROM finance_dq.gfs_project_member_active_dq_error_details
    UNION ALL
      SELECT "GFS_Provider_OU" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,date(blocked_since) as blocked_since FROM finance_dq.gfs_provider_ou_active_dq_error_details
    UNION ALL
            SELECT "GFS_Active" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,date(blocked_since) as blocked_since FROM finance_dq.gfs_task_active_dq_error_details
            ;;
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
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: project_number {
    type: string
    sql: ${TABLE}.project_number;;
  }
  measure: count {
    type: count
  }
  dimension_group: blocked_since {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }


}
