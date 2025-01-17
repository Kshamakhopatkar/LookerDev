view: FA_Segment_Plant_1BB_1BS_CC_PC {
  derived_table: {
    sql:  SELECT "S4_functional_area" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as Name,FunctionalArea as ID,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_functional_area_dq_error_details
            UNION ALL
            SELECT "S4_functional_area" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL
            SELECT "S4_segment" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as NAME,segment as ID, "Not available in Interface" as ProjectDefinition_ID,dc_created_timestamp FROM finance_dq.s4_segment_dq_error_details
             UNION ALL
            SELECT "S4_segment" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL
            SELECT "S4_Plant" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as NAME,plant as ID, "Not available in Interface" asProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_plant_dq_error_details
            UNION ALL
            SELECT "S4_Plant" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL
            SELECT "S4_1bb" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,ou_code as NAME,Z1BB_code as ID, "Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_1bb_dq_error_details
             UNION ALL
            SELECT "S4_1bb" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL
            SELECT "S4_1bs" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as NAME,Z1BS_code as ID,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_1bs_dq_error_details
                         UNION ALL
            SELECT "S4_1bs" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL
            SELECT "S4_company_code" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as NAME,companycode as ID,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
            finance_dq.s4_company_code_dq_error_details
                                     UNION ALL
            SELECT "S4_company_code" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
            UNION ALL

      SELECT "S4_profit_center" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,ou_code as NAME,Profitcenter as ID,"Not available in Interface" as ProjectDefinition_ID, dc_created_timestamp FROM
      finance_dq.s4_profit_center_dq_error_details
      UNION ALL
      SELECT "S4_profit_center" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ID,"" as Name,"" as ProjectDefinition_ID,timestamp(current_date) AS dc_created_timestamp
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
  dimension: ID {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ID ;;
  }
  dimension: Name {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.Name;;
  }
  dimension: ProjectDefinition_ID {
    type: string
    sql: ${TABLE}.ProjectDefinition_ID;;
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
  dimension_group: blocked_since {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
}
