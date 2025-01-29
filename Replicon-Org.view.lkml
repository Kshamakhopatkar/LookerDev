view: Replicon-Org {
  derived_table: {
    sql: SELECT "REPLICON_COST_CENTER" as interface_name,"OUTBOUND" as interface_type,rule_column, severity,error_description,  country_of_company, ou_code,"Not available in Interface" as pu_id, cost_center_id,created_timestamp FROM datacloud_adm_dq.replicon_cost_center_hierarchy_active_dq_error_details
UNION ALL
SELECT "REPLICON_MARKET_UNIT" as interface_name,"OUTBOUND" as interface_type,rule_column, severity,error_description, country_of_company, ou_code,"Not available in Interface" as cost_center_id, pu_id,created_timestamp FROM datacloud_adm_dq.replicon_market_unit_active_dq_error_details
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

  dimension: country_of_company {
    type: string
    sql: ${TABLE}.Country_of_Company ;;
  }
  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: pu_id {
    type: string
    sql: ${TABLE}.pu_id ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: cost_center_id {
    type: string
    sql: ${TABLE}.cost_center_id ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  measure: count {
    type: count
  }
}
