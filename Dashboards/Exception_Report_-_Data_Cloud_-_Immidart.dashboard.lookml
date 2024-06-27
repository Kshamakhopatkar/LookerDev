---
- dashboard: exception_report__data_cloud__immidart
  title: Exception Report - Data Cloud - Immidart
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nldc8fJlC3osn6VLr6RRbE
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: immidart_employee_dq_error_details
    type: looker_grid
    fields: [immidart_employee_dq_error_details.interface_name, immidart_employee_dq_error_details.rule_column,
      immidart_employee_dq_error_details.severity, immidart_employee_dq_error_details.error_description,
      immidart_employee_dq_error_details.pernr_id, immidart_employee_dq_error_details.ou_code,
      immidart_employee_dq_error_details.country_of_company, immidart_employee_dq_error_details.created_timestamp_time]
    sorts: [immidart_employee_dq_error_details.created_timestamp_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '"outbound"'
      label: INTERFACE TYPE
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: interface_type
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [immidart_employee_dq_error_details.interface_name, interface_type,
      immidart_employee_dq_error_details.rule_column, immidart_employee_dq_error_details.severity,
      immidart_employee_dq_error_details.error_description, immidart_employee_dq_error_details.pernr_id,
      immidart_employee_dq_error_details.ou_code, immidart_employee_dq_error_details.country_of_company,
      immidart_employee_dq_error_details.created_timestamp_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      immidart_employee_dq_error_details.interface_name: INTERFACE NAME
      immidart_employee_dq_error_details.rule_column: RULE COLUMN
      immidart_employee_dq_error_details.severity: EXCEPTION TYPE
      immidart_employee_dq_error_details.error_description: EXCEPTION DESCRIPTION
      immidart_employee_dq_error_details.pernr_id: PERNR ID
      immidart_employee_dq_error_details.ou_code: OU CODE
      immidart_employee_dq_error_details.country_of_company: COUNTRY OF OU CODE
      immidart_employee_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    listen:
      PERNR ID: immidart_employee_dq_error_details.pernr_id
      OU CODE: immidart_employee_dq_error_details.ou_code
      'Select Batch Date Range:': immidart_employee_dq_error_details.created_timestamp_time
      COUNTRY OF OU CODE: immidart_employee_dq_error_details.country_of_company
      EXCEPTION TYPE: immidart_employee_dq_error_details.severity
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: PERNR ID
    title: PERNR ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors
    explore: immidart_employee_dq_error_details
    listens_to_filters: []
    field: immidart_employee_dq_error_details.pernr_id
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
    explore: immidart_employee_dq_error_details
    listens_to_filters: []
    field: immidart_employee_dq_error_details.severity
  - name: OU CODE
    title: OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors
    explore: immidart_employee_dq_error_details
    listens_to_filters: []
    field: immidart_employee_dq_error_details.ou_code
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
    explore: immidart_employee_dq_error_details
    listens_to_filters: []
    field: immidart_employee_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: immidart_employee_dq_error_details
    listens_to_filters: []
    field: immidart_employee_dq_error_details.created_timestamp_time
