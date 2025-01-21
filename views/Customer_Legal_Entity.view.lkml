view: Customer_Legal_Entity {
  derived_table: {
    sql:SELECT "CUSTOMER_legal_Entity" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,Customer,Country_of_Company FROM finance_dq.s4_customer_legal_entity_level_dq_error_details
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
  measure: count {
    type: count
  }

}
