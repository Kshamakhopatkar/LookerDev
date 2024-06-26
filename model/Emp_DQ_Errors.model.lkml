connection: "bigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: emp_dq_errors {
  label: "sfec_employee_dq_error_details"

  }
explore: finance_dq_org_errors {
  label: "gfs_org_structure_dq_error_details"
}

explore: outbound_gfs {
  label: "GFS"
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


#test connection

#test
