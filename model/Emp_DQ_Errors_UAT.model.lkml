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
    access_filter:{
    field: interface_name
    user_attribute:psa_users
  }

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
explore: active_report_outbound {
  label: "Employee_Exceptions_Active"
}
explore: Consolidated_1F_UAT {
  label: "consolidated_1F_UAT"
}
explore: Employee_historical_new_joiner {
  label: "Employee_NewJoiner_Exceptions_Historical"
}
