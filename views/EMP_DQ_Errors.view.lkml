view: emp_dq_errors {
  sql_table_name: `hr_dq.sfec_employee_dq_error_details` ;;
  label: "Emp Errors Inbound"

    dimension: country_of_company {
      type: string
      description: "Country of the Company code"
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
      description: "Timestamp for Batch Run"

      sql: ${TABLE}.dc_created_timestamp ;;
    }
    dimension: dc_file_id {
      type: string
      description: "Only required for Data Cloud Traceability"
      sql: ${TABLE}.dc_file_id ;;
    }
    dimension: dc_lineage_id {
      type: string
      description: "Only required for Data Cloud Traceability"
      sql: ${TABLE}.dc_lineage_id ;;
    }
    dimension: dc_rowhash {
      type: string
      sql: ${TABLE}.dc_rowhash ;;
    }
    dimension: dc_source_id {
      type: string
      description: "Only required for Data Cloud Traceability"
      sql: ${TABLE}.dc_source_id ;;
    }
    dimension_group: dc_updated_timestamp {
      type: time
      description: "Only required for Data Cloud Traceability"
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.dc_updated_timestamp ;;
    }
    dimension: error_description {
      type: string
      description: "Description of the Exception"
      sql: ${TABLE}.error_description ;;
    }
    dimension: error_value {
      type: string
      sql: ${TABLE}.error_value ;;
    }
    dimension: ggid {
      type: string
      description: "Employee GGID on which the exception is reported"
      sql: ${TABLE}.GGID ;;
    }
    dimension: ou_code {
      type: string
      description: "The Organization unit to which this Employee Record Belongs"
      sql: ${TABLE}.ou_code ;;
    }
    dimension: pernr {
      type: string
      description: "Employee PERNR on which this exception is reported"
      sql: ${TABLE}.PERNR ;;
    }
    dimension: rule_column {
      type: string
      description: "Column on which the Exception is reported"
      sql: ${TABLE}.rule_column ;;
    }
    dimension: rule_type {
      type: string
      sql: ${TABLE}.rule_type ;;
    }
    dimension: severity {
      type: string
      description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"
      sql: substr(severity, 10) ;;
    }

    measure: count {
      type: count
    }
    measure: percentage {
      sql: count(*) / (select count(*) from `premi0436563-gitenter.hr_dq.sfec_employee_dq_error_details`) * 100 ;;
      value_format: "0.00\%"
    }
  }
