view: s4_customer_legal_entity_level_active_dq_error_details {
  derived_table: {
    sql:SELECT "CUSTOMER_LEGAL_ENTITY" as interface_name,"INBOUND" as interface_type,rule_column, severity,error_description,Customer,CompanyCode,Country_of_Company FROM finance_dq.s4_customer_legal_entity_level_active_dq_error_details
    UNION ALL
    SELECT "CUSTOMER_LEGAL_ENTITY" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as Customer,"" as CompanyCode,"" as Country_of_Company
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
  dimension: blocked_age_in_days {
    type: string
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension: blocked_since {
    type: string
    sql: ${TABLE}.blocked_since ;;
  }

  dimension: CompanyCode {
    type: string
    sql: ${TABLE}.CompanyCode ;;
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
  dimension: latest_dc_lineage_id {
    type: string
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
