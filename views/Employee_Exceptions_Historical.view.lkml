  view: gdh_gfs {
    derived_table: {
      sql:SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.gfs_employee_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM
            datacloud_adm_dq.gdh_employee_global_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,globalgroupid as ggid,"Not available in Interface" as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM
            datacloud_adm_dq.corp_employee_dq_error_details  NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM
            datacloud_adm_dq.clarity_employee_dq_error_details  NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM
            datacloud_adm_dq.psa_employee_dq_error_details  NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,pernr_id as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.immidart_employee_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC" as interface_name,"INBOUND" as interface_type,rule_column,SUBSTR(severity, 10) as severity,error_description,GGID,PERNR as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, dc_created_timestamp as created_timestamp FROM hr_dq.sfec_employee_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_address_info_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_dependents_info_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_master_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_org_assignment_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_passport_info_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_personal_info_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_personal_phone_info_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,ggid,pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.isgdb_employee_work_info_dq_error_details NOLOCK
            UNION ALL
            SELECT "SFEC" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,global_group_id as ggid,pernr_id as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, dc_created_timestamp as created_timestamp FROM hr_dq.sfec_education_dq_error_details NOLOCK
            UNION ALL
            SELECT "CORP" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_id as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, dc_created_timestamp as created_timestamp FROM hr_dq.corp_identity_dq_error_details NOLOCK
            UNION ALL
            SELECT "SUPERVISOR" as interface_name,"INBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, dc_created_timestamp as created_timestamp FROM hr_dq.supvrsys_supervisor_mapping_dq_error_details NOLOCK
            UNION ALL
            SELECT "REPLICON" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,"Not available in Interface" as ggid,"Not available in Interface" as pernr_id,ou_code,"Not available in Interface" as country_of_company, "Not Available in Interface" as employee_status_code, dc_created_timestamp as created_timestamp FROM
            hr_dq.replicon_leave_request_dq_error_details NOLOCK
            UNION ALL
            SELECT "HRDB" as interface_name ,"INBOUND" as interface_type,rule_column,severity,error_description,Global_Group_GGID as ggid,"Not available in Interface" as pernr,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.hrdb_employee_master_dq_error_details NOLOCK
            UNION ALL
            SELECT "INAZ" as interface_name,"INBOUND" as interface_type,rule_column,severity ,error_description,Global_Group as ggid,"Not available in Interface"  as pernr,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.inaz_employee_master_dq_error_details NOLOCK
            UNION ALL
            SELECT "MYC" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,Global_Group_ID as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.myc_employee_master_dq_error_details NOLOCK
            UNION ALL
            SELECT "SAPNL" as interface_name,"INBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,global_group as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,  "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sapnl_employee_master_dq_error_details NOLOCK
            UNION ALL
            SELECT "OLDSF" as interface_name,"INBOUND" as interface_type,rule_column,substr(severity, 10),error_description,Global_ID as ggid,"Not available in Interface" as pernr_id,ou_code,"Not available in Interface" as country_of_company, "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.oldsf_employee_master_dq_error_details NOLOCK

            UNION ALL
            SELECT UPPER(interface_name),"OUTBOUND" as interface_type,rule_column,severity ,error_description,global_group_id as ggid, pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.s4_employee_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name),"OUTBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_group_id as ggid, pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code,  created_timestamp  FROM datacloud_adm_dq.dtx_employee_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name),"OUTBOUND" as interface_type,rule_column,case when severity in ("business-error") then "error" when severity in ("technical-error") then "error" else "warning" end as severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.ibm_ecm_employee_dq_error_details NOLOCK
            UNION ALL
            SELECT UPPER(interface_name),"OUTBOUND" as interface_type,rule_column,substr(severity, 10),error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.concur_employee_dq_error_details NOLOCK
            UNION ALL


            SELECT UPPER(interface_name), interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code, created_timestamp  FROM datacloud_adm_dq.dtsi_employee_dq_error_details NOLOCK
           UNION ALL
          SELECT UPPER(interface_name), interface_type,rule_column,severity,error_description,global_id as ggid,"Not Available in Interface" pernr_id,ou_code,country_of_company,"Not Available in Interface"as employee_status_code, created_timestamp FROM datacloud_adm_dq.gras_savoye_employee_dq_error_details NOLOCK
           UNION ALL
          SELECT UPPER(interface_name), interface_type,rule_column,severity,error_description,global_group_id as ggid, pernr as pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.dpae_employee_dq_error_details NOLOCK
          UNION ALL
          SELECT UPPER(interface_name), interface_type,rule_column,severity,error_description,global_group_id as ggid,  pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.sgverzuimsignaal_employee_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_ABSENCE" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,global_group_id as ggid,PERNR_ID as pernr_id, ou_code, Country_of_Company,"Not Available in Interface" as  employee_status_code, dc_created_timestamp as created_timestamp FROM hr_dq.sfec_absence_master_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_JOB" as interface_name, "INBOUND" asinterface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,"Not Available in Interface" as pernr_id, ou_code, Country_of_Company,"Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sfec_job_position_master_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_LOCATION_MASTER" as interface_name, "INBOUND" asinterface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid, "Not Available in Interface" as pernr_id,ou_code,"Not Available in Interface" as Country_of_Company, "Not Available in Interface"  as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sfec_location_master_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_LOV_MASTER" as interface_name, "INBOUND" asinterface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid, "Not Available in Interface" as pernr_id,ou_code, "Not Available in Interface" as country_of_company,"Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp  FROM hr_dq.sfec_lov_master_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_PAY_COMPONENT" as interface_name, "INBOUND" asinterface_type,rule_column,severity,error_description,Global_Group_ID as ggid, pernr_id,ou_code,"Not Available in Interface" as Country_of_Company, "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sfec_pay_component_dq_error_details NOLOCK
          UNION ALL
          SELECT "SFEC_VOLUNTARY" as interface_name, "INBOUND" asinterface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,  PERNR AS pernr_id,ou_code,"Not Available in Interface" as country_of_company,  "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sfec_voluntary_separation_dq_error_details NOLOCK
         UNION ALL
        SELECT "SFEC_BANK" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,"Not Available in Interface" as ggid,"Not Available in Interface"  AS pernr_id, ou_code, "Not Available in Interface" as Country_of_Company, "Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp  FROM hr_dq.sfec_bank_master_dq_error_details NOLOCK
        UNION ALL
        SELECT UPPER(interface_name), interface_type,rule_column,severity,error_description,global_group_id as ggid, "Not Available in Interface" as  pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.spain_new_portal_employee_dq_error_details NOLOCK
        UNION ALL
        SELECT interface_name, interface_type,rule_column,severity,error_description,ggid,PERNR AS pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.sig_dq_error_details NOLOCK
        UNION ALL
        SELECT "CAPP" ASinterface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.capp_dq_error_details NOLOCK
          UNION ALL
        SELECT "CGVERZUIMSIGNAAL" AS interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,created_timestamp  FROM datacloud_adm_dq.cgverzuimsignaal_dq_error_details NOLOCK
        UNION ALL
        SELECT "IMAGENOW_BNL_SOGETI" AS interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.imagenow_bnl_sogeti_dq_error_details NOLOCK
        UNION ALL
        SELECT "IMAGENOW_BNL_CAPGEMINI" AS interface_name, interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr_id,ou_code,country_of_company, "Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.imagenow_bnl_capgemini_dq_error_details NOLOCK
        UNION ALL
        SELECT "REPLICON_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,error_description, "Not available in interface" as ggid,   pernr as pernr_id, ou_code,country_of_company,"Not Available in Interface" as employee_status_code,created_timestamp FROM datacloud_adm_dq.replicon_employee_dq_error_details NOLOCK
        UNION ALL
            SELECT "REPLICON_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid, "" as pernr_id," "as ou_code, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
      SELECT "UKRAINE_CUBE" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description, ggid,"Not Available in Interface"  AS pernr_id,  ou_code, country_of_company,"Not Available in Interface"  as employee_status_code,dc_created_timestamp as created_timestamp  FROM hr_dq.cube_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "COSTARICA" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, "Not Available in Interface"  AS pernr_id,ou_code,  country_of_company,"Not Available in Interface" as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.costarica_employee_master_dq_error_details NOLOCK
      UNION ALL
       SELECT "GREECE" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid,"Not Available in Interface"  AS pernr_id,ou_code,  country_of_company,  EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.greece_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "RBI_BRAZIL" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, "Not Available in Interface"  AS pernr_id,ou_code,  country_of_company,  EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.rdi_brazil_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "RBI_HUNGARY" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, "Not Available in Interface"  AS pernr_id,ou_code,  country_of_company, EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.rdi_hungary_employee_master_dq_error_details NOLOCK
      UNION ALL
       SELECT "COLOMBIA" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, "Not Available in Interface"  AS pernr_id, ou_code, country_of_company,EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.colombia_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "SOGETIUSA" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, ou_code,"Not Available in Interface"  AS pernr_id,  country_of_company, EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.sogetiusa_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "ARGENTINA" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid, "Not Available in Interface"  AS pernr_id, ou_code, country_of_company,EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.argentina_employee_master_dq_error_details NOLOCK
      UNION ALL
      SELECT "SPAIN_NEW_PORTAL" as interface_name, "OUTBOUND" as interface_type,rule_column,severity,error_description,global_group_id as ggid,"NOT AVAILABLE IN INTERFACE" AS pernr_id,ou_code,country_of_company,"Not Available in Interface" as employee_status_code, created_timestamp FROM datacloud_adm_dq.spain_new_portal_employee_dq_error_details NOLOCK
      UNION ALL
      SELECT "CAMBRIDGE" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid,"NOT AVAILABLE IN INTERFACE" AS pernr_id,ou_code,Country_of_Company,   EMPLOYEE_STATUS as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.cambridge_employee_master_dq_error_details NOLOCK
      UNION ALL
        SELECT "UKRAINE_CUBE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code,   "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
        UNION ALL
        SELECT "COSTARICA" as interface_name, "INBOUND" as interface_type,rule_column,severity,error_description,GLOBAL_ID as ggid,"Not Available in Interface" as pernr_id,ou_code,Country_of_Company, "Not Available in Interface"  as employee_status_code,dc_created_timestamp as created_timestamp FROM hr_dq.costarica_employee_master_dq_error_details NOLOCK
      UNION ALL
        SELECT "COSTARICA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid, "" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "GREECE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "RDI_BRAZIL" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "RDI_HUNGARY" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "COLOMBIA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid, "" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "SOGETIUSA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid, "" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "ARGENTINA" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code,"" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "CAMBRIDGE" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid, "" as pernr_id," "as ou_code, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp
      UNION ALL
        SELECT "SPAIN_NEW_PORTAL" as interface_name ,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ggid,"" as pernr_id," "as ou_code, "" as country_of_company," " employee_status_code,timestamp("1900-01-01") as created_timestamp



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

    dimension: employee_status_code {
      type: string
      sql: ${TABLE}.employee_status_code ;;
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
    measure: max_date{
      type: date
      label: "Max Date"
      sql: select  created_timestamp from `premi0570223-dc4prd.datacloud_adm_dq.corp_employee_dq_active_error_details` order by
        created_timestamp desc limit 1 ;;
      value_format: "yyyy-dd-mm"
    }
  }
