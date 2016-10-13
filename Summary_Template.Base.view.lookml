- view: summary_template
  sql_table_name: insight.summary
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    sql: ${TABLE}.id
