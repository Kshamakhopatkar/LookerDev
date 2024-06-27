---
- dashboard: exception_report__data_cloud__corp
  title: Exception Report - Data Cloud - CORP
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: soKdFmwImGNzgrQeHJxBiK
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors_UAT
    explore: corp_employee_dq_error_details
    type: looker_grid
    fields: [corp_employee_dq_error_details.interface_name, corp_employee_dq_error_details.interface_type,
      corp_employee_dq_error_details.rule_column, corp_employee_dq_error_details.severity,
      corp_employee_dq_error_details.error_description, corp_employee_dq_error_details.globalgroupid,
      corp_employee_dq_error_details.ou_code, corp_employee_dq_error_details.country_of_company,
      corp_employee_dq_error_details.created_timestamp_time]
    filters:
      corp_employee_dq_error_details.created_timestamp_date: 2024/01/01 to 2024/06/22
    sorts: [corp_employee_dq_error_details.interface_name]
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
      corp_employee_dq_error_details.interface_name: INTERFACE NAME
      corp_employee_dq_error_details.rule_column: RULE COLUMN
      corp_employee_dq_error_details.severity: EXCEPTION TYPE
      corp_employee_dq_error_details.error_description: EXCEPTION DESCRIPTION
      corp_employee_dq_error_details.globalgroupid: GGID
      corp_employee_dq_error_details.ou_code: OU CODE
      corp_employee_dq_error_details.country_of_company: COUNTRY OF  OU CODE
      corp_employee_dq_error_details.created_timestamp_time: DC BATCH TIMESTAMP
      corp_employee_dq_error_details.interface_type: INTERFACE TYPE
    header_background_color: "#51ccc5"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    defaults_version: 1
    listen:
      OU CODE: corp_employee_dq_error_details.ou_code
      GGID: corp_employee_dq_error_details.globalgroupid
      Select Batch Date Range: corp_employee_dq_error_details.created_timestamp_time
      COUNTRY OF OU CODE: corp_employee_dq_error_details.country_of_company
      EXCEPTION TYPE: corp_employee_dq_error_details.severity
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
    model: Emp_DQ_Errors_UAT
    explore: corp_employee_dq_error_details
    listens_to_filters: []
    field: corp_employee_dq_error_details.globalgroupid
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
    explore: corp_employee_dq_error_details
    listens_to_filters: []
    field: corp_employee_dq_error_details.severity
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
    explore: corp_employee_dq_error_details
    listens_to_filters: []
    field: corp_employee_dq_error_details.ou_code
  - name: COUNTRY OF OU CODE
    title: COUNTRY OF OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: corp_employee_dq_error_details
    listens_to_filters: []
    field: corp_employee_dq_error_details.country_of_company
  - name: Select Batch Date Range
    title: Select Batch Date Range
    type: field_filter
    default_value: 2024/01/01 19:56 to 2024/06/21 19:56
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors_UAT
    explore: corp_employee_dq_error_details
    listens_to_filters: []
    field: corp_employee_dq_error_details.created_timestamp_time
