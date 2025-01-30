view: Customer_Legal_Entity {
  derived_table: {
    sql:SELECT "CUSTOMER_legal_Entity" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,Customer,Country_of_Company, ou_code, dc_created_timestamp FROM finance_dq.s4_customer_legal_entity_level_dq_error_details
     union all
    SELECT "CUSTOMER_LEGAL_ENTITY" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as Customer,"" as Country_of_Company, "" as ou_code, timestamp("1900-01-01") as dc_created_timestamp
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

  dimension: Country_of_Company {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Country_of_Company ;;
  }

  dimension: Customer {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Customer ;;
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
  measure: count {
    type: count
  }

}
