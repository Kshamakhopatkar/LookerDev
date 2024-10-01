view: consolidate_project {
  derived_table: {
    sql:  SELECT "S4_WBS_PARTNER" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,country_of_company,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_wbs_partner_dq_error_details
            UNION ALL
            SELECT "S4_WBS" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,country_of_company,"Not available in Interface" as ProjectDefinition_ID,dc_created_timestamp FROM
            finance_dq.s4_wbs_dq_error_details
            UNION ALL
            SELECT "S4_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,country_of_company, ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_project_definition_dq_error_details
            UNION ALL
            SELECT "S4_PARTNER" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,ou_code,"Not available in Interface" as country_of_company,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_partner_io_dq_error_details
            UNION ALL
            SELECT "S4_INTERNAL" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,"Not available in Interface" as country_of_company,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_internal_order_dq_error_details
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
  dimension: ProjectDefinition_ID {
    type: string
    sql: ${TABLE}.ProjectDefinition_ID;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company;;
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
