view: Employee_historical_new_joiner {
  derived_table: {
    sql: SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,global_group_id as ggid,pernr,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.gdh_newjoiner_dq_error_details
            UNION ALL
            SELECT UPPER(interface_name) as interface_name ,UPPER(interface_type) as interface_type,rule_column,severity,error_description,globalgroupid as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.corp_newjoiner_dq_error_details
            UNION ALL
            SELECT "SERVICE CENTRAL_NEW JOINER_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,error_description,"Not available in Interface" as ggid,"Not available in Interface" as pernr_id,ou_code,country_of_company,created_timestamp FROM
            datacloud_adm_dq.servicecentral_newjoiner_dq_error_details
            UNION ALL
            SELECT "SFEC_NEW JOINER_EMPLOYEE" as interface_name ,"OUTBOUND" as interface_type,rule_column,severity,error_description, Global_Group_ID as ggid, PERNR as pernr_id,ou_code,country_of_company, dc_created_timestamp FROM
            hr_dq.sfec_newjoiner_dq_error_details

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
