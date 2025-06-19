view: gfs_max_date  {
  derived_table: {
    sql:select ifnull(created_timestamp,'1900-01-01')  as latest_refresh_date from `premi0570223-dc4prd.datacloud_adm_dq.gfs_employee_dq_active_error_details` order by
    created_timestamp desc limit 1
                      ;;
  }
  dimension: latest_refresh_date {
    type: string
    description: "Timetsamp from raw table since this record is blocked due to DQ issue"
    sql: ${TABLE}.latest_refresh_date ;;
  }


}
