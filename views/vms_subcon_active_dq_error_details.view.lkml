view: vms_subcon_active_dq_error_details {
  derived_table: {
    sql:SELECT "VMS_SUBCON" as interface_name ,"INBOUND" as interface_type,rule_column,
Country_of_Company, error_description,ggid
FROM procure_dq.vms_subcon_active_dq_error_details ;;
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
   dimension: data_scan_id {
    type: string
    sql: ${TABLE}.data_scan_id ;;
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
    sql: ${TABLE}.ggid ;;
  }
  dimension: rule_column {
    type: string
    sql: ${TABLE}.rule_column ;;
  }
  dimension: rule_type {
    type: string
    sql: ${TABLE}.rule_type ;;
  }

  dimension: work_order_id {
    type: string
    sql: ${TABLE}.work_order_id ;;
  }
  measure: count {
    type: count
  }
}
