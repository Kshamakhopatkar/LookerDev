view: Customer_Function {
  derived_table: {
    sql:SELECT "CUSTOMER_CONTACT" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description, BusinessPartnerCompany,BusinessPartnerPerson,"Not Available in Interface" as Customer, "Not Available in Interface" as SalesOrganization,"Not Available in Interface" as DistributionChannel,"Not Available in Interface" as Division,"Not Available in Interface" as PartnerFunction,Country_of_Company,dc_created_timestamp FROM finance_dq.s4_customer_contact_dq_error_details
      union all
      SELECT "CUSTOMER_FUNCTION" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,"Not Available in Interface" as  BusinessPartnerCompany,"Not Available in Interface" as BusinessPartnerPerson, Customer,  SalesOrganization,"Not Available in Interface" as DistributionChannel, Division, PartnerFunction,Country_of_Company,dc_created_timestamp FROM finance_dq.s4_customer_function_dq_error_details
      UNION ALL
      SELECT "CUSTOMER_Sales_Level" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,"Not Available in Interface" as  BusinessPartnerCompany,"Not Available in Interface" as BusinessPartnerPerson, Customer,  SalesOrganization, DistributionChannel, Division,"Not Available in Interface" as  PartnerFunction,Country_of_Company,dc_created_timestamp FROM finance_dq.s4_customer_sales_level_dq_error_details
Union all
SELECT "CUSTOMER_CONTACT" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as BusinessPartnerPerson,"" as Customer, " " as SalesOrganization, " " as DistributionChannel, " " as Division,   " " as PartnerFunction,  " " as BusinessPartnerCompany, "" as country_of_company,timestamp("1900-01-01") as dc_created_timestamp
      union all
      SELECT "CUSTOMER_FUNCTION" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as BusinessPartnerPerson," " as  Customer,"" as SalesOrganization, "" as  DistributionChannel, "" as Division," " as PartnerFunction, "" as  BusinessPartnerCompany,"" as country_of_company,timestamp("1900-01-01") as dc_created_timestamp
      union all
      SELECT "CUSTOMER_Sales_Level" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as BusinessPartnerPerson,"" as Customer,"" as SalesOrganization,"" as DistributionChannel, "" as Division, " " as PartnerFunction,  " " as BusinessPartnerCompany,"" as country_of_company,timestamp("1900-01-01") as dc_created_timestamp

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
  dimension: BusinessPartnerPerson  {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.BusinessPartnerPerson;;
  }

  dimension:  DistributionChannel {
    type: string
    sql: ${TABLE}. DistributionChannel ;;
  }
  dimension:  BusinessPartnerCompany {
    type: string
    sql: ${TABLE}. BusinessPartnerCompany ;;
  }
  dimension:  PartnerFunction {
    type: string
    sql: ${TABLE}. PartnerFunction ;;
  }
  dimension:  SalesOrganization {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}. SalesOrganization ;;
  }
  dimension: Customer {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Customer ;;
  }
  dimension:Division  {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.Division ;;
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
