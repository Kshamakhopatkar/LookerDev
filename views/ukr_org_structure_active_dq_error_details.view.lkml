view: ukr_org_structure_active_dq_error_details {
  derived_table: {

    sql:SELECT "Non GFS-Ukraine" as interface_name,"INBOUND" as interface_type,country_of_company, error_description, "" as ou_code, PU_Code ,rule_column, blocked_since FROM
            finance_dq.ukr_org_structure_active_dq_error_details

      union all
      SELECT "Non GFS-Ukraine" as interface_name,"INBOUND" as interface_type,"" as country_of_company, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as ou_code, "" as PU_Code ,"" as rule_column, timestamp("1900-01-01") as blocked_since
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
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: pu_code {
    type: string
    sql: ${TABLE}.PU_Code ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
