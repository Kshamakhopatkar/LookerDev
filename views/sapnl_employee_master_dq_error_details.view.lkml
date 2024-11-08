view: sapnl_employee_master_dq_error_details {

  derived_table: {
    sql:
   SELECT interface_name as  interface_name ,UPPER(interface_type) as interface_type,rule_column, severity, global_group_id as ggid,error_description,ou_code, pernr_id,country_of_company, "Not Available in interface" as employee_status_code, created_timestamp as dc_created_timestamp FROM
             datacloud_adm_dq.gbi_employee_dq_active_error_details;;
}
  dimension:ggid1  {
    label_from_parameter: select_ggid
    type: string
    sql:
    {% if select_ggid._parameter_value == '46041295' %}
    ${global_group}
    {% elsif ${select_ggid}._parameter_value == '1561972' %}
    ${global_group}
    {% else %}
    ${global_group}
    {% endif %} ;;
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
  dimension: global_group {
    type: string
    sql: ${TABLE}.global_group ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
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
  parameter: select_ggid {
    type: unquoted

    allowed_value: {

      value: "46041295"

      label: "46041295"

    }

    allowed_value: {

      value: "46275132"

      label: "46275132"

    }

    allowed_value: {

      value: "1561972"

      label: "1561972"

    }

  }


  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }
  measure: count {
    type: count
  }
}
