view: replicon_holiday_calendar_dq_error_details {
  derived_table: {
    sql:SELECT "HOLIDAY CALENDAR" as interface_name,"INBOUND" as interface_type,rule_column, severity, error_description,id_office,holiday_calendar as Holiday_Name,"Not available in interface" as ggid, ou_code,"Not available in interface" as Country_Name,"Not available in interface" as Country_of_Company,  FROM gtm_dq.replicon_employee_hca_dq_error_details
UNION ALL
SELECT "HOLIDAY CALENDAR" as interface_name,"INBOUND" as interface_type,rule_column, severity, error_description,"Not available in interface" as id_office,Holiday_Name,"Not available in interface" as ggid,Country_Name,"Not available in interface" as ou_code,Country_of_Company,  FROM gtm_dq.replicon_holiday_calendar_dq_error_details
UNION ALL
SELECT "HOLIDAYCALENDAR" as interface_name,"INBOUND" as interface_type,"" as rule_column, "" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as id_office,"" as Holiday_Name,"" as ggid, "" as ou_code," " as Country_Name," " as Country_of_Company
UNION ALL
SELECT "HOLIDAYCALENDAR" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description," " as id_office,"" as Holiday_Name," " as ggid,"" as Country_Name," "as ou_code,"" as Country_of_Company     ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: Country_Name {
    type: string
    sql: ${TABLE}.Country_Name ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.Country_of_Company ;;
  }

  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }

  dimension: id_office {
    type: string
    sql: ${TABLE}.id_office ;;
  }
  dimension: Holiday_Name {
    type: string
    sql: ${TABLE}.Holiday_Name ;;
  }

  dimension: ggid {
    type: string
    sql: ${TABLE}.ggid ;;
  }

  dimension: ou_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.ou_code ;;
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
          END ;;
  }

  measure: count {
    type: count
  }
}
