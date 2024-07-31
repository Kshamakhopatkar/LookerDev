  view: gdh_gfs {
    derived_table: {
      sql:  SELECT interface_name,interface_type,rule_column,severity,error_description,global_group_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gfs_employee_dq_error_details
            UNION ALL
            SELECT interface_name,interface_type,rule_column,severity,error_description,global_group_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gdh_newjoiner_dq_error_details
            UNION ALL
            SELECT interface_name,interface_type,rule_column,severity,error_description,global_group_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gdh_employee_global_dq_error_details
            UNION ALL
            SELECT interface_name,interface_type,rule_column,severity,error_description,globalgroupid,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.corp_employee_dq_error_details
            UNION ALL
            SELECT interface_name,interface_type,rule_column,severity,error_description,global_group_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.clarity_employee_dq_error_details
            UNION ALL
            SELECT interface_name,interface_type,rule_column,severity,error_description,global_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.psa_employee_dq_error_details
            UNION ALL
            SELECT "Sfec" as interface_name,"Inbound" as interface_type,rule_column,severity,error_description,GGID,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.sfec_employee_dq_error_details;;

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
    dimension: global_group_id {
      type: string
      description: "Employee GGID on which the exception is reported"
      sql: ${TABLE}.global_group_id;;
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
    dimension_group: created_timestamp {
      type: time
      description: "Timestamp for Batch Run"
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.created_timestamp ;;
    }
  }
