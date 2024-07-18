view: s4_org_structure_dq_error_details {
  sql_table_name: `finance_dq.s4_org_structure_dq_error_details` ;;

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
    timeframes: [raw, time, date, week, month, quarter, year]
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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dc_updated_timestamp ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception "
    sql: ${TABLE}.error_description ;;
  }
  dimension: error_value {
    type: string
    sql: ${TABLE}.error_value ;;
  }
  dimension: gfs_business_unit_code {
    type: string
    sql: ${TABLE}.gfs_business_unit_code ;;
  }
  dimension: gfs_discipline_code {
    type: string
    sql: ${TABLE}.gfs_discipline_code ;;
  }
  dimension: gfs_group_of_business_unit2_code {
    type: string
    sql: ${TABLE}.gfs_group_of_business_unit2_code ;;
  }
  dimension: gfs_group_of_business_unit3_code {
    type: string
    sql: ${TABLE}.gfs_group_of_business_unit3_code ;;
  }
  dimension: gfs_group_of_business_unit_code {
    type: string
    sql: ${TABLE}.gfs_group_of_business_unit_code ;;
  }
  dimension: gfs_org_operating_unit_code {
    type: string
    sql: ${TABLE}.gfs_org_operating_unit_code ;;
  }
  dimension: gfs_production_unit_code {
    type: string
    sql: ${TABLE}.gfs_production_unit_code ;;
  }
  dimension: gfs_strategic_business_unit_code {
    type: string
    sql: ${TABLE}.gfs_strategic_business_unit_code ;;
  }
  dimension: gfs_sub_bu_2_code {
    type: string
    sql: ${TABLE}.gfs_sub_bu_2_code ;;
  }
  dimension: gfs_sub_bu_3_code {
    type: string
    sql: ${TABLE}.gfs_sub_bu_3_code ;;
  }
  dimension: gfs_sub_bu_code {
    type: string
    sql: ${TABLE}.gfs_sub_bu_code ;;
  }
  dimension: hyperion_business_unit_code {
    type: string
    sql: ${TABLE}.hyperion_business_unit_code ;;
  }
  dimension: ics_code {
    type: string
    sql: ${TABLE}.ics_code ;;
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
    sql: (select (case when severity in ('business-warning') then 'warning' when severity in ('business-error') then 'error' end) as severity from `premi0541131-dataclou.finance_dq.s4_org_structure_dq_error_details`)  ;;
  }
  measure: count {
    type: count
  }
}
