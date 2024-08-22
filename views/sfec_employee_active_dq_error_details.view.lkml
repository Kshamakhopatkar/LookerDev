view: sfec_employee_active_dq_error_details {
  sql_table_name: `premi0541131-dataclou.hr_dq.sfec_employee_active_dq_error_details` ;;

  dimension: blocked_age_in_days {
    type: number
    description: "Number of days since this record is blocked due to DQ issue"
    sql: ${TABLE}.blocked_age_in_days ;;
  }
  dimension_group: blocked_since {
    type: time
    description: "Timetsamp from raw table since this record is blocked due to DQ issue"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
  dimension: company_code {
    type: string
    description: "The Organization unit to which this Employee Record Belongs"
    sql: ${TABLE}.company_code ;;
  }
  dimension: country_of_company {
    type: string
    description: "Country of the Company code"
    sql: ${TABLE}.country_of_company ;;
  }
  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }
  dimension: global_group_id {
    type: string
    description: "Employee GGID on which the exception is reported"
    sql: ${TABLE}.global_group_id ;;
  }
  dimension: latest_dc_lineage_id {
    type: string
    description: "Job ID of latest feed in from SF to DC in which this record is blocked. Record can come as delta in multiple feeds and get blocked multiple times, this will specify latest job id in DC which blocked the record"
    sql: ${TABLE}.latest_dc_lineage_id ;;
  }
  dimension: pernr {
    type: string
    description: "Employee PERNR on which this exception is reported"
    sql: ${TABLE}.pernr ;;
  }
  dimension: rule_column {
    type: string
    description: "Field from Success Factors(Pxcell) which has error"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: employee_status_code {
    type: string
    sql: ${TABLE}.employee_status_code ;;
  }
  dimension: status {
    type: string
    description: "Will have one of the two values: 1.Record Blocked-(DC never passed this record in DQ validation. This record was never moved to cleansed). 2.Update Blocked - (Sometime in the past, this record moved to cleaned, but update on this record is blocked due to DQ issue)"
    sql: ${TABLE}.status ;;
  }
  dimension: global_group_idtest {
    type: number
    sql: ${TABLE}.global_group_id ;;
    html:
      {% assign url_split_at_f = filter_link._link | split: '&amp;f' %}
      {% assign user_filters = '' %}
      {% assign continue_loop = true %}

    {% for url_part in url_split_at_f offset:1 %}
    {% if continue_loop %}
    {% if url_part contains '&amp;sorts' %}
    {% assign part_split_at_sorts = url_part | split: '&amp;sorts' %}
    {% assign last_filter = part_split_at_sorts | first %}
    {% assign user_filters = global_group_id | append:'&f' %}
    {% assign user_filters = global_group_id | append:last_filter %}
    {% assign continue_loop = false %}
    {% else %}
    {% assign user_filters = global_group_id | append:'&amp;f' %}
    {% assign user_filters = global_group_id | append:url_part %}
    {% endif %}
    {% endif %}
    {% endfor %}

    {% assign user_filters = global_group_id | replace: 'f[sfec_employee_active_dq_error_details.global_group_id]', 'global_group_id' %}
    {% assign user_filters = global_group_id | replace: 'f[sfec_employee_active_dq_error_details.global_group_id]', 'global_group_id' %}
    {% assign user_filters = global_group_id | replace: 'f[sfec_employee_active_dq_error_details.global_group_id]', 'global_group_id' %}

    <a href='https://2d00cf92-deaf-410e-94ff-13cfe08a7cea.looker.app/dashboards/GiYuyQ6yDLMZ4HtRaGwp7u?{{ global_group_id }}'>{{ value }}</a>;;
  }

  measure: filter_link {
    type: count_distinct
    hidden: yes
    drill_fields: []
    sql: ${TABLE}.global_group_id ;;
  }
  measure: count {
    type: count
  }
  dimension: GGID {
    type: string
    link: {
      label: "Drilldown through Page Navigation Dashboard"
      url: " https://2d00cf92-deaf-410e-94ff-13cfe08a7cea.looker.app/dashboards/GiYuyQ6yDLMZ4HtRaGwp7u?
      GGID=1&COUNTRY+OF+OU+CODE=&PERNR+ID=&OU+CODE=&EXCEPTION+DESCRIPTION=&EMPLOYEE+STATUS+CODE=GGID={{['sfec_employee_active_dq_error_details.global_group_id'] | url_encode }}"
    }
    sql: ${TABLE}.global_group_id ;;
  }
  measure: dash_nav {


    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #F6F6F7; height:500px;width:100%"></div>
      <div style="background-color: #F6F6F7; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="https://2d00cf92-deaf-410e-94ff-13cfe08a7cea.looker.app/dashboards/GiYuyQ6yDLMZ4HtRaGwp7u?GGID=&COUNTRY+OF+OU+CODE=&PERNR+ID=&OU+CODE=&EXCEPTION+DESCRIPTION=?GGID={{['sfec_employee_active_dq_error_details.global_group_id'] }}">Employee Active Errors Dashboard</a>
          </nav>
      </div>
    <div style="background-color: #F6F6F7; height:500px;width:100%"></div>;;
  }

}
