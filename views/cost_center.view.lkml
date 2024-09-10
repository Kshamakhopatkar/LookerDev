view: cost_center {
  derived_table: {
    sql:SELECT "S4_Cost Centre" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,country_of_company, ou_code,CC_code, dc_created_timestamp FROM finance_dq.s4_cost_center_dq_error_details
      UNION ALL
     SELECT "S4_Partner_Cost Centre" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,country_of_company, ou_code,CC_code, dc_created_timestamp FROM finance_dq.s4_partner_cost_center_dq_error_details;;
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
  dimension_group: dc_created_timestamp {

    type: time

    timeframes: [raw, time, date, week, month, quarter, year]

    sql: ${TABLE}.dc_created_timestamp ;;

  }

  measure: count {

    type: count

  }

}
