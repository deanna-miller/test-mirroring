- view: recommended_explores
  derived_table:
    sql: |
      WITH 
      recent_queries as (
      SELECT 
          history.source_schema,
          "user".email as user_id,
          query.id as query_id,
          query.model as query_model,
          query.view as query_view,
          query.fields as fields,
          query.filters as filters,
          query.slug as query_slug
      FROM 
          history AS history
          LEFT JOIN look AS look ON history.LOOK_ID = look.ID and history.source_schema = look.source_schema
          LEFT JOIN query AS query ON history.QUERY_ID = query.ID and history.source_schema = query.source_schema
          LEFT JOIN "user" AS "user" ON history.USER_ID = ("user".ID) and ("user".source_schema) = history.source_schema
      WHERE 
          history.source = 'explore'
          and history.created_at > (sysdate - 30)
      order by
          history.created_at desc
      limit 500
      ),
      user_queries AS (
          SELECT distinct user_id, source_schema, query_id, JSON_EXTRACT_ARRAY_ELEMENT_TEXT(fields, seq.i) AS field, fields
          FROM recent_queries, reference_data.number_sequence AS seq
          WHERE seq.i < JSON_ARRAY_LENGTH(fields) 
          and {% condition user_filter %} user_id {% endcondition %}
        ),
      other_queries AS (
          SELECT distinct user_id, source_schema, query_id, query_model, query_view, query_slug, JSON_EXTRACT_ARRAY_ELEMENT_TEXT(fields, seq.i) AS field, fields, filters
          FROM recent_queries, reference_data.number_sequence AS seq
          WHERE 
            seq.i < JSON_ARRAY_LENGTH(fields) 
            --and user_id != (select user_id from user_queries limit 1)
            and query_id not in (select query_id from user_queries)
        )
      SELECT 
        f1.source_schema, 
        f1.query_id, 
        f1.query_model, 
        f1.query_view, 
        f1.query_slug,
        json_array_to_html_list(f1.fields) as query_fields,
        json_to_html_list(f1.filters) as query_filters,
        count(distinct f1.field) as field_count
      from
          other_queries f1
          join user_queries f2 on (
            f1.source_schema = f2.source_schema
            and f1.user_id != f2.user_id
            and f1.field = f2.field 
            --and f1.query_id != f2.query_id
          )
      group by 1,2,3,4,5,6,7
      order by field_count desc
      limit 25

  fields:
  - dimension: source_schema
  
  - dimension: query_model
  
  - dimension: query_view
    sql: initcap(${TABLE}.query_view)
    
  - dimension: query_id
  
  - dimension: field_count
    type: int
  
  - dimension: query_slug
    hidden: true
    
  - dimension: query_link
    label: "Link"
    sql: ${query_slug}
    html: |
      <a href="/x/{{ recommended_explores.query_slug._value }}"><img src="/images/layers-2x-324b4fca.png" height=20 width=20></a>
      
  - dimension: query_fields
    html: |
      <div>{{ value | replace: '&lt;', '<' | replace: '&gt;', '>' }}</div>
      
  - dimension: query_filters
    html: |
      <div>{{ value | replace: '&lt;', '<' | replace: '&gt;', '>' }}</div>
  
  - filter: user_filter
    hidden: true


# # Specify the table name if it's different from the view name:
# original sql
#     sql: |
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
#           SELECT distinct user_id, source_schema, query_id, JSON_EXTRACT_ARRAY_ELEMENT_TEXT(fields, seq.i) AS field, fields
#           FROM recent_queries, reference_data.number_sequence AS seq
#           WHERE seq.i < JSON_ARRAY_LENGTH(fields) 
#           and {% condition user_filter %} user_id {% endcondition %}
#         ),
#       other_queries AS (
#           SELECT distinct source_schema, query_id, query_model, query_view, query_slug, JSON_EXTRACT_ARRAY_ELEMENT_TEXT(fields, seq.i) AS field, fields
#           FROM recent_queries, reference_data.number_sequence AS seq
#           WHERE 
#             seq.i < JSON_ARRAY_LENGTH(fields) 
#             and user_id != (select user_id from user_queries limit 1)
#             and query_id not in (select query_id from user_queries)
#         )
#       SELECT 
#         f1.source_schema, f1.query_id, f1.query_model, f1.query_view, f1.query_slug, f1.fields, count(distinct f1.field) as field_count
#       from
#           other_queries f1
#       where exists (
#           select 1
#           from user_queries f2
#           where f1.source_schema = f2.source_schema  and f1.field = f2.field and f1.query_id != f2.query_id 
#       )
#       and source_schema = 'looker_insights'
#       group by 1,2,3,4,5,6
#       order by field_count desc
#       limit 25