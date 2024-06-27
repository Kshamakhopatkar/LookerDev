---
- dashboard: exception_report__s4_org_taxonomy
  title: Exception Report - S4- Org Taxonomy
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bfGSDFmj5Z71D5AgHsbnEI
  elements:
  - title: ''
    name: ''
    model: Emp_DQ_Errors_UAT
    explore: s4_org_structure_dq_error_details
    type: looker_grid
    fields: [s4_org_structure_dq_error_details.rule_column, s4_org_structure_dq_error_details.severity,
      s4_org_structure_dq_error_details.error_description, s4_org_structure_dq_error_details.gfs_business_unit_code,
      s4_org_structure_dq_error_details.ics_code, s4_org_structure_dq_error_details.country_of_company,
      s4_org_structure_dq_error_details.dc_created_timestamp_time, s4_org_structure_dq_error_details.gfs_discipline_code,
      s4_org_structure_dq_error_details.gfs_group_of_business_unit_code, s4_org_structure_dq_error_details.gfs_group_of_business_unit2_code,
      s4_org_structure_dq_error_details.gfs_group_of_business_unit3_code, s4_org_structure_dq_error_details.gfs_org_operating_unit_code,
      s4_org_structure_dq_error_details.gfs_production_unit_code, s4_org_structure_dq_error_details.gfs_strategic_business_unit_code,
      s4_org_structure_dq_error_details.gfs_sub_bu_2_code, s4_org_structure_dq_error_details.gfs_sub_bu_3_code,
      s4_org_structure_dq_error_details.gfs_sub_bu_code, s4_org_structure_dq_error_details.hyperion_business_unit_code]
    sorts: [s4_org_structure_dq_error_details.dc_created_timestamp_time desc]
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
    column_order: [s4_org_structure_dq_error_details.rule_column, s4_org_structure_dq_error_details.severity,
      s4_org_structure_dq_error_details.error_description, s4_org_structure_dq_error_details.gfs_business_unit_code,
      s4_org_structure_dq_error_details.gfs_discipline_code, s4_org_structure_dq_error_details.gfs_group_of_business_unit_code,
      s4_org_structure_dq_error_details.gfs_group_of_business_unit2_code, s4_org_structure_dq_error_details.gfs_group_of_business_unit3_code,
      s4_org_structure_dq_error_details.gfs_org_operating_unit_code, s4_org_structure_dq_error_details.gfs_production_unit_code,
      s4_org_structure_dq_error_details.gfs_strategic_business_unit_code, s4_org_structure_dq_error_details.gfs_sub_bu_code,
      s4_org_structure_dq_error_details.gfs_sub_bu_2_code, s4_org_structure_dq_error_details.gfs_sub_bu_3_code,
      s4_org_structure_dq_error_details.hyperion_business_unit_code, s4_org_structure_dq_error_details.ics_code,
      s4_org_structure_dq_error_details.country_of_company, s4_org_structure_dq_error_details.dc_created_timestamp_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      s4_org_structure_dq_error_details.rule_column: RULE COLUMN
      s4_org_structure_dq_error_details.severity: EXCEPTION TYPE
      s4_org_structure_dq_error_details.error_description: EXCEPTION DESCRIPTION
      s4_org_structure_dq_error_details.gfs_business_unit_code: GFS BUSINESS CODE
      s4_org_structure_dq_error_details.ics_code: ICS CODE
      s4_org_structure_dq_error_details.country_of_company: COUNTRY OF OU CODE
      s4_org_structure_dq_error_details.dc_created_timestamp_time: DC BATCH TIMESTAMP
      s4_org_structure_dq_error_details.gfs_discipline_code: GFS DISCIPLINE CODE
      s4_org_structure_dq_error_details.gfs_group_of_business_unit_code: GFS GROUP
        OF BUSINESS UNIT CODE
      s4_org_structure_dq_error_details.gfs_group_of_business_unit2_code: GFS GROUP
        OF BUSINESS UNIT2 CODE
      s4_org_structure_dq_error_details.gfs_group_of_business_unit3_code: GFS GROUP
        OF BUSINESS UNIT3 CODE
      s4_org_structure_dq_error_details.gfs_org_operating_unit_code: GFS ORG OPERATING
        UNIT CODE
      s4_org_structure_dq_error_details.gfs_production_unit_code: GFS PRODUCTION UNIT
        CODE
      s4_org_structure_dq_error_details.gfs_strategic_business_unit_code: GFS STRATEGIC
        BUSINESS UNIT CODE
      s4_org_structure_dq_error_details.gfs_sub_bu_2_code: GFS SUB BU2 CODE
      s4_org_structure_dq_error_details.gfs_sub_bu_3_code: GFS SUB BU3 CODE
      s4_org_structure_dq_error_details.gfs_sub_bu_code: GFS SUB BU CODE
      s4_org_structure_dq_error_details.hyperion_business_unit_code: HYPERION BUSINESS
        UNIT CODE
    header_background_color: "#51ccc5"
    truncate_column_names: false
    defaults_version: 1
    listen:
      ICS CODE: s4_org_structure_dq_error_details.ics_code
      GFS BUSINESS UNIT CODE: s4_org_structure_dq_error_details.gfs_business_unit_code
      'Select Batch Date Range:': s4_org_structure_dq_error_details.dc_created_timestamp_time
      COUNTRY OF OU CODE: s4_org_structure_dq_error_details.country_of_company
      EXCEPTION TYPE: s4_org_structure_dq_error_details.severity
    row: 0
    col: 0
    width: 24
    height: 12
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
    explore: s4_org_structure_dq_error_details
    listens_to_filters: []
    field: s4_org_structure_dq_error_details.gfs_business_unit_code
  - name: ICS CODE
    title: ICS CODE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: Emp_DQ_Errors_UAT
    explore: s4_org_structure_dq_error_details
    listens_to_filters: []
    field: s4_org_structure_dq_error_details.ics_code
  - name: EXCEPTION TYPE
    title: EXCEPTION TYPE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: Emp_DQ_Errors_UAT
    explore: s4_org_structure_dq_error_details
    listens_to_filters: []
    field: s4_org_structure_dq_error_details.severity
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
    explore: s4_org_structure_dq_error_details
    listens_to_filters: []
    field: s4_org_structure_dq_error_details.country_of_company
  - name: 'Select Batch Date Range:'
    title: 'Select Batch Date Range:'
    type: field_filter
    default_value: 2024/01/01 15:34 to 2024/06/24 15:34
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: Emp_DQ_Errors_UAT
    explore: s4_org_structure_dq_error_details
    listens_to_filters: []
    field: s4_org_structure_dq_error_details.dc_created_timestamp_time
