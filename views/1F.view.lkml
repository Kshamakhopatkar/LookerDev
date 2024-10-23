view: 1F {
  derived_table: {
    sql:            SELECT "SAPNL_EMPLOYEE" as interface_name,"INBOUND" as interface_type,rule_column,error_description,global_group as ggid,country_of_company, blocked_since as dc_created_timestamp FROM
            premi0541131-dataclou.hr_dq.sapnl_employee_active_dq_error_details
           UNION ALL
                       SELECT "INAZ_EMPLOYEE" as interface_name,"INBOUND" as interface_type,rule_column ,error_description,Global_Group as ggid,country_of_company, blocked_since as dc_created_timestamp FROM
           `premi0541131-dataclou.hr_dq.inaz_employee_master_active_dq_error_details`
           UNION ALL
           SELECT "HRDB_EMPLOYEE" as interface_name ,"INBOUND" as interface_type,rule_column,error_description,Global_Group_GGID as ggid,country_of_company, blocked_since AS created_timestamp FROM
             `premi0541131-dataclou.hr_dq.hrdb_employee_master_active_dq_error_details`
             UNION ALL
                         SELECT "MYC_EMPLOYEE" as interface_name,"INBOUND" as interface_type,rule_column,error_description, Global_Group_ID as ggid,country_of_company, blocked_since as dc_created_timestamp FROM
            `premi0541131-dataclou.hr_dq.myc_employee_master_active_dq_error_details`
            UNION ALL
            SELECT "OLDSF_EMPLOYEE" as interface_name,"INBOUND" as interface_type,rule_column,error_description, Global_Group_ID as ggid,country_of_company, blocked_since as dc_created_timestamp FROM
          `premi0541131-dataclou.hr_dq.myc_employee_master_active_dq_error_details`

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
    type: number
    description: "Number of days since this record is blocked due to DQ issue"
    sql: ${TABLE}.blocked_age_in_days ;;
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
  dimension: employee_number {
    type: string
    sql: ${TABLE}.Employee_Number ;;
  }
  dimension: employee_status_code {
    type: string
    sql: ${TABLE}.employee_status_code ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: global_group_id {
    type: string
    sql: ${TABLE}.Global_Group_ID ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    description: "Job ID of latest feed in from SF to DC in which this record is blocked. Record can come as delta in multiple feeds and get blocked multiple times, this will specify latest job id in DC which blocked the record"
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: rule_column {
    type: string
    description: "Field from Success Factors(Pxcell) which has error"
    sql: ${TABLE}.rule_column ;;
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
