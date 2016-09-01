- view: recently_viewed
  derived_table:
    sql: |
      SELECT 
          history.id as history_id,
          "user".email as user_id,
          query.id as query_id,
          query.model as query_model,
          query.view as query_view,
          json_array_to_html_list(query.fields) as query_fields,
          json_to_html_list(query.filters) as query_filters,
          query.slug as query_slug,
          JSON_ARRAY_LENGTH(fields) as field_count,
          history.created_at as execution_ts,
          history.completed_at as execution_completeion_ts
      FROM 
          history AS history
          LEFT JOIN look AS look ON history.LOOK_ID = look.ID
          LEFT JOIN query AS query ON history.QUERY_ID = query.ID
          LEFT JOIN "user" AS "user" ON history.USER_ID = ("user".ID)
      WHERE 
          history.source = 'explore'
          and query.model != 'IRE'
          and {% condition user_filter %} "user".email {% endcondition %}


  fields:
  - dimension: history_id
  - dimension: user_id
  - dimension: source_schema
  - dimension: query_model
  - dimension: query_view
  - dimension: query_id
  - dimension: field_count
    type: number
  - dimension: query_slug
    label: "Query Link"
    html: |
      <a href="/x/{{ value }}"><img src="/images/layers-2x-324b4fca.png" height=20 width=20>{{ recently_viewed.query_id._value }}</a>
      
  - dimension: query_fields
    html: |
      <div>{{ value | replace: '&lt;', '<' | replace: '&gt;', '>' }}</div>

  - dimension: query_filters
    html: |
      <div>{{ value | replace: '&lt;', '<' | replace: '&gt;', '>' }}</div>
      

  
  
  - dimension_group: execution
    type: time
    timeframes: [time, time_of_day, date, week, month]
    sql: ${TABLE}.execution_ts    
  
  - dimension_group: execution_completion
    type: time
    timeframes: [time, time_of_day, date, week, month]
    sql: ${TABLE}.execution_completeion_ts
    
    
# Measures
  - measure: last_execution
    type: date
    sql: max(${execution_completion_time})
  
  - measure: execution_count
    type: count_distinct
    sql: ${history_id}
    
# Filters    
  - filter: user_filter
    hidden: true



## Original SQL
#       WITH 
#       recent_queries as (
#       SELECT 
#           history.source_schema,
#           "user".email as user_id,
#           query.id as query_id,
#           query.model as query_model,
#           query.view as query_view,
#           query.fields as fields,
#           query.slug as query_slug
#       FROM 
#           looker_repo_data.history AS history
#           LEFT JOIN looker_repo_data.look AS look ON history.LOOK_ID = look.ID and history.source_schema = look.source_schema
#           LEFT JOIN looker_repo_data.query AS query ON history.QUERY_ID = query.ID and history.source_schema = query.source_schema
#           LEFT JOIN looker_repo_data.user AS "user" ON history.USER_ID = ("user".ID) and ("user".source_schema) = history.source_schema
#       WHERE 
#           history.source = 'explore'
#           and history.created_at > (sysdate - 3)
#       order by
#           history.created_at desc
#       limit 500
#       ),
#       user_queries AS (
#           SELECT 
#             distinct user_id, source_schema, query_id, query_model, query_view, query_slug, JSON_EXTRACT_ARRAY_ELEMENT_TEXT(fields, seq.i) AS field, fields
#           FROM
#             recent_queries, 
#             reference_data.number_sequence AS seq
#           WHERE 
#             seq.i < JSON_ARRAY_LENGTH(fields) 
#         )
#         SELECT 
#           f1.user_id, f1.source_schema, f1.query_id, f1.query_model, f1.query_view, f1.query_slug, f1.fields, count(distinct f1.field) as field_count
#         from
#             user_queries f1
#         where
#             source_schema = 'looker_insights'
#             and query_model != 'IRE'
#         group by 1,2,3,4,5,6,7
#         order by field_count desc
#         limit 25