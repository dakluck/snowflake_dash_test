view: time_test {
  sql_table_name: PC_DAILEY_TEST.PUBLIC.TIME_TEST ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: indicator {
    type: string
    sql: ${TABLE}."INDICATOR" ;;
  }

  dimension: minute {
    type: string
    sql: ${TABLE}."MINUTE" ;;
  }
  dimension: date_join {
    type: number
    sql: concat(lpad(${hour},2,0),lpad(${minute},2,0));;
  }
}
