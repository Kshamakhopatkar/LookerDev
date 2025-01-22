view: org_alternative_hierarchy {
  derived_table: {
    sql: SELECT "ORG_ALTERNATIVE_HIERARCHY" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,  Country_of_Company, Prod_Unit_code, ou_code,  dc_created_timestamp FROM
            finance_dq.gfs_alternate_hierarchy_error_details
            UNION ALL
           SELECT "ORG_ALTERNATIVE_HIERARCHY" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as  Country_of_Company, "" as Prod_Unit_code, "" as ou_code,timestamp(current_date) AS dc_created_timestamp

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

  dimension: Country_of_Company {
    type: string
    sql: ${TABLE}.Country_of_Company ;;
  }

  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }

  dimension: Prod_Unit_code {
    type: string
    sql: ${TABLE}.Prod_Unit_code ;;
  }

  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: rule_column {
    type: string
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
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }

  measure: count {
    type: count
  }
}
