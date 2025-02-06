view: whoz_assignment_dq_error_details {
  derived_table: {
    sql:SELECT "WHOZ" as interface_name,"INBOUND" as interface_type,Allocationid,error_description,GGID as ggid,LocalEmployeeNumber,rule_column, project_ou ,ou_code,severity,dc_created_timestamp FROM
    gtd_dq.whoz_assignment_dq_error_details
    UNION ALL
SELECT "SMS" as interface_name,"OUTBOUND" as interface_type,allocationid,error_description,ggid,local_employee_number,rule_column,"Not Available in Interface" as project_ou,"Not Available in Interface" as ou_code, severity,created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.sms_allocations_dq_error_details
UNION ALL
SELECT "R2D2" as interface_name,"INBOUND" as interface_type,  AllocationID,error_description, GGID as ggid,"Not available in interface" as local_employee_number,rule_column, "Not available in interface" as project_ou ,ou_code, severity,dc_created_timestamp FROM gtd_dq.r2d2_assignment_dq_error_details
UNION ALL
SELECT "SMS-EMPLOYEE" as interface_name,"OUTBOUND" as interface_type,"" as AllocationID,"No DQ Rule" as error_description, "" as ggid," No DQ Rule" as local_employee_number,"" as rule_column, " " as project_ou ,"" as ou_code,""as  severity,timestamp("1900-01-01") as dc_created_timestamp
UNION ALL
SELECT "SUPERVISOR MAPPING SYSTEM" as interface_name,"OUTBOUND" as interface_type,"" as AllocationID,"No DQ Rule" as error_description, "" as ggid," No DQ Rule" as local_employee_number,"" as rule_column, " " as project_ou ,"" as ou_code,""as  severity,timestamp("1900-01-01") as dc_created_timestamp
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
  dimension: AllocationID {
    type: string
    sql: ${TABLE}.AllocationID ;;
  }
  dimension: data_quality_job_id {
    type: string
    sql: ${TABLE}.data_quality_job_id ;;
  }
  dimension: data_scan_id {
    type: string
    sql: ${TABLE}.data_scan_id ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: dc_file_id {
    type: string
    sql: ${TABLE}.dc_file_id ;;
  }
  dimension: dc_lineage_id {
    type: string
    sql: ${TABLE}.dc_lineage_id ;;
  }
  dimension: dc_rowhash {
    type: string
    sql: ${TABLE}.dc_rowhash ;;
  }
  dimension: dc_source_id {
    type: string
    sql: ${TABLE}.dc_source_id ;;
  }
  dimension_group: dc_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_updated_timestamp ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: ggid {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.GGID ;;
  }
  dimension: local_employee_number {
    type: string
    sql: ${TABLE}.LocalEmployeeNumber ;;
  }

  dimension: rule_column {
    type: string
    description: "Column on which the Exception is reported"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          WHEN severity="technical-error" THEN "error"
          WHEN severity="reject-warning" THEN "warning"
          ELSE "error"
      END ;;  }
  measure: count {
    type: count
  }
}
