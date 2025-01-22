view: s4_customer_contact {
  derived_table: {
    sql:SELECT "S4_CUSTOMERCONTACT" as interface_name,"INBOUND" as interface_type,rule_column,severity, error_description,  BusinessPartnerPerson ,"Not Available in Interface" as Customer,  "Not Available in Interface" as SalesOrganization,   "Not Available in Interface" as DistributionChannel, "Not Available in Interface" as Division, "Not Available in Interface" as PartnerFunction,  "Not Available in Interface" as BPCustomerNumber, country_of_company FROM finance_dq.s4_customer_contact_active_dq_error_details
      union all
      SELECT "S4_CUSTOMERFUNCTION" as interface_name,"INBOUND" as interface_type,rule_column,severity, error_description, "Not Available in Interface" as BusinessPartnerPerson, Customer, SalesOrganization,  DistributionChannel, Division, PartnerFunction,  BPCustomerNumber,country_of_company FROM finance_dq.s4_customer_function_active_dq_error_details
      union all
      SELECT "S4_SALESLEVEL" as interface_name,"INBOUND" as interface_type,rule_column,severity, error_description, "Not Available in Interface" as BusinessPartnerPerson, Customer,SalesOrganization,  DistributionChannel, Division, "Not Available in Interface" as PartnerFunction,  "Not Available in Interface" as BPCustomerNumber,country_of_company FROM finance_dq.s4_customer_sales_level_active_dq_error_details


      union all

      SELECT "S4_CUSTOMERCONTACT" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as BusinessPartnerPerson,"" as Customer, " " as SalesOrganization, " " as DistributionChannel, " " as Division,   " " as PartnerFunction,  " " as BPCustomerNumber, "" as country_of_company
      union all
      SELECT "S4_CUSTOMERFUNCTION" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as BusinessPartnerPerson," " as  Customer,"" as SalesOrganization, "" as  DistributionChannel, "" as Division," " as PartnerFunction, "" as  BPCustomerNumber,"" as country_of_company
      union all
      SELECT "S4_SALESLEVEL" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as BusinessPartnerPerson,"" as Customer,"" as SalesOrganization,"" as DistributionChannel, "" as Division, " " as PartnerFunction,  " " as BPCustomerNumber,"" as country_of_company



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

  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }

  dimension: BusinessPartnerPerson {
    type: string
    sql: ${TABLE}.BusinessPartnerPerson ;;
  }

  dimension: SalesOrganization {
    type: string
    sql: ${TABLE}.SalesOrganization ;;
  }

  dimension: DistributionChannel {
    type: string
    sql: ${TABLE}.DistributionChannel ;;
  }

  dimension: Division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension: PartnerFunction {
    type: string
    sql: ${TABLE}.PartnerFunction ;;
  }

  dimension: BPCustomerNumber {
    type: string
    sql: ${TABLE}.BPCustomerNumber ;;
  }

  dimension: country_of_company {
    type: string
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
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
      END ;;
  }
  measure: count {
    type: count
  }
}
