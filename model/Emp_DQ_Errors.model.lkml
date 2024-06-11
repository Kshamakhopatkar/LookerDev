connection: "bigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: emp_dq_errors {
  label: "Emp Errors Inbound"

  }
