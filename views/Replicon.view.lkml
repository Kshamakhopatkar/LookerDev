view: Replicon {
  derived_table: {
    sql:SELECT "REPLICON ABSENCE REQUEST" as interface_name ,"INBOUND" as interface_type,blocked_age_in_days, blocked_since, company_code, country_of_company, error_description, global_group_id, latest_dc_lineage_id, leave_request_id, rule_column, severity, status FROM
      gtm_dq.replicon_absence_request_active_dq_error_details
       UNION ALL
    sql:SELECT "REPLICON CANCELLED LEAVE REQUEST" as interface_name ,"INBOUND" as interface_type,blocked_age_in_days, blocked_since, company_code, country_of_company, error_description, global_group_id, latest_dc_lineage_id, leave_request_id, rule_column, severity, status FROM
    gtm_dq.replicon_cancelled_leave_requests_active_dq_error_details;;

  }

  dimension: blocked_age_in_days {
    type: number
    description: "Number of days since this record is blocked due to DQ issue"
    sql: ${TABLE}.blocked_age_in_days ;;
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
    description: "Timetsamp from raw table since this record is blocked due to DQ issue"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }
  dimension: country_of_company {
    type: string
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: global_group_id {
    type: string
    sql: ${TABLE}.global_group_id ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    description: "Job ID of latest feed in from SF to DC in which this record is blocked. Record can come as delta in multiple feeds and get blocked multiple times, this will specify latest job id in DC which blocked the record"
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: leave_request_id {
    type: string
    sql: ${TABLE}.leave_request_id ;;
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
  dimension: status {
    type: string
    description: "Will have one of the two values: 1.Record Blocked-(DC never passed this record in DQ validation. This record was never moved to cleansed). 2.Update Blocked - (Sometime in the past, this record moved to cleaned, but update on this record is blocked due to DQ issue)"
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
