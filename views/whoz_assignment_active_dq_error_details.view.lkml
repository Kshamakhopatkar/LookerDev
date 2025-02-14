view: whoz_assignment_active_dq_error_details {
  derived_table: {
    sql:SELECT "WHOZ" as interface_name,"INBOUND" as interface_type,Allocationid,error_description,GGID as ggid,LocalEmployeeNumber,rule_column,  "" as project_ou ,blocked_since FROM
    gtd_dq.whoz_assignment_active_dq_error_details
  union all
SELECT "R2D2" as interface_name,"INBOUND" as interface_type,  AllocationID,error_description, GGID as ggid,"Not available in interface" as local_employee_number,rule_column, "Not available in interface" as project_ou , timestamp(blocked_since) FROM gtd_dq.r2d2_assignment_active_dq_error_details
UNION ALL
SELECT "SMS-EMPLOYEE" as interface_name,"OUTBOUND" as interface_type,"" as AllocationID,"No DQ Rule" as error_description, "" as ggid,"No DQ Rule" as local_employee_number,"" as rule_column, " " as project_ou ,Timestamp("1900-01-01") as blocked_since
UNION ALL
SELECT "SUPERVISOR MAPPING SYSTEM" as interface_name,"OUTBOUND" as interface_type,"" as AllocationID,"No DQ Rule" as error_description, "" as ggid,"No DQ Rule" as local_employee_number,"" as rule_column, " " as project_ou , Timestamp("1900-01-01") as blocked_since

union all
SELECT "WHOZ" as interface_name,"INBOUND" as interface_type,"" as AllocationID,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ggid,"" as local_employee_number,"" as rule_column,"" as project_ou,Timestamp("1900-01-01") as blocked_since
union all
SELECT "R2D2" as interface_name,"INBOUND" as interface_type,"" as AllocationID,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ggid,"" as local_employee_number,"" as rule_column,"" as project_ou,Timestamp("1900-01-01") as blocked_since
union all
SELECT "SMS" as interface_name,"OUTBOUND" as interface_type ,"" as AllocationID,"DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as ggid,"" as local_employee_number,"" as rule_column,"" as project_ou,Timestamp("1900-01-01") as blocked_since
;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type  {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: allocationid {
    type: string
    sql: ${TABLE}.allocationid ;;
  }
  dimension: blocked_age_in_days {
    type: number
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: ggid {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.ggid ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: localemployeenumber {
    type: string
    sql: ${TABLE}.localemployeenumber ;;
  }
  dimension: project_ou {
    type: string
    sql: ${TABLE}.project_ou ;;
  }
  dimension: provider_ou {
    type: string
    sql: ${TABLE}.provider_ou ;;
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
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
