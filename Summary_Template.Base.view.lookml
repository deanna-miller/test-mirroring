- view: summary_template
  sql_table_name: insight.experience_summary
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    sql: ${TABLE}.id
