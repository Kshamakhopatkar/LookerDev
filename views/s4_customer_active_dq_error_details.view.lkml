view: s4_customer_active_dq_error_details {
    derived_table: {
      sql: SELECT "S4_CUSTOMER" as interface_name,"INBOUND" as interface_type,rule_column,severity, error_description,BusinessPartner,Customer,AddressID,"Not Available in Interface" as BankIndentification,country_of_company,blocked_since FROM finance_dq.s4_customer_active_dq_error_details
              Union all
              SELECT "S4_CUSTOMERBANK" as interface_name,"INBOUND" as interface_type,rule_column,severity, error_description, BusinessPartner,"Not Available in Interface" as Customer,"Not Available in Interface" as AddressID, BankIdentification,country_of_company,blocked_since FROM finance_dq.s4_customer_bank_active_dq_error_details


        union all

        SELECT "S4_CUSTOMER" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity, "DUMMY Exception inserted to handle No Exception Scenario" as error_description,  "" as BusinessPartner,"" as Customer,"" as AddressID," " as BankIndentification,"" as country_of_company,timestamp("1900-01-01") as blocked_since
        Union all
        SELECT "S4_CUSTOMERBANK" as interface_name,"INBOUND" as interface_type,"" as rule_column,"" as severity,"DUMMY Exception inserted to handle No Exception Scenario" as error_description, "" as BusinessPartner," " as Customer," " as AddressID, "" as BankIdentification,"" as country_of_company, timestamp("1900-01-01") as blocked_since



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

    dimension: AddressID {
      type: string
      sql: ${TABLE}.AddressID ;;
    }

    dimension: BankIndentification {
      type: string
      sql: ${TABLE}.BankIndentification ;;
    }


    dimension_group: blocked_since {
      type: time
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.blocked_since ;;
    }

    dimension: BusinessPartner {
      type: string
      sql: ${TABLE}.BusinessPartner ;;
    }

    dimension: country_of_company {
      type: string
      sql: ${TABLE}.country_of_company ;;
    }
    dimension: customer {
      type: string
      sql: ${TABLE}.Customer ;;
    }
    dimension: error_description {
      type: string
      sql: ${TABLE}.error_description ;;
    }

    dimension: rule_column {
      type: string
      sql: ${TABLE}.rule_column ;;
    }
    dimension: severity {
      type: string
      description: "If Record reported as Error, it will not be processed further, If record reported as Warning , will be processed further"

      sql: CASE
          WHEN severity ="business-error" THEN "error"
          WHEN severity="business-warning" THEN "warning"
          ELSE "error"
      END ;;
    }
    measure: count {
      type: count
    }
  }
