  view: gdh_gfs {
    derived_table: {
      sql:SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,"Not available in Interface" as pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gfs_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id as pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gdh_employee_global_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,globalgroupid as ggid,"Not available in Interface" as pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.corp_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.clarity_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.psa_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,pernr_id as pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.immidart_employee_dq_error_details
            UNION ALL
            SELECT "SFEC" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,GGID,pernr,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.sfec_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_address_info_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_dependents_info_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_master_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_org_assignment_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_passport_info_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_personal_info_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_personal_phone_info_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.isgdb_employee_work_info_dq_error_details
            UNION ALL
            SELECT "SFEC" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,global_group_id as ggid,pernr_id as pernr,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.sfec_education_dq_error_details
            UNION ALL
            SELECT "CORP" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.corp_identity_dq_error_details
            UNION ALL
            SELECT "SUPERVISOR" as interface_name,"INBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.supvrsys_supervisor_mapping_dq_error_details
            UNION ALL
            SELECT "REPLICON" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,"Not available in Interface" as ggid,"Not available in Interface" as pernr_id,ou_code,"Not available in Interface" as country_of_company, dc_created_timestamp FROM
            hr_dq.replicon_leave_request_dq_error_details
            UNION ALL
            SELECT "HRDB" as interface_name ,"INBOUND" as interface_type,rule_column,severity,error_description,Global_Group_GGID as ggid,"Not available in Interface" as pernr,ou_code,country_of_company,dc_created_timestamp AS created_timestamp FROM
            hr_dq.hrdb_employee_master_dq_error_details
            UNION ALL
            SELECT "INAZ" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,Global_Group as ggid,"Not available in Interface"  as pernr,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.inaz_employee_master_dq_error_details
            UNION ALL
            SELECT "MYC" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,Global_Group_ID as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.myc_employee_master_dq_error_details
            UNION ALL
            SELECT "SAPNL" as interface_name,"INBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,global_group as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.sapnl_employee_master_dq_error_details
            UNION ALL
            SELECT "OLDSF" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,Global_ID as ggid,"Not available in Interface" as pernr_id,ou_code,"Not available in Interface" as country_of_company, dc_created_timestamp FROM
            hr_dq.oldsf_employee_master_dq_error_details

            UNION ALL
            SELECT interface_name,"OUTBOUND" as interface_type,rule_column,severity ,error_description,global_group_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM
            datacloud_adm_dq.s4_employee_dq_error_details
            UNION ALL
            SELECT interface_name,"OUTBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_group_id as ggid, "Not available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM
            datacloud_adm_dq.dtx_employee_dq_error_details
            UNION ALL
            SELECT interface_name,"OUTBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,global_group_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM
            datacloud_adm_dq.ibm_ecm_employee_dq_error_details
            UNION ALL
            SELECT interface_name,"OUTBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_group_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM
            datacloud_adm_dq.concur_employee_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,globalgroupid as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.corp_employee_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.gdh_employee_global_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.gfs_employee_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid, "Not Available in Interface" as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.servicecentral_newjoiner_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,  pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.immidart_employee_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,global_id as ggid,"Not Available in Interface" as  pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.psa_employee_dq_error_details
            UNION ALL
            SELECT interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq. dtsi_employee_dq_error_details
           UNION ALL
          SELECT interface_name, interface_type,rule_column,severity,error_description,global_id as ggid,"Not Available in Interface" pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq.gras_savoye_employee_dq_error_details
           UNION ALL
          SELECT interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr as pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq. dpae_employee_dq_error_details
          UNION ALL
          SELECT interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid,  pernr_id,ou_code,country_of_company, created_timestamp as dc_created_timestamp FROM datacloud_adm_dq. sgverzuimsignaal_employee_dq_error_details



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
    dimension: pernr {
      type: string
      description: "Employee PERNR on which this exception is reported"
      sql: ${TABLE}.PERNR ;;
    }
    dimension: ou_code {
      type: string
      sql: ${TABLE}.ou_code ;;
    }
    dimension: country_of_company {
      type: string
      description: "Country of the Company code"
      sql: ${TABLE}.country_of_company;;
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
