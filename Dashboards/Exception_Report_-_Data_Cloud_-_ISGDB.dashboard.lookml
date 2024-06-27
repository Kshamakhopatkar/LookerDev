---
- dashboard: exception_report__data_cloud__isgdb
  title: Exception Report - Data Cloud - ISGDB
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: OGw8kYUYItfqwNqYw265rS
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: isgdb_employee_exception_details
    type: looker_grid
    fields: [isgdb_employee_exception_details.interface_name, isgdb_employee_exception_details.interface_type,
      isgdb_employee_exception_details.rule_column, isgdb_employee_exception_details.severity,
      isgdb_employee_exception_details.error_description, isgdb_employee_exception_details.ggid,
      isgdb_employee_exception_details.pernr, isgdb_employee_exception_details.ou_code,
      isgdb_employee_exception_details.country_of_company, isgdb_employee_exception_details.created_timestamp_time]
    filters: {}
    sorts: [isgdb_employee_exception_details.created_timestamp_time desc]
    limit: 500
    column_limit: 50
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      isgdb_employee_exception_details.interface_name: INTERFACE NAME
      isgdb_employee_exception_details.interface_type: INTERFACE TYPE
      isgdb_employee_exception_details.rule_column: RULE COLUMN
      isgdb_employee_exception_details.error_description: EXCEPTION DESCRIPTION
      isgdb_employee_exception_details.ggid: GGID
      isgdb_employee_exception_details.pernr: PERNR ID
      isgdb_employee_exception_details.ou_code: OU CODE
      isgdb_employee_exception_details.country_of_company: COUNTRY OF OU CODE
      isgdb_employee_exception_details.created_timestamp_time: DC BATCH TIMESTAMP
      isgdb_employee_exception_details.severity: EXCEPTION TYPE
    header_background_color: "#51ccc5"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      GGID: isgdb_employee_exception_details.ggid
      PERNR ID: isgdb_employee_exception_details.pernr
      OU CODE: isgdb_employee_exception_details.ou_code
      COUNTRY OF OU CODE: isgdb_employee_exception_details.country_of_company
      'Select Batch Date Range:': isgdb_employee_exception_details.created_timestamp_time
      EXCEPTION TYPE: isgdb_employee_exception_details.severity
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
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.ggid
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
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.pernr
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
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.severity
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
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.ou_code
  - name: COUNTRY OF OU CODE
    title: COUNTRY OF OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: Emp_DQ_Errors
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.country_of_company
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
    explore: isgdb_employee_exception_details
    listens_to_filters: []
    field: isgdb_employee_exception_details.created_timestamp_time
