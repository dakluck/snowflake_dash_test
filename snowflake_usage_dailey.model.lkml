connection: "account_usage"

# include all the views
include: "*.view"

datagroup: snowflake_usage_dailey_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_usage_dailey_default_datagroup

explore: columns {
  join: tables {
    type: left_outer
    sql_on: ${columns.table_id} = ${tables.table_id} ;;
    relationship: many_to_one
  }
}

explore: copy_history {
  join: tables {
    type: left_outer
    sql_on: ${copy_history.table_id} = ${tables.table_id} ;;
    relationship: many_to_one
  }
}

explore: data_transfer_history {}

explore: database_storage_usage_history {}

explore: databases {}

explore: file_formats {}

explore: functions {}

explore: load_history {
  join: tables {
    type: left_outer
    sql_on: ${load_history.table_id} = ${tables.table_id} ;;
    relationship: many_to_one
  }
}

explore: login_history {}

explore: pipe_usage_history {}

explore: query_history {}

explore: referential_constraints {}

explore: schemata {}

explore: sequences {}

explore: stage_storage_usage_history {}

explore: stages {}

explore: storage_usage {}

explore: table_constraints {
  join: tables {
    type: left_outer
    sql_on: ${table_constraints.table_id} = ${tables.table_id} ;;
    relationship: many_to_one
  }
}

explore: table_storage_metrics {}

explore: tables {}

explore: views {
  join: tables {
    type: left_outer
    sql_on: ${views.table_id} = ${tables.table_id} ;;
    relationship: many_to_one
  }
}

explore: warehouse_metering_history {}
