view: replicon_employee_hca_dq_error_details {
  sql_table_name: `premi0541131-dataclou.gtm_dq.replicon_employee_hca_dq_error_details` ;;

  dimension: ch_hol_cal_cap {
    type: string
    sql: ${TABLE}.ch_hol_cal_cap ;;
  }
  dimension: ch_hol_cal_erd {
    type: string
    sql: ${TABLE}.ch_hol_cal_erd ;;
  }
  dimension: country_of_company {
    type: string
    sql: ${TABLE}.Country_of_Company ;;
  }
  dimension: data_quality_job_id {
    type: string
    sql: ${TABLE}.data_quality_job_id ;;
  }
  dimension: data_scan_id {
    type: string
    sql: ${TABLE}.data_scan_id ;;
  }
  dimension_group: dc_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_created_timestamp ;;
  }
  dimension: dc_file_id {
    type: string
    sql: ${TABLE}.dc_file_id ;;
  }
  dimension: dc_lineage_id {
    type: string
    sql: ${TABLE}.dc_lineage_id ;;
  }
  dimension: dc_rowhash {
    type: string
    sql: ${TABLE}.dc_rowhash ;;
  }
  dimension: dc_source_id {
    type: string
    sql: ${TABLE}.dc_source_id ;;
  }
  dimension_group: dc_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_updated_timestamp ;;
  }
  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: holiday_calendar {
    type: string
    sql: ${TABLE}.holiday_calendar ;;
  }
  dimension: id_office {
    type: string
    sql: ${TABLE}.id_office ;;
  }
  dimension: it_hol_cal_bank {
    type: string
    sql: ${TABLE}.it_hol_cal_bank ;;
  }
  dimension: it_hol_cal_metalwork {
    type: string
    sql: ${TABLE}.it_hol_cal_metalwork ;;
  }
  dimension: it_hol_cal_trade {
    type: string
    sql: ${TABLE}.it_hol_cal_trade ;;
  }
  dimension: member_name {
    type: string
    sql: ${TABLE}.member_name ;;
  }
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  dimension: sp_cba_1 {
    type: string
    sql: ${TABLE}.sp_cba_1 ;;
  }
  dimension: sp_cba_2 {
    type: string
    sql: ${TABLE}.sp_cba_2 ;;
  }
  measure: count {
    type: count
    drill_fields: [member_name]
  }
}
