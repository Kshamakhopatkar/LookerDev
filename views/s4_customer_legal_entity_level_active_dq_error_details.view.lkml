view: s4_customer_legal_entity_level_active_dq_error_details {
  sql_table_name: `premi0541131-dataclou.finance_dq.s4_customer_legal_entity_level_active_dq_error_details` ;;

  dimension: blocked_age_in_days {
    type: string
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension: blocked_since {
    type: string
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: company_code {
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
