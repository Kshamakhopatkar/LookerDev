view: partner_io {
  derived_table: {
    sql:
      SELECT "S4_WBS_Partner" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, Partner_Function, WBS_Element as IO_Number,dc_created_timestamp FROM finance_dq.s4_wbs_partner_dq_error_details where error_description not like 'business-error: It should be null '
UNION ALL
SELECT "S4_WBS_Partner" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as Partner_Function, "" as IO_Number,timestamp("1900-01-01") as dc_created_timestamp
              UNION ALL
              SELECT "S4_IO_Partner" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,Partner_role as Partner_Function,IO_number, dc_created_timestamp FROM finance_dq.s4_partner_io_dq_error_details
UNION ALL
SELECT "S4_IO_Partner" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as Partner_Function, "" as IO_Number,timestamp("1900-01-01") as dc_created_timestamp
 UNION ALL
      SELECT "IBM_ECM_IO" as interface_name ,"OUTBOUND" as interface_type ,rule_column, severity,error_description,"Not Available in Interface" as  global_group_id,"Not Available in Interface" as pernr_id,"Not Available in Interface" as ou_code, project_number,"Not Available in Interface" as legal_entity, created_timestamp FROM datacloud_adm_dq.ibm_ecm_io_dq_error_details
      UNION ALL
      SELECT "IBM_ECM_IO" as interface_name ,"OUTBOUND" as interface_type ,"" as rule_column, "" as severity,"" as error_description,"e" as  global_group_id,"" as pernr_id,"" as ou_code, "" as project_number,"" as legal_entity,timestamp("1900-01-01") as created_timestamp
      UNION ALL
      SELECT "IBM_ECM_WBS" as interface_name ,"OUTBOUND" as interface_type ,rule_column,  severity,error_description,"Not Available in Interface" as  global_group_id,"Not Available in Interface" as pernr_id,"Not Available in Interface" as ou_code, project_number, "Not Available in Interface" as legal_entity,created_timestamp FROM datacloud_adm_dq.ibm_ecm_wbs_dq_error_details
       UNION ALL
      SELECT "IBM_WBS" as interface_name ,"OUTBOUND" as interface_type ,"" as rule_column,  "" as severity,"" as error_description,"" as global_group_id,"" as pernr_id,"" as ou_code,"" as project_number, "" as legal_entity, timestamp("1900-01-01") as dc_created_timestamp

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

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }

  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }


  dimension:Partner_Function  {
    type: string
    sql: ${TABLE}.Partner_Function ;;
  }
  dimension: IO_number {
    type: string
    sql: ${TABLE}.IO_number ;;
  }

  dimension_group: dc_created_timestamp {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
}
