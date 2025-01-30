view: replicon_project_active_dq_error_details {
  derived_table: {
    sql: SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, rule_column , severity, error_description,"Not available in interface" as ou_code,  Project_Code, "Not available in interface" as CostTypeURI ,   Country_of_Company,  blocked_since from datacloud_adm_dq.replicon_project_active_dq_error_details
    UNION ALL
    SELECT "PROJECTACTIVE" as  interface_name, "OUTBOUND" as interface_type, " " as rule_column ," " as  severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, " " as ou_code,  " " as Project_Code, " " as CostTypeURI ," " as  country_of_company,("1900-01-01") as blocked_since

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
