view: s4_customer_active_dq_error_details {
  derived_table: {
    sql:SELECT "CUSTOMER" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, BusinessPartner,Customer,AddressID,"Not Available in Interface" as BankIdentification, Country_of_Company,blocked_since FROM finance_dq.s4_customer_active_dq_error_details
      union all
      SELECT "CUSTOMER_BANK" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, BusinessPartner,"Not Available in Interface" as Customer,"Not Available in Interface" as AddressID,BankIdentification, Country_of_Company,blocked_since FROM finance_dq.s4_customer_bank_active_dq_error_details
       union all

        SELECT "S4_CUSTOMER" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as BusinessPartner,"" as Customer,"" as AddressID," " as BankIndentification,"" as country_of_company,timestamp("1900-01-01") as blocked_since
        Union all
        SELECT "S4_CUSTOMERBANK" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as BusinessPartner," " as Customer," " as AddressID, "" as BankIdentification,"" as country_of_company, timestamp("1900-01-01") as blocked_since


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
  dimension_group: blocked_since {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  measure: count {
    type: count
  }

}
