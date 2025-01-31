view: cost_center_active {
  derived_table: {
    sql:SELECT "S4_Cost Centre" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,CC_code , ou_code, timestamp(blocked_since) as blocked_since FROM
      finance_dq.s4_cost_center_active_dq_error_details
      union all
      SELECT "S4_Cost Center" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as CC_Code,"" as ou_code,timestamp("1900-01-01") as blocked_since
            UNION ALL
           SELECT "S4_Partner_Cost Centre" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,CC_code , ou_code, timestamp(blocked_since) as blocked_since FROM finance_dq.s4_partner_cost_center_active_dq_error_details
          union all
      SELECT "S4_Partner_Cost Center" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as CC_Code,"" as ou_code,timestamp("1900-01-01") as blocked_since;;
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

    sql: ${TABLE}.error_description ;;

  }
  dimension: country_of_company {

    type: string

    sql: ${TABLE}.Country_of_Company ;;

  }
  dimension: cc_code {

    type: string

    sql: ${TABLE}.CC_code ;;

  }
  dimension: ou_code {

    type: string

    sql: ${TABLE}.ou_code ;;

  }
  dimension_group: blocked_since {

    type: time

    timeframes: [raw, time, date, week, month, quarter, year]

    sql: ${TABLE}.blocked_since ;;

  }

  measure: count {

    type: count

  }

}
