connection: "account_usage"

# include all the views
include: "*.view"

datagroup: snowflake_usage_dailey_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_usage_dailey_default_datagroup

explore: warehouse_metering_history {
  join: time_test {
    type: full_outer
    relationship: many_to_one
    sql_on: ${time_test.date_join} = ${warehouse_metering_history.date_join};;
    }
}
