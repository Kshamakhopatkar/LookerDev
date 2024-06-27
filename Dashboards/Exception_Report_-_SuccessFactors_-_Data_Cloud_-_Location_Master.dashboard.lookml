---
- dashboard: exception_report__successfactors__data_cloud__location_master
  title: Exception Report - SuccessFactors - Data Cloud - Location Master
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wienq1L3iS5fPCQ2CVVhlP
  elements:
  - title: sfec_location_master_dq_exceptions
    name: sfec_location_master_dq_exceptions
    model: Emp_DQ_Errors
    explore: sfec_location_master_dq_error_details
    type: looker_grid
    fields: [sfec_location_master_dq_error_details.rule_column, sfec_location_master_dq_error_details.severity,
      sfec_location_master_dq_error_details.error_description, sfec_location_master_dq_error_details.ou_code,
      sfec_location_master_dq_error_details.country_of_company, sfec_location_master_dq_error_details.dc_created_timestamp_time]
    sorts: [sfec_location_master_dq_error_details.dc_created_timestamp_time desc]
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
      sfec_location_master_dq_error_details.rule_column: RULE COLUMN
      sfec_location_master_dq_error_details.severity: EXCEPTION TYPE
      sfec_location_master_dq_error_details.error_description: EXCEPTION DESCRIPTION
      sfec_location_master_dq_error_details.ou_code: OU CODE
      sfec_location_master_dq_error_details.country_of_company: COUNTRY OF OU CODE
      sfec_location_master_dq_error_details.dc_created_timestamp_time: DC BATCH TIMESTAMP
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    listen:
      OU CODE: sfec_location_master_dq_error_details.ou_code
      'Select Batch Date Range:': sfec_location_master_dq_error_details.dc_created_timestamp_time
      COUNTRY OF OU CODE: sfec_location_master_dq_error_details.country_of_company
      EXCEPTION TYPE: sfec_location_master_dq_error_details.severity
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: EXCEPTION TYPE
    title: EXCEPTION TYPE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: sfec_location_master_dq_error_details
    listens_to_filters: []
    field: sfec_location_master_dq_error_details.severity
  - name: OU CODE
    title: OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: sfec_location_master_dq_error_details
    listens_to_filters: []
    field: sfec_location_master_dq_error_details.ou_code
  - name: COUNTRY OF OU CODE
    title: COUNTRY OF OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors
    explore: sfec_location_master_dq_error_details
    listens_to_filters: []
    field: sfec_location_master_dq_error_details.country_of_company
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
    explore: sfec_location_master_dq_error_details
    listens_to_filters: []
    field: sfec_location_master_dq_error_details.dc_created_timestamp_time
