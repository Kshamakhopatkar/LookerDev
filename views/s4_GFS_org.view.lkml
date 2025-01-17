view: s4_GFS_org {
  derived_table: {
    sql: SELECT "S4" as interface_name,"INBOUND" as interface_type, error_description, error_value,gfs_org_operating_unit_code as ou_code, gfs_production_unit_code as PU_Code, rule_column, rule_type, ics_code,severity,dc_created_timestamp FROM
          finance_dq.s4_org_structure_dq_error_details

      UNION ALL
      SELECT "GFS" as interface_name,"INBOUND" as interface_type, error_description, error_value,gfs_org_operating_unit_code as ou_code, gfs_production_unit_code as PU_Code, rule_column, rule_type, ics_code,severity,dc_created_timestamp FROM
      finance_dq.gfs_org_structure_dq_error_details
      UNION ALL
      SELECT "S4" as interface_name,"INBOUND" as interface_type, "DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as error_value,"" as ou_code, "" as PU_Code, "" as rule_column, "" as rule_type, "" as ics_code,"" as severity,timestamp(current_date) AS dc_created_timestamp
      UNION ALL
      SELECT "GFS" as interface_name,"INBOUND" as interface_type, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,"" as error_value,"" as ou_code,"" as PU_Code," " as rule_column,"" as rule_type,"" as ics_code,"" as severity,timestamp(current_date) AS dc_created_timestamp;;
  }

  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
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
  dimension: ou_code {
    type: string
    sql: ${TABLE}.ou_code ;;
  }
  dimension: PU_Code {
    type: string
    sql: ${TABLE}.PU_Code ;;
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
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }
  measure: count {
    type: count
  }
}
