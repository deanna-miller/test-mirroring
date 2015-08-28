- view: summary_template
  sql_table_name: public.experience_summary_v1
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    sql: ${TABLE}.id
