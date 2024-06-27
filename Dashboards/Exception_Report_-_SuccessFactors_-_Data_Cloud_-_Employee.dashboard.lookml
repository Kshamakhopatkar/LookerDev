---
- dashboard: exception_report__successfactors__data_cloud__employee
  title: Exception Report - SuccessFactors - Data Cloud - Employee
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 95ntZMIiwgktyNSp942659
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors
    explore: emp_dq_errors
    type: looker_grid
    fields: [emp_dq_errors.rule_column, emp_dq_errors.severity, emp_dq_errors.error_description,
      emp_dq_errors.ggid, emp_dq_errors.pernr, emp_dq_errors.ou_code, emp_dq_errors.country_of_company,
      emp_dq_errors.dc_created_timestamp_time]
    sorts: [emp_dq_errors.dc_created_timestamp_time desc]
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
    pinned_columns: {}
    column_order: [emp_dq_errors.rule_column, emp_dq_errors.severity, emp_dq_errors.error_description,
      emp_dq_errors.ggid, emp_dq_errors.pernr, emp_dq_errors.ou_code, emp_dq_errors.country_of_company,
      emp_dq_errors.dc_created_timestamp_date, emp_dq_errors.dc_source_id, emp_dq_errors.dc_lineage_id,
      emp_dq_errors.dc_file_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      emp_dq_errors.error_description: EXCEPTION DESCRIPTION
      emp_dq_errors.rule_column: RULE COLUMN
      emp_dq_errors.severity: EXCEPTION TYPE
      emp_dq_errors.ggid: GGID
      emp_dq_errors.pernr: PERNR ID
      emp_dq_errors.ou_code: OU CODE
      emp_dq_errors.country_of_company: COUNTRY OF OU CODE
      emp_dq_errors.dc_created_timestamp_date: DC BATCH TIMESTAMP
      emp_dq_errors.dc_created_timestamp_time: DC BATCH TIMESTAMP
    series_column_widths:
      emp_dq_errors.error_description: 87
      emp_dq_errors.country_of_company: 117
      emp_dq_errors.dc_created_timestamp_time: 130
    series_text_format:
      emp_dq_errors.dc_created_timestamp_time: {}
    header_background_color: "#51ccc5"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      GGID: emp_dq_errors.ggid
      OU CODE: emp_dq_errors.ou_code
      'Select Batch Date Range:': emp_dq_errors.dc_created_timestamp_minute
      PERNR ID: emp_dq_errors.pernr
      COUNTRY OF OU CODE: emp_dq_errors.country_of_company
      EXCEPTION TYPE: emp_dq_errors.severity
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.ggid
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.pernr
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.severity
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.ou_code
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.country_of_company
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
    explore: emp_dq_errors
    listens_to_filters: []
    field: emp_dq_errors.dc_created_timestamp_minute
