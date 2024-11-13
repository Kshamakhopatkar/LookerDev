view: Employee_Exceptions_Active {

  derived_table: {
    sql:
           SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr as pernr_id , country_of_company,"Not available in Interface" as employee_status_code, created_timestamp FROM `datacloud_adm_dq.gfs_employee_dq_active_error_details` where (rule_column <> 'qualification')


union all
 SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, globalgroupid as ggid, error_description, ou_code,"Not available in interface" as pernr_id, country_of_company,"Not available in Interface" as employee_status_code, created_timestamp from datacloud_adm_dq.corp_employee_dq_active_error_details where rule_column <> 'mode'
          UNION ALL
           SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr_id, country_of_company,"Not available in Interface" as employee_status_code, created_timestamp from datacloud_adm_dq.gdh_employee_global_dq_active_error_details
union all
SELECT UPPER(interface_name) as  interface_name, UPPER(interface_type) as interface_type, rule_column , severity, global_group_id as ggid, error_description, ou_code, pernr as pernr_id , country_of_company,"Not available in Interface" as employee_status_code, created_timestamp, FROM `premi0541131-dataclou.datacloud_adm_dq.gfs_employee_dq_active_error_details`
where rule_column<>'qualification'
            UNION ALL
            SELECT "SFEC" AS interface_name,"INBOUND" AS interface_type, rule_column , "Not available in interface" as severity, global_group_id as ggid,error_description, "Not available in interface" as ou_code, pernr as pernr_id,country_of_company, employee_status_code , blocked_since as created_timestamp from sfec_employee_active_dq_error_details
            UNION ALL
            SELECT "SAPNL" as interface_name,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity,global_group as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
            hr_dq.sapnl_employee_active_dq_error_details
          UNION ALL
          SELECT "INAZ" as interface_name,"INBOUND" as interface_type,rule_column ,"Not available in interface" as severity,global_group as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
           hr_dq.inaz_employee_master_active_dq_error_details
           UNION ALL
           SELECT "HRDB" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, global_group_GGID as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code ,blocked_since as dc_created_timestamp FROM
             hr_dq.hrdb_employee_master_active_dq_error_details
            UNION ALL
            SELECT "MYC" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, global_group_id as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
             hr_dq.myc_employee_master_active_dq_error_details
                         UNION ALL
            SELECT "OLDSF" as interface_name ,"INBOUND" as interface_type,rule_column,"Not available in interface" as severity, Global_ID as ggid,error_description,"Not available in interface" as ou_code, "Not available in interface" as pernr_id,country_of_company, employee_status_code, blocked_since as dc_created_timestamp FROM
             hr_dq.oldsf_employee_master_active_dq_error_details
           UNION ALL
           SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, employee_number as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.dtx_employee_dq_active_error_details
             UNION ALL
             SELECT UPPER(interface_name) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.ibm_ecm_employee_dq_active_error_details
             UNION ALL
             SELECT UPPER(interface_name) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.concur_employee_dq_active_error_details
             UNION ALL
             SELECT UPPER(substring(interface_name,1,3)) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.gbi_employee_dq_active_error_details
             UNION ALL
             SELECT UPPER(interface_name) as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.s4_employee_dq_active_error_details
             UNION ALL
           SELECT "CONCUR" as interface_name ,"OUTBOUND" as interface_type," " as rule_column," " as severity, " " as ggid,"No rejection recorded in this interface" as error_description," " as ou_code, " " as pernr_id," " as country_of_company, " " as employee_status_code, current_timestamp() as dc_created_timestamp



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
    description: "Field from Success Factors(Pxcell) which has error"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension:global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.ggid ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }

  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr_id ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: employee_status_code {
    type: string
    sql: ${TABLE}.employee_status_code ;;
  }
  dimension_group: created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_timestamp ;;
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
