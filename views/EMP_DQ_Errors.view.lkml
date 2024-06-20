view: emp_dq_errors {
  sql_table_name: `premi0436563-gitenter.hr_dq.sfec_employee_dq_error_details` ;;
  label: "Emp Errors Inbound"

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
      timeframes: [raw, time, date, month, quarter, year]
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
    dimension: ggid {
      type: string
      sql: ${TABLE}.GGID ;;
    }
    dimension: ou_code {
      type: string
      sql: ${TABLE}.ou_code ;;
    }
    dimension: pernr {
      type: string
      sql: ${TABLE}.PERNR ;;
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
    measure: count {
      type: count
    }
    measure: percentage {
      sql: count(*) / (select count(*) from `premi0436563-gitenter.hr_dq.sfec_employee_dq_error_details`) * 100 ;;
      value_format: "0.00\%"
    }
  }
