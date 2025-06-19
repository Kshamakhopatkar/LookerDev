view: consolidation_historical_gfs {
  derived_table: {
    sql:
      SELECT "GFS_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number, dc_created_timestamp FROM finance_dq.gfs_project_dq_error_details
    UNION ALL
      SELECT "GFS_PROJECT_CLASSIFICATION" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number, dc_created_timestamp FROM finance_dq.gfs_project_classification_dq_error_details
    UNION ALL
      SELECT "GFS_PROJECT_MEMBER" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number, dc_created_timestamp FROM finance_dq.gfs_project_member_dq_error_details
    UNION ALL
      SELECT "GFS_PROVIDER_OU" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number, dc_created_timestamp FROM finance_dq.gfs_provider_ou_dq_error_details
    UNION ALL
  SELECT "GFS_TASK" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,project_number,dc_created_timestamp FROM finance_dq.gfs_task_dq_error_details
    UNION ALL
  SELECT "REPLICON_PROJECT" as interface_name,"OUTBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description, ou_code,Project_code as project_number,created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.replicon_project_dq_error_details
  UNION ALL
    SELECT "REPLICON" as interface_name,"OUTBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ou_code,"" as project_number,timestamp("1900-01-01") as dc_created_timestamp
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
  dimension_group: dc_created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }


}
