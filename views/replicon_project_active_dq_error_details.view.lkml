view: replicon_project_active_dq_error_details {
  derived_table: {

    sql:  SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description,company_code as ou_code ,  project_code as project_task_code, "Not available in interface" as CostTypeURI , country_of_company,  blocked_since from datacloud_adm_dq.replicon_project_active_dq_error_details
    UNION ALL
    SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, " " as rule_column ," " as  severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ou_code,  " " as Project_Code, " " as CostTypeURI ," " as  country_of_company,"" as  blocked_since
union all
SELECT "PROJECTTASK" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description, ou_code,  project_task_code, "Not available in interface" as CostTypeURI , country_of_company,"Not available in interface" as blocked_since from datacloud_adm_dq.replicon_project_task_active_dq_error_details
UNION ALL
SELECT "PROJECTTASK" as  interface_name, "OUTBOUND" as interface_type," " as rule_column ," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," " as ou_code, " " as project_task_code, " " as CostTypeURI ," " as country_of_company,"" as blocked_since
UNION ALL
SELECT "LOCATIONMASTER" as interface_name,"INBOUND" as interface_type,"" as rule_column," "as severity,"No DQ Rule" as error_description,  "" as  project_task_code,"" ou_code, ""  as CostTypeURI,  " " as country_of_company, "" as blocked_since
union all
  SELECT "PROJECTMASTER" as interface_name,"INBOUND" as interface_type,"" as rule_column,""as severity,"No DQ Rule" as error_description,  "" as  project_task_code,"" ou_code, ""  as CostTypeURI, " " as country_of_company,"" as blocked_since
  union all
  SELECT "ORGANIZATIONTAXONOMY" as interface_name,"INBOUND" as interface_type,"" as rule_column,""as severity,"No DQ Rule" as error_description,  "" as  project_task_code,"" ou_code, ""  as CostTypeURI,  " " as country_of_company,"" as blocked_since





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

  dimension:  project_code {
    type: string
    sql: ${TABLE}. project_code ;;
  }
  dimension:  CostTypeURI {
    type: string
    sql: ${TABLE}. CostTypeURI ;;
  }

  dimension_group: blocked_since {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record belongs"
    sql: ${TABLE}.ou_code ;;
  }

  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }

  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
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


  measure: count {
    type: count
  }
}
