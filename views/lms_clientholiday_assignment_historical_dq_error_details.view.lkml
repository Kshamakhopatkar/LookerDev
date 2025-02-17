view: lms_clientholiday_assignment_historical_dq_error_details {
  derived_table: {
    sql:SELECT "CLIENTHOLIDAYCALENDAR" as interface_name,"INBOUND" as interface_type,rule_column, severity, error_description,EmployeeClientHolidayTaggingID, country_of_company,"Not available in interface" as ggid,"Not available in interface" as localid,"Not available in interface" as Holiday_calenderName, "Not available in interface" as ou_code ,"Not available in interface" as employeeid,dc_created_timestamp  FROM gtm_dq.lms_clientholiday_assignment_dq_error_details
          UNION ALL
          SELECT "CLIENTHOLIDAYCALENDAR" as interface_name ,"INBOUND" as interface_type ,rule_column, severity,error_description, "Not available in interface" as EmployeeClientHolidayTaggingID,"Not available in interface" as country_of_company,globalid as ggid,"Not available in interface" as localid,"Not available in interface" as Holiday_calenderName,ou_code, employeeid, created_timestamp as blocked_since FROM datacloud_adm_dq.lms_employee_dq_error_details
          union all

      SELECT "CLIENTHOLIDAYCALENDAR" as interface_name,"INBOUND" as interface_type,"" as rule_column, "" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as EmployeeClientHolidayTaggingID, "" as country_of_company,"" as ggid,"" as localid,"" as Holiday_calenderName, "" as ou_code ,"" as employeeid,timestamp ("1900-01-01") as created_timestamp
      UNION ALL
      SELECT "CLIENTHOLIDAYCALENDAR" as interface_name ,"INBOUND" as interface_type ,"" as rule_column, "" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as EmployeeClientHolidayTaggingID,"" as country_of_company,"" as ggid,"" as localid,"" as Holiday_calenderName,"" as ou_code, "" as employeeid, timestamp("1900-01-01") as created_timestamp
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
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: EmployeeClientHolidayTaggingID {
    type: string
    sql: ${TABLE}.EmployeeClientHolidayTaggingID ;;
  }
  dimension: country_of_company {
    type: string
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: ggid {
    type: string
    sql: ${TABLE}.ggid ;;

  }
  dimension: localid {
    type: string
    sql: ${TABLE}.localid ;;

  }
  dimension: Holiday_calenderName {
    type: string
    sql: ${TABLE}.Holiday_calenderName ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: employeeid {
    type: string
    sql: ${TABLE}.employeeid ;;
  }
  dimension_group: blocked_since {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }

  measure: count {
    type: count
  }
}
