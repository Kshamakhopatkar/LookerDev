view: Customer {
  derived_table: {
    sql:SELECT "CUSTOMER" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, BusinessPartner,Customer,AddressID,"Not Available in Interface" as BankIdentification, Country_of_Company,dc_created_timestamp FROM finance_dq.s4_customer_dq_error_details
      union all
      SELECT "CUSTOMER_BANK" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, BusinessPartner,"Not Available in Interface" as Customer,"Not Available in Interface" as AddressID,BankIdentification, Country_of_Company,dc_created_timestamp FROM finance_dq.s4_customer_bank_dq_error_details


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
  dimension: BusinessPartner  {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.BusinessPartner;;
  }

  dimension:  AddressID {
    type: string
    sql: ${TABLE}. AddressID ;;
  }

  dimension: BankIdentification {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.BankIdentification ;;
  }
  dimension: Customer {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Customer ;;
  }
  dimension: Country_of_Company {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Country_of_Company ;;
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
