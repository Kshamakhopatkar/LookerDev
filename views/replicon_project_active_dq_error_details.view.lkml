view: replicon_project_active_dq_error_details {
  derived_table: {
    sql:
<<<<<<< HEAD
    SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description,"Not available in interface" as ou_code,  "Not available in interface" as ProjectTaskCode, "Not available in interface" as CostTypeURI ,   Country_of_Company,  blocked_since from datacloud_adm_dq.replicon_project_active_dq_error_details
    UNION ALL
    SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, " " as rule_column ," " as  severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ou_code,  " " as ProjectTaskCode, " " as CostTypeURI ," " as  country_of_company,("1900-01-01") as blocked_since
=======
    SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description,company_code as ou_code ,  project_code as project_task_code, "Not available in interface" as CostTypeURI , country_of_company from datacloud_adm_dq.replicon_project_active_dq_error_details
union all
SELECT "PROJECTTASK" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description, ou_code,  project_task_code, "Not available in interface" as CostTypeURI , country_of_company from datacloud_adm_dq.replicon_project_task_active_dq_error_details
union all
SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, " " as rule_column ," " as  severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ou_code,  " " as project_task_code, " " as CostTypeURI ," " as  country_of_company
UNION ALL
SELECT "PROJECTTASK" as  interface_name, "OUTBOUND" as interface_type," " as rule_column ," " as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," " as ou_code, " " as project_task_code, " " as CostTypeURI ," " as country_of_company
>>>>>>> branch 'Main-branch' of git@github.com:aroramohit01/looker_connect_UAT.git
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

  dimension:  project_task_code {
    type: string
    sql: ${TABLE}. project_task_code ;;
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
