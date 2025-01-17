view: Org_member {
  derived_table: {
    sql: SELECT "COST_CENTER_HIERARCHY" as interface_name,"INBOUND" as interface_type,country_of_company, error_description, error_value, HierarchyNode, HierarchyNodeLevel, ou_code, rule_column, rule_type, severity, dc_created_timestamp FROM
            finance_dq.s4_cost_center_hierarchy_dq_error_details

      union all
      SELECT "COST_CENTER_HIERARCHY" as interface_name,"INBOUND" as interface_type,"" AS country_of_company, "DUMMY Exception inserted to handle No Exception Scenario"
      AS error_description, "" AS error_value, "" AS HierarchyNode,"" AS HierarchyNodeLevel, "" AS ou_code, "" AS rule_column, "" AS rule_type, "" AS severity, timestamp(current_date) AS dc_created_timestamp
      union all
      SELECT "FUNCTIONAL_AREA_HIERARCHY" as interface_name,"INBOUND" as interface_type,country_of_company, error_description, error_value, HierarchyNode, HierarchyNodeLevel, ou_code, rule_column, rule_type, severity,dc_created_timestamp FROM
      finance_dq.s4_functional_area_hierarchy_dq_error_details
      union all
      SELECT "FUNCTIONAL_AREA_HIERARCHY" as interface_name,"INBOUND" as interface_type,"" AS country_of_company, "DUMMY Exception inserted to handle No Exception Scenario" AS error_description, "" AS error_value, "" AS HierarchyNode,"" AS HierarchyNodeLevel, "" AS ou_code, "" AS rule_column, "" AS rule_type, "" AS severity, timestamp(current_date) AS dc_created_timestamp
      union all

      SELECT "PROFIT_CENTER_HIERARCHY" as interface_name,"INBOUND" as interface_type,country_of_company, error_description, error_value, HierarchyNode, HierarchyNodeLevel, ou_code, rule_column, rule_type, severity, dc_created_timestamp FROM finance_dq.s4_profit_center_hierarchy_dq_error_details
      union all
      SELECT "PROFIT_CENTER_HIERARCHY" as interface_name,"INBOUND" as interface_type,"" AS country_of_company, "DUMMY Exception inserted to handle No Exception Scenario"
      AS error_description, "" AS error_value, "" AS HierarchyNode,"" AS HierarchyNodeLevel, "" AS ou_code, "" AS rule_column, "" AS rule_type, "" AS severity, timestamp(current_date) AS dc_created_timestamp

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

  dimension: country_of_company {
    type: string
    sql: ${TABLE}.Country_of_Company ;;
  }

  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: hierarchy_node {
    type: string
    sql: ${TABLE}.HierarchyNode ;;
  }
  dimension: hierarchy_node_level {
    type: string
    sql: ${TABLE}.HierarchyNodeLevel ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }

  measure: count {
    type: count
  }
}
