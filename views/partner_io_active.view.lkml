view: partner_io_active {
  derived_table: {
    sql:
      SELECT "S4_WBS_Partner" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description, WBS_Element as IO_Number, date(blocked_since) as blocked_since FROM finance_dq.s4_wbs_partner_active_dq_error_details
UNION ALL
SELECT "S4_IO_Partner" as interface_name,"INBOUND" as interface_type,rule_column,severity,error_description,IO_number, date(blocked_since) as blocked_since FROM
                  finance_dq.s4_partner_io_active_dq_error_details
          ;;
  }
  dimension: interface_name {
    type: string
    sql: ${TABLE}.interface_name ;;
  }
  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }
  dimension: rule_column {
    type: string
    description: "Column on which the Exception is reported"
    sql: ${TABLE}.rule_column ;;
  }
  dimension: severity {
    type: string
    description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

    sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;  }

  dimension: error_description {
    type: string
    description: "Description of the Exception"
    sql: ${TABLE}.error_description ;;
  }

  dimension: IO_number {
    type: string
    sql: ${TABLE}.IO_number ;;
  }

  dimension_group: blocked_since {
    type: time
    description: "Timestamp for Batch Run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.blocked_since ;;
  }
}
