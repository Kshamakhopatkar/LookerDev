view: org_alternative_hierachy_active {
  derived_table: {
    sql: SELECT "ORG_ALTERNATIVE_HIERARCHY_ACTIVE" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, "Not Availabel in Interface" Country_of_Company,  PROD_UNIT_CODE, ou_code,  blocked_since FROM
            finance_dq.gfs_alternate_hierarchy_active_dq_error_details
             UNION ALL
           SELECT "ORG_ALTERNATIVE_HIERARCHY" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as  Country_of_Company, "" as PROD_UNIT_CODE, "" as ou_code,timestamp(current_date) AS blocked_since

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

  dimension: PROD_UNIT_CODE {
    type: string
    sql: ${TABLE}.PROD_UNIT_CODE ;;
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
  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }

  measure: count {
    type: count
  }
}
