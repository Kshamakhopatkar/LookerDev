---
- dashboard: exception_report__data_cloud__gfsemployee
  title: Exception Report - Data Cloud - GFS-Employee
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kT5uOZjuevH9utzDzLHauN
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: gfs_employee_dq_error_details
    type: looker_grid
    fields: [gfs_employee_dq_error_details.interface_name, gfs_employee_dq_error_details.rule_column,
      gfs_employee_dq_error_details.severity, gfs_employee_dq_error_details.error_description,
      gfs_employee_dq_error_details.global_group_id, gfs_employee_dq_error_details.ou_code,
      gfs_employee_dq_error_details.country_of_company, gfs_employee_dq_error_details.created_timestamp_time]
    sorts: [gfs_employee_dq_error_details.created_timestamp_time desc]
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
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [gfs_employee_dq_error_details.interface_name, interface_type, gfs_employee_dq_error_details.rule_column,
      gfs_employee_dq_error_details.severity, gfs_employee_dq_error_details.error_description,
      gfs_employee_dq_error_details.global_group_id, gfs_employee_dq_error_details.ou_code,
      gfs_employee_dq_error_details.country_of_company, gfs_employee_dq_error_details.created_timestamp_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gfs_employee_dq_error_details.interface_name: INTERFACE NAME
      gfs_employee_dq_error_details.rule_column: RULE COLUMN
      gfs_employee_dq_error_details.error_description: EXCEPTION DESCRIPTION
      gfs_employee_dq_error_details.global_group_id: GGID
      gfs_employee_dq_error_details.ou_code: OU CODE
      gfs_employee_dq_error_details.country_of_company: COUNTRY OF OU CODE
      gfs_employee_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
      gfs_employee_dq_error_details.severity: EXCEPTION TYPE
    series_column_widths:
      gfs_employee_dq_error_details.error_description: 270
      gfs_employee_dq_error_details.interface_name: 111.33299999999997
      gfs_employee_dq_error_details.rule_column: 165
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    listen:
      GGID: gfs_employee_dq_error_details.global_group_id
      OU CODE: gfs_employee_dq_error_details.ou_code
      COUNTRY OF OU CODE: gfs_employee_dq_error_details.country_of_company
      'Select Batch Date Range:': gfs_employee_dq_error_details.created_timestamp_time
      EXCEPTION TYPE: gfs_employee_dq_error_details.severity
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
    explore: gfs_employee_dq_error_details
    listens_to_filters: []
    field: gfs_employee_dq_error_details.global_group_id
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
    explore: gfs_employee_dq_error_details
    listens_to_filters: []
    field: gfs_employee_dq_error_details.severity
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
    explore: gfs_employee_dq_error_details
    listens_to_filters: []
    field: gfs_employee_dq_error_details.ou_code
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
    explore: gfs_employee_dq_error_details
    listens_to_filters: []
    field: gfs_employee_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 19:59 to 2024/06/21 19:59
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: gfs_employee_dq_error_details
    listens_to_filters: []
    field: gfs_employee_dq_error_details.created_timestamp_time
