---
- dashboard: exception_report__successfactors__data_cloud__education
  title: Exception Report - SuccessFactors - Data Cloud - Education
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: gvDisikbXHyOUj9yRaexD0
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors_UAT
    explore: sfec_education_dq_error_details
    type: looker_grid
    fields: [sfec_education_dq_error_details.rule_column, sfec_education_dq_error_details.severity,
      sfec_education_dq_error_details.error_description, sfec_education_dq_error_details.global_group_id,
      sfec_education_dq_error_details.pernr_id, sfec_education_dq_error_details.ou_code,
      sfec_education_dq_error_details.country_of_company, sfec_education_dq_error_details.dc_created_timestamp_time]
    sorts: [sfec_education_dq_error_details.dc_created_timestamp_time desc]
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
      sfec_education_dq_error_details.rule_column: RULE COLUMN
      sfec_education_dq_error_details.severity: EXCEPTION TYPE
      sfec_education_dq_error_details.error_description: EXCEPTION DESCRIPTION
      sfec_education_dq_error_details.global_group_id: GGID
      sfec_education_dq_error_details.ou_code: OU CODE
      sfec_education_dq_error_details.country_of_company: COUNTRY OF OU CODE
      sfec_education_dq_error_details.dc_created_timestamp_time: DC BATCH TIMESTAMP
      sfec_education_dq_error_details.pernr_id: PERNR ID
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    listen:
      GGID: sfec_education_dq_error_details.global_group_id
      OU CODE: sfec_education_dq_error_details.ou_code
      'Select Batch Date Range:': sfec_education_dq_error_details.dc_created_timestamp_time
      COUNTRY OF OU CODE: sfec_education_dq_error_details.country_of_company
      PERNR ID: sfec_education_dq_error_details.pernr_id
      EXCEPTION TYPE: sfec_education_dq_error_details.severity
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
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.global_group_id
  - name: PERNR ID
    title: PERNR ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.pernr_id
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
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.severity
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
    model: Emp_DQ_Errors_UAT
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.ou_code
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
    model: Emp_DQ_Errors_UAT
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 14:44 to 2024/06/24 14:44
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors_UAT
    explore: sfec_education_dq_error_details
    listens_to_filters: []
    field: sfec_education_dq_error_details.dc_created_timestamp_time
