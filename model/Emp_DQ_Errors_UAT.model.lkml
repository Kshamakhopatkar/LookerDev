connection: "bigquery_looker_uat"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/Dashboards/*.dashboard.lookml"
explore: emp_dq_errors {
  label: "sfec_employee_dq_error_details"
  }
explore: finance_dq_org_errors {
  sql_always_where: rule_column NOT LIKE '%warning_message%' ;;
  label: "gfs_org_structure_dq_error_details"
}

explore: corp_identity_dq_error_details {
  label: "Corp_identity_dq_error_details"
}

explore: sfec_education_dq_error_details {
  label: "SFEC_Education_dq_error_details"
}

explore: sfec_location_master_dq_error_details {
  label: "sfec_location_master_dq_error_details"
}

explore: s4_org_structure_dq_error_details {
  sql_always_where: error_description NOT LIKE '%IGNORE:NO ACTION REQUIRED:Warning Message received in Feed%' ;;
  label: "s4_org_structure_dq_error_details"
}

explore: immidart_employee_dq_error_details {
  label: "immidart_employee_dq_error_details"
}

explore: gfs_employee_dq_error_details {
  label: "gfs_employee_dq_error_details"
}

explore: corp_employee_dq_error_details {
  label: "corp_employee_dq_error_details"
}

explore: gdh_employee_global_dq_error_details {
  label: "gdh_employee_global_dq_error_details"
}

explore: gdh_newjoiner_dq_error_details {
  label: "gdh_newjoiner_dq_error_details"
}

explore: isgdb_employee_exception_details {
  label: "isgdb_employee_exception_details"
}

explore: servicecentral_newjoiner_dq_error_details {
  label: "servicecentral_newjoiner_dq_error_details"
}

explore: psa_employee_dq_error_details {
  label: "psa_employee_dq_error_details"
}

explore: supvrsys_supervisor_mapping_dq_error_details {
  label: "supvrsys_supervisor_mapping_dq_error_details"
}
explore:replicon_leave_request_dq_error_details {
  label: "replicon_leave_request_dq_error_details"
}
explore: ics_legal_entity_dq_error_details {
  label: "ics_legal_entity_dq_error_details"
}
explore: clarity_employee_dq_error_details {
  label: "clarity_employee_dq_error_details"
}
explore: sfec_employee_active_dq_error_details {
  label: "sfec_employee_active_dq_error_details"
}
explore: gdh_gfs {

   # access_filter:{
    #field: interface_name
    #user_attribute:psa_users
  #}

  label: "Employee_Exceptions_Historical"
}

explore: s4_employee_dq_error_details {
  label: "s4_employee_dq_error_details"
}
explore: ibm_ecm_employee_dq_error_details {
  label: "ibm_ecm_employee_dq_error_details"
}
explore: dtx_employee_dq_error_details {
  label: "dtx_employee_dq_error_details"
}
explore: Employee_Exceptions_Active {

  sql_always_where: date(${created_timestamp_date}) > '2024-07-01' ;;
  label: "Employee_Exceptions_Active"
}
explore: Consolidated_1F_UAT {
  label: "consolidated_1F_UAT"
}
explore: Employee_historical_new_joiner {
  label: "Employee_NewJoiner_Exceptions_Historical"
}

explore: employee_new_joiner_active_exceptions {
  label: "employee_new_joiner_active_exceptions"
}
explore: whoz_assignment_dq_error_details {
  label: "whoz_assignment_dq_error_details"
}
explore: replicon_absence_request_dq_error_details {
  label: "replicon_absence_request_dq_error_details"
}
explore: cost_center {
  label: "cost_center"
}
explore: Consolidate_s4 {
  label: "Consolidate_s4"
}
explore: partner_io {
  label: "partner_io"
}
explore: gfs_task {
  label: "gfs_task"
}
explore: s4_work_item_dq_error_details {
  label: "s4_work_item_dq_error_details"
}
explore: whoz_assignment_active_dq_error_details {
  label: "whoz_assignment_active_dq_error_details"
}
explore: Replicon {
  label: "Replicon"
}
 explore: consolidate_project {
   label: "consolidate_project"
 }
explore: cost_center_active {
  label: "cost_center_active"
}
explore: s4_work_item_active_dq_error_details {
  label: "s4_work_item_active_dq_error_details"
}
explore: partner_io_active {
  label: "partner_io_active"
}
explore: consolidation_active_s4 {
  label: "consolidation_active_s4"
}
explore: consolidation_active_gfs {
  label: "consolidation_active_gfs"
}
explore: vms_subcon_dq_error_details {
  label: "vms_subcon_dq_error_details"
}
 explore: gfs_task_active_dq_error_details {
   label: "gfs_task_active_dq_error_details"
 }
explore: vms_subcon_active_dq_error_details {
  label: "vms_subcon_active_dq_error_details"
}
explore: sapnl_employee_master_dq_error_details {
  label: "sapnl_employee_master_dq_error_details"
}
explore: duplicate_records {}

explore: org_alternative_hierachy_active {
  label: "org_alternative_hierachy_active"
}
explore: ukr_org_structure_active_dq_error_details {
  label: "ukr_org_structure_active_dq_error_details"
}
explore: org_member_active {
  label: "org_member_active"
}
explore: FA_Segment_Plant_1BB_1BS_CC_PC_Active {
  label: "FA_Segment_Plant_1BB_1BS_CC_PC_Active"
}

explore: gfs_alternate_hierarchy_error_details {
  label: "gfs_alternate_hierarchy_error_details"
}
explore: Org_member {
  label: "Org_member"
}
explore: s4_GFS_org {
  label: "s4_GFS_org"
}
explore: FA_Segment_Plant_1BB_1BS_CC_PC {
  label: "FA_Segment_Plant_1BB_1BS_CC_PC"
}
explore: org_alternative_hierarchy {
  label: "org_alternative_hierarchy"
}
explore: Customer {
  label: "Customer"
}
explore:  Customer_Function {
  label: "Customer_Function"
}
