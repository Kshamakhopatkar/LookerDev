---
- dashboard: exception_report__data_cloud__psa_employee
  title: Exception Report - Data Cloud - PSA Employee
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LOC3TWEUh2zorCzdlSVRgd
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    type: looker_grid
    fields: [psa_employee_dq_error_details.interface_name, psa_employee_dq_error_details.interface_type,
      psa_employee_dq_error_details.rule_column, psa_employee_dq_error_details.severity,
      psa_employee_dq_error_details.error_description, psa_employee_dq_error_details.global_id,
      psa_employee_dq_error_details.ou_code, psa_employee_dq_error_details.country_of_company,
      psa_employee_dq_error_details.created_timestamp_time]
    sorts: [psa_employee_dq_error_details.created_timestamp_time desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      psa_employee_dq_error_details.interface_name: INTERFACE NAME
      psa_employee_dq_error_details.rule_column: RULE COLUMN
      psa_employee_dq_error_details.severity: EXCEPTION TYPE
      psa_employee_dq_error_details.error_description: EXCEPTION DESCRIPTION
      psa_employee_dq_error_details.global_id: GGID
      psa_employee_dq_error_details.ou_code: OU CODE
      psa_employee_dq_error_details.country_of_company: COUNTRY OF OU CODE
      psa_employee_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
      psa_employee_dq_error_details.interface_type: INTERFACE TYPE
    header_background_color: "#51ccc5"
    defaults_version: 1
    listen:
      GGID: psa_employee_dq_error_details.global_id
      OU CODE: psa_employee_dq_error_details.ou_code
      'Select Batch Date Range:': psa_employee_dq_error_details.created_timestamp_time
      COUNTRY OF OU CODE: psa_employee_dq_error_details.country_of_company
      EXCEPTION TYPE: psa_employee_dq_error_details.severity
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: GGID
    title: GGID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    listens_to_filters: []
    field: psa_employee_dq_error_details.global_id
  - name: EXCEPTION TYPE
    title: EXCEPTION TYPE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    listens_to_filters: []
    field: psa_employee_dq_error_details.severity
  - name: OU CODE
    title: OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - '1'
      - '2'
      - '3'
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    listens_to_filters: []
    field: psa_employee_dq_error_details.ou_code
  - name: COUNTRY OF OU CODE
    title: COUNTRY OF OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    listens_to_filters: []
    field: psa_employee_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 13:56 to 2024/06/24 13:56
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: psa_employee_dq_error_details
    listens_to_filters: []
    field: psa_employee_dq_error_details.created_timestamp_time
