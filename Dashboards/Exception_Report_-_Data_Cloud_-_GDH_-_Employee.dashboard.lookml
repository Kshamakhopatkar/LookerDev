---
- dashboard: exception_report__data_cloud__gdh__employee
  title: Exception Report - Data Cloud - GDH - Employee
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: W3EpA3DLPfZ1Wf1FSZbohA
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: gdh_employee_global_dq_error_details
    type: looker_grid
    fields: [gdh_employee_global_dq_error_details.interface_name, gdh_employee_global_dq_error_details.rule_column,
      gdh_employee_global_dq_error_details.severity, gdh_employee_global_dq_error_details.error_description,
      gdh_employee_global_dq_error_details.global_group_id, gdh_employee_global_dq_error_details.pernr_id,
      gdh_employee_global_dq_error_details.ou_code, gdh_employee_global_dq_error_details.country_of_company,
      gdh_employee_global_dq_error_details.created_timestamp_time]
    filters: {}
    sorts: [gdh_employee_global_dq_error_details.interface_name]
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
    column_order: [gdh_employee_global_dq_error_details.interface_name, interface_type,
      gdh_employee_global_dq_error_details.rule_column, gdh_employee_global_dq_error_details.severity,
      gdh_employee_global_dq_error_details.error_description, gdh_employee_global_dq_error_details.global_group_id,
      gdh_employee_global_dq_error_details.pernr_id, gdh_employee_global_dq_error_details.ou_code,
      gdh_employee_global_dq_error_details.country_of_company, gdh_employee_global_dq_error_details.created_timestamp_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gdh_employee_global_dq_error_details.interface_name: INTERFACE NAME
      gdh_employee_global_dq_error_details.rule_column: RULE COLUMN
      gdh_employee_global_dq_error_details.severity: EXCEPTION TYPE
      gdh_employee_global_dq_error_details.error_description: EXCEPTION DESCRIPTION
      gdh_employee_global_dq_error_details.global_group_id: GGID
      gdh_employee_global_dq_error_details.pernr_id: PERNR ID
      gdh_employee_global_dq_error_details.ou_code: OU CODE
      gdh_employee_global_dq_error_details.country_of_company: COUNTRY OF OU CODE
      gdh_employee_global_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
    header_background_color: "#51ccc5"
    defaults_version: 1
    listen:
      GGID: gdh_employee_global_dq_error_details.global_group_id
      OU CODE: gdh_employee_global_dq_error_details.ou_code
      PERNR ID: gdh_employee_global_dq_error_details.pernr_id
      'Select Batch Date Range:': gdh_employee_global_dq_error_details.created_timestamp_time
      COUNTRY OF OU CODE: gdh_employee_global_dq_error_details.country_of_company
      EXCEPTION TYPE: gdh_employee_global_dq_error_details.severity
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
      type: checkboxes
      display: popover
      options:
      - '1'
      - '2'
      - '3'
    model: Emp_DQ_Errors
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.global_group_id
  - name: PERNR ID
    title: PERNR ID
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
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.pernr_id
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
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.severity
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
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.ou_code
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
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 13:59 to 2024/06/24 13:59
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: gdh_employee_global_dq_error_details
    listens_to_filters: []
    field: gdh_employee_global_dq_error_details.created_timestamp_time
