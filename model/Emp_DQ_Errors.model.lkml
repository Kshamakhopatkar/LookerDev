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
