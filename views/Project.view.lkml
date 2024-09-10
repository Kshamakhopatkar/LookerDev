view: Consolidate_s4 {
  derived_table: {
    sql:
    SELECT "S4_IO" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,country_of_company,io_number as project_number,ou_code, dc_created_timestamp FROM finance_dq.s4_internal_order_dq_error_details

      UNION ALL
      SELECT "S4_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,country_of_company,ProjectDefinition_ID as project_number,ou_code, dc_created_timestamp FROM finance_dq.s4_project_definition_dq_error_details

      UNION ALL
      SELECT "S4_PPROJECT_WBS" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,country_of_company,WBS_Element as project_number,ou_code, dc_created_timestamp FROM finance_dq.s4_wbs_dq_error_details

      UNION ALL
      SELECT "GFS_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, country_of_company,project_number,ou_code,dc_created_timestamp FROM finance_dq.gfs_project_dq_error_details

      UNION ALL
      SELECT "GFS_PROJECT_CLASSIFICATION" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, country_of_company,project_number, ou_code, dc_created_timestamp FROM finance_dq.gfs_project_classification_dq_error_details

      UNION ALL
      SELECT "GFS_PROJECT_MEMBER" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, country_of_company,project_number, ou_code, dc_created_timestamp FROM finance_dq.gfs_project_member_dq_error_details


      UNION ALL
      SELECT "GFS_Provider_OU" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, country_of_company,project_number, ou_code, dc_created_timestamp FROM finance_dq.gfs_provider_ou_dq_error_details


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

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }

  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }

  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company;;
  }
  dimension: project_number {
    type: string
    sql: ${TABLE}.project_number;;
  }

  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
}
