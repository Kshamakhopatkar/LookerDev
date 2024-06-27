---
- dashboard: exception_report__org_taxonomy
  title: Exception Report - Org Taxonomy
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Qw7MWT0FpaM27kwa1Ikood
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors_UAT
    explore: finance_dq_org_errors
    type: looker_grid
    fields: [finance_dq_org_errors.rule_column, finance_dq_org_errors.severity, finance_dq_org_errors.error_description,
      finance_dq_org_errors.gfs_business_unit_code, finance_dq_org_errors.ics_code,
      finance_dq_org_errors.ou_code, finance_dq_org_errors.dc_created_timestamp_time,
      finance_dq_org_errors.gfs_discipline_code, finance_dq_org_errors.gfs_group_of_business_unit_code,
      finance_dq_org_errors.gfs_group_of_business_unit2_code, finance_dq_org_errors.gfs_group_of_business_unit3_code,
      finance_dq_org_errors.gfs_org_operating_unit_code, finance_dq_org_errors.gfs_production_unit_code,
      finance_dq_org_errors.gfs_strategic_business_unit_code, finance_dq_org_errors.gfs_sub_bu_3_code,
      finance_dq_org_errors.gfs_sub_bu_2_code, finance_dq_org_errors.gfs_sub_bu_code,
      finance_dq_org_errors.hyperion_business_unit_code]
    filters: {}
    sorts: [finance_dq_org_errors.dc_created_timestamp_time desc]
    limit: 500
    column_limit: 50
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      finance_dq_org_errors.rule_column: RULE COLUMN
      finance_dq_org_errors.severity: EXCEPTION TYPE
      finance_dq_org_errors.error_description: EXCEPTION DESCRIPTION
      finance_dq_org_errors.gfs_business_unit_code: GFS BUSINESS UNIT CODE
      finance_dq_org_errors.ou_code: OU CODE
      finance_dq_org_errors.ics_code: ICS CODE
      finance_dq_org_errors.dc_created_timestamp_time: DC BATCH TIMESTAMP
      finance_dq_org_errors.gfs_discipline_code: GFS DISCIPLINE CODE
      finance_dq_org_errors.gfs_group_of_business_unit_code: GFS GROUP OF BUSINESS
        UNIT
      finance_dq_org_errors.gfs_group_of_business_unit2_code: GFS GROUP OF BUSINESS
        UNIT2 CODE
      finance_dq_org_errors.gfs_group_of_business_unit3_code: GFS GROUP OF BUSINESS
        UNIT3 CODE
      finance_dq_org_errors.gfs_org_operating_unit_code: GFS ORG OPERATING UNIT CODE
      finance_dq_org_errors.gfs_production_unit_code: GFS STRATEGIC BUSINESS UNIT
        CODE
      finance_dq_org_errors.gfs_strategic_business_unit_code: GFS STRATEGIC BUSINESS
        UNIT CODE
      finance_dq_org_errors.gfs_sub_bu_3_code: GFS SUB BU3 CODE
      finance_dq_org_errors.gfs_sub_bu_2_code: GFS SUB BU2 CODE
      finance_dq_org_errors.gfs_sub_bu_code: GFS SUB BU CODE
      finance_dq_org_errors.hyperion_business_unit_code: HYPERION BUSINESS UNIT CODE
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    column_order: [finance_dq_org_errors.rule_column, finance_dq_org_errors.severity,
      finance_dq_org_errors.error_description, finance_dq_org_errors.gfs_business_unit_code,
      finance_dq_org_errors.gfs_discipline_code, finance_dq_org_errors.gfs_group_of_business_unit_code,
      finance_dq_org_errors.gfs_group_of_business_unit2_code, finance_dq_org_errors.gfs_group_of_business_unit3_code,
      finance_dq_org_errors.gfs_org_operating_unit_code, finance_dq_org_errors.gfs_strategic_business_unit_code,
      finance_dq_org_errors.gfs_sub_bu_code, finance_dq_org_errors.gfs_sub_bu_2_code,
      finance_dq_org_errors.gfs_sub_bu_3_code, finance_dq_org_errors.hyperion_business_unit_code,
      finance_dq_org_errors.gfs_production_unit_code, finance_dq_org_errors.ou_code,
      finance_dq_org_errors.ics_code, finance_dq_org_errors.dc_created_timestamp_time]
    listen:
      ICS CODE: finance_dq_org_errors.ics_code
      OU CODE: finance_dq_org_errors.ou_code
      GFS BUSINESS UNIT CODE: finance_dq_org_errors.gfs_business_unit_code
      'Select Batch Date Range:': finance_dq_org_errors.dc_created_timestamp_time
      EXCEPTION TYPE: finance_dq_org_errors.severity
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: GFS BUSINESS UNIT CODE
    title: GFS BUSINESS UNIT CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: finance_dq_org_errors
    listens_to_filters: []
    field: finance_dq_org_errors.gfs_business_unit_code
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
    explore: finance_dq_org_errors
    listens_to_filters: []
    field: finance_dq_org_errors.severity
  - name: ICS CODE
    title: ICS CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: finance_dq_org_errors
    listens_to_filters: []
    field: finance_dq_org_errors.ics_code
  - name: OU CODE
    title: OU CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: finance_dq_org_errors
    listens_to_filters: []
    field: finance_dq_org_errors.ou_code
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 15:44 to 2024/06/24 15:44
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors_UAT
    explore: finance_dq_org_errors
    listens_to_filters: []
    field: finance_dq_org_errors.dc_created_timestamp_time
