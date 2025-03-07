view: consolidation_historical_s4 {
  derived_table: {
    sql:  SELECT "S4_WBS" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code, WBS_Element as project_number,"Not available in Interface" as ProfitcenterID,"Not available in Interface" as FunctionalAreaID,date(dc_created_timestamp) as dc_created_timestamp FROM finance_dq.s4_wbs_dq_error_details
UNION ALL
SELECT "S4_PROJECT" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code, ProjectDefinition_ID as project_number,"Not available in Interface" as ProfitcenterID,"Not available in Interface" as FunctionalAreaID,date(dc_created_timestamp) as dc_created_timestamp  FROM finance_dq.s4_project_definition_dq_error_details
UNION ALL
SELECT "S4_IO" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code,IO_number as project_number,"Not available in Interface" as ProfitcenterID,"Not available in Interface" as FunctionalAreaID,date(dc_created_timestamp) as dc_created_timestamp FROM finance_dq.s4_internal_order_dq_error_details
UNION ALL
SELECT "S4_WBS" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ou_code,"" as project_number,"" as ProfitcenterID,"" as FunctionalAreaID, date("1900-01-01") as dc_created_timestamp
UNION ALL
SELECT "S4_PROJECT" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ou_code,"" as project_number,"" as ProfitcenterID,"" as FunctionalAreaID, date("1900-01-01") as dc_created_timestamp
UNION ALL
SELECT "S4_IO" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ou_code,"" as project_number,"" as ProfitcenterID,"" as FunctionalAreaID, date("1900-01-01") as dc_created_timestamp
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
  dimension: ProfitcenterID {
    type: string
    sql: ${TABLE}.ProfitcenterID;;
  }
  dimension: FunctionalAreaID {
    type: string
    sql: ${TABLE}.FunctionalAreaID;;
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
