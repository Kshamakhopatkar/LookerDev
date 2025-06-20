view: replicon_project_time_gfs_active_dq_error_details {
  derived_table: {

    sql:SELECT "GFS" as interface_name,"OUTBOUND" as interface_type,rule_column,severity,error_description, ggid, "Not Available in the Interface" as ProjectTime_LocalEmployeeNumber,"Not Available in the Interface" as  Employee_People_Manager_GGID,0.00 as  ProjectTime_Hours, Date('1900-01-01') as ProjectTime_Entrydate,"Not Available in the Interface" as ProjectTime_ProjectID,"Not Available in the Interface" as  ProjectTime_ProjectName,"Not Available in the Interface" as MarketUnitName,  organization_name as cost_center,"Not Available in the Interface" as CostCenterName,"Not Available in the Interface" as  MarketUnitCode, ou_code, "Not available in interface" as pernr_id,"Not Available in the Interface" as ProjectTime_ProjectTimeID, employee_number as local_id,"Not Available in the Interface" as BatchName,reference, created_timestamp FROM datacloud_adm_dq.gtm_timecard_gfs_active_dq_error_details
union distinct

SELECT "S4" as interface_name,"OUTBOUND" as interface_type,rule_column,severity,error_description, global_group_id  as ggid,"Not Available in the Interface" as ProjectTime_LocalEmployeeNumber,"Not Available in the Interface" as  Employee_People_Manager_GGID, CAST(quantity_working_hours_per_date AS FLOAT64) as  ProjectTime_Hours, Date('1900-01-01')  as ProjectTime_Entrydate,project_number as ProjectTime_ProjectID,"Not Available in the Interface" as  ProjectTime_ProjectName,"Not Available in the Interface" as MarketUnitName, cost_center,"Not Available in the Interface" as CostCenterName,"Not Available in the Interface" as  MarketUnitCode, ou_code, personal_number as pernr_id,"Not Available in the Interface" as ProjectTime_ProjectTimeID,  "Not Available in the Interface" as local_id,"Not Available in the Interface" as BatchName,"Not Available in the Interface" as reference, created_timestamp FROM datacloud_adm_dq.s4_project_time_balance_dq_active_error_details
union distinct
SELECT "REPLICON" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, ProjectTime_GGID as ggid, ProjectTime_LocalEmployeeNumber,  Employee_People_Manager_GGID, CAST(ProjectTime_Hours as FLOAT64), parse_date('%d%m%Y', ProjectTime_Entrydate) as ProjectTime_Entrydate,ProjectTime_ProjectID,ProjectTime_ProjectName,MarketUnitName,cost_center,CostCenterName, MarketUnitCode,"Not available in interface" as ou_code ,"Not available in interface" as pernr_id,ProjectTime_ProjectTimeID,"Not Available in the Interface" as local_id,"Not Available in the Interface" as BatchName,"Not Available in the Interface" as reference,timestamp(blocked_since) as created_timestamp  FROM gtm_dq.replicon_project_time_gfs_active_dq_error_details
union distinct

      SELECT "REPLICON" as interface_name,"INBOUND" as interface_type," " as rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as ggid,"" as ProjectTime_LocalEmployeeNumber,"" as  Employee_People_Manager_GGID,0.00 as  ProjectTime_Hours, date('1900-01-01') as ProjectTime_Entrydate,"" as ProjectTime_ProjectID,"" as  ProjectTime_ProjectName,"" as MarketUnitName,"" as cost_center ,"" as CostCenterName,"" as  MarketUnitCode," " as ou_code," " as pernr_id, "" as ProjectTime_ProjectTimeID,"" as local_id,"" as BatchName,"" as reference, timestamp('1900-01-01') as created_timestamp

  UNION distinct
SELECT "GFS" as interface_name,"OUTBOUND" as interface_type," " as  rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," " as ggid,"" as ProjectTime_LocalEmployeeNumber,"" as Employee_People_Manager_GGID,0.00 as  ProjectTime_Hours, Date('1900-01-01') as ProjectTime_Entrydate,"" as ProjectTime_ProjectID,"" as  ProjectTime_ProjectName,"" as MarketUnitName,"" as cost_center,"" as CostCenterName,"" as  MarketUnitCode," " as ou_code ," " as pernr_id,"" as ProjectTime_ProjectTimeID, "" as local_id,"" as BatchName,"" as reference, timestamp('1900-01-01') as created_timestamp
union distinct
SELECT "S4" as interface_name,"OUTBOUND" as interface_type," " as rule_column," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," "  as ggid, "" as ProjectTime_LocalEmployeeNumber,"" as Employee_People_Manager_GGID,0.00 as  ProjectTime_Hours, Date('1900-01-01') as ProjectTime_Entrydate,"" as ProjectTime_ProjectID,
  "" as  ProjectTime_ProjectName,"" as MarketUnitName,"" as cost_center,"" as CostCenterName,"" as  MarketUnitCode," " as ou_code ," " as pernr_id,"" as ProjectTime_ProjectTimeID, "" as local_id,"" as BatchName,"" as reference, timestamp('1900-01-01') as created_timestamp

;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name;;
    order_by_field: interface_type
  }

  dimension: interface_type {
    type: string
    sql:${TABLE}.interface_type ;;

  }


  dimension: ProjectTime_LocalEmployeeNumber {
    type: string
    sql: ${TABLE}.ProjectTime_LocalEmployeeNumber ;;
  }
  dimension: Employee_People_Manager_GGID {
    type: string
    sql: ${TABLE}.Employee_People_Manager_GGID ;;
  }
  dimension: ProjectTime_Hours {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.ProjectTime_Hours ;;
  }
  dimension: ProjectTime_ProjectID {
    type: string
    sql: ${TABLE}.ProjectTime_ProjectID ;;
  }
  dimension_group: ProjectTime_Entrydate {
    type: time
    datatype: date
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ProjectTime_Entrydate ;;
  }
  dimension: ProjectTime_ProjectName {
    type: string
    sql: ${TABLE}.ProjectTime_ProjectName ;;
  }
  dimension: MarketUnitName {
    type: string
    sql: ${TABLE}.MarketUnitName ;;
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.cost_center ;;
  }
  dimension: CostCenterName {
    type: string
    sql: ${TABLE}.CostCenterName ;;
  }
  dimension: MarketUnitCode {
    type: string
    sql: ${TABLE}.MarketUnitCode ;;
  }
  dimension: ProjectTime_ProjectTimeID {
    type: string
    sql: ${TABLE}.ProjectTime_ProjectTimeID ;;
  }
  dimension: local_id {
    type: string
    sql: ${TABLE}.local_id ;;
  }
  dimension: BatchName {
    type: string
    sql: ${TABLE}.BatchName ;;
  }
  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
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
  measure: total_hrs {
    type: sum
    value_format: "0.00"
    sql: ${ProjectTime_Hours} ;;
  }

}
