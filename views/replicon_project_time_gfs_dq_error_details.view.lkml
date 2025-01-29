view: replicon_project_time_gfs_dq_error_details {
  derived_table: {
    sql:SELECT "REPLICON" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, ProjectTime_GGID as ggid, "Not available in interface" as ou_code,  ProjectTime_ProjectTimeID ,"Not available in interface" as pernr_id,   dc_created_timestamp  FROM gtm_dq.replicon_project_time_gfs_dq_error_details
      UNION ALL
      SELECT "GFS" as interface_name,"OUTBOUND" as interface_type,rule_column,severity,error_description,"Not Available in the Interface" as ggid,reference as ProjectTime_ProjectTimeID, ou_code, "Not available in interface" as pernr_id, created_timestamp FROM datacloud_adm_dq.gtm_timecard_gfs_dq_error_details
            UNION ALL
            SELECT "S4" as interface_name,"OUTBOUND" as interface_type,rule_column,severity,error_description,"Not available in interface"  as ggid,  "Not available in interface" as  ProjectTime_ProjectTimeID, ou_code, "Not available in interface"  as pernr_id, created_timestamp FROM datacloud_adm_dq.s4_project_time_balance_dq_error_details

      union all
      SELECT "REPLICON" as interface_name,"INBOUND" as interface_type," " as rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as ggid, " " as ou_code, " " as  ProjectTime_ProjectTimeID ," " as pernr_id,  timestamp('1900-01-01') as created_timestamp
      UNION ALL
      SELECT "GFS" as interface_name,"OUTBOUND" as interface_type," " as  rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," " as ggid,"" as ProjectTime_ProjectTimeID," " as  ou_code, " " as pernr_id, timestamp('1900-01-01') as created_timestamp
      UNION ALL
      SELECT "S4" as interface_name,"OUTBOUND" as interface_type," " as rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," "  as ggid,  " " as  ProjectTime_ProjectTimeID, " " as ou_code, " "  as pernr_id, timestamp('1900-01-01') as created_timestamp

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
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: ggid {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.ggid;;
  }

  dimension:  ProjectTime_ProjectTimeID {
    type: string
    sql: ${TABLE}. ProjectTime_ProjectTimeID ;;
  }

  dimension: pernr_id {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr_id ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }

  measure: count {
    type: count
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
  }
}
