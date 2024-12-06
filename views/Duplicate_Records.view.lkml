view: duplicate_records {

      derived_table: {
      sql: WITH
        error_data AS (
        SELECT
          DISTINCT global_group_id
        FROM
          `datacloud_adm_dq.s4_employee_dq_active_error_details`
        WHERE
          error_description = 'global_id Should not be active in subcon and employee hr systems'),

        employee AS (
        SELECT
          global_group_id,
          pernr_id,
          most_recent_hire_date,
          separation_date,
          employee_status_code,
          work_country,
          employee_group_code,
          employee_subgroup,
          dc_source_id,
          'HR'AS source_system
        FROM
          hr_curated.employee),

        subcon AS (
        SELECT
          global_group_id,
          global_group_id AS pernr_id,
          most_recent_hire_date,
          separation_date,
          subcon_status_code AS employee_status_code,
          work_country,
          CAST(NULL AS string) AS employee_group_code,
          CAST(NULL AS string) AS employee_subgroup,
          dc_source_id,
          'VMS'AS source_system
        FROM
          procure_curated.subcontractor ),

        all_record AS(
        SELECT * FROM employee
        UNION ALL
        SELECT * FROM subcon )


      SELECT * FROM all_record
      WHERE global_group_id IN (SELECT * FROM error_data )
      ORDER BY 1 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: global_group_id {
      type: string
      sql: ${TABLE}.global_group_id ;;
    }

    dimension: pernr_id {
      type: string
      sql: ${TABLE}.pernr_id ;;
    }

    dimension: most_recent_hire_date {
      type: date
      datatype: date
      sql: ${TABLE}.most_recent_hire_date ;;
    }

    dimension: separation_date {
      type: date
      datatype: date
      sql: ${TABLE}.separation_date ;;
    }

    dimension: employee_status_code {
      type: string
      sql: ${TABLE}.employee_status_code ;;
    }

    dimension: work_country {
      type: string
      sql: ${TABLE}.work_country ;;
    }

    dimension: employee_group_code {
      type: string
      sql: ${TABLE}.employee_group_code ;;
    }

    dimension: employee_subgroup {
      type: string
      sql: ${TABLE}.employee_subgroup ;;
    }

    dimension: dc_source_id {
      type: string
      sql: ${TABLE}.dc_source_id ;;
    }

    dimension: source_system {
      type: string
      sql: ${TABLE}.source_system ;;
    }

    set: detail {
      fields: [
        global_group_id,
        pernr_id,
        most_recent_hire_date,
        separation_date,
        employee_status_code,
        work_country,
        employee_group_code,
        employee_subgroup,
        dc_source_id,
        source_system
      ]
    }
  }
