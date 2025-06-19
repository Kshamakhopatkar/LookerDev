view: sfec_employee_active_dq_error_details {
 derived_table: {
  sql:select ifnull(blocked_since,'1900-01-01')  as latest_refresh_date from `premi0570223-dc4prd.hr_dq.sfec_employee_active_dq_error_details` order by
    blocked_since desc limit 1
    ;;
}
  dimension: latest_refresh_date {
    type: string
    description: "Timetsamp from raw table since this record is blocked due to DQ issue"
    sql: ${TABLE}.latest_refresh_date ;;
  }


}
