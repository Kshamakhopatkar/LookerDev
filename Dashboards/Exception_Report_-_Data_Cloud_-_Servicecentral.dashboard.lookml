---
- dashboard: exception_report__data_cloud__servicecentral
  title: Exception Report - Data Cloud - Servicecentral
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: AjTZtgqvNwiVPtGVSjDoYG
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    type: looker_grid
    fields: [servicecentral_newjoiner_dq_error_details.rule_type, servicecentral_newjoiner_dq_error_details.severity,
      servicecentral_newjoiner_dq_error_details.error_description, servicecentral_newjoiner_dq_error_details.global_group_id,
      servicecentral_newjoiner_dq_error_details.ou_code, servicecentral_newjoiner_dq_error_details.country_of_company,
      servicecentral_newjoiner_dq_error_details.created_timestamp_time]
    sorts: [servicecentral_newjoiner_dq_error_details.rule_type]
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
      servicecentral_newjoiner_dq_error_details.rule_type: RULE COLUMN
      servicecentral_newjoiner_dq_error_details.severity: EXCEPTION TYPE
      servicecentral_newjoiner_dq_error_details.error_description: EXCEPTION DESCRIPTION
      servicecentral_newjoiner_dq_error_details.global_group_id: GGID
      servicecentral_newjoiner_dq_error_details.ou_code: OU CODE
      servicecentral_newjoiner_dq_error_details.country_of_company: COUNTRY OF OU
        CODE
      servicecentral_newjoiner_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
    header_background_color: "#51ccc5"
    defaults_version: 1
    listen:
      GGID: servicecentral_newjoiner_dq_error_details.global_group_id
      OU CODE: servicecentral_newjoiner_dq_error_details.ou_code
      'Select Batch Date Range:': servicecentral_newjoiner_dq_error_details.created_timestamp_time
      COUNTRY OF OU CODE: servicecentral_newjoiner_dq_error_details.country_of_company
      EXCEPTION TYPE: servicecentral_newjoiner_dq_error_details.severity
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
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    listens_to_filters: []
    field: servicecentral_newjoiner_dq_error_details.global_group_id
  - name: EXCEPTION TYPE
    title: EXCEPTION TYPE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    listens_to_filters: []
    field: servicecentral_newjoiner_dq_error_details.severity
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
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    listens_to_filters: []
    field: servicecentral_newjoiner_dq_error_details.ou_code
  - name: COUNTRY OF OU CODE
    title: COUNTRY OF OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    listens_to_filters: []
    field: servicecentral_newjoiner_dq_error_details.country_of_company
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
    model: Emp_DQ_Errors_UAT
    explore: servicecentral_newjoiner_dq_error_details
    listens_to_filters: []
    field: servicecentral_newjoiner_dq_error_details.created_timestamp_time
