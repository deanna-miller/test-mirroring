## To-Do List
## 1. Add user filter so that users only see top Looks for models they can access
## 2. Revisit rank calculation logic

- view: top_explores
  derived_table:
    sql: |
      SELECT
          query.id as query_id,
          query.slug as query_slug,
          query.model as query_model,
          query.view as query_view,
          json_array_to_html_list(query.fields) as query_fields,
          json_to_html_list(query.filters) as query_filters,
          count(distinct history.id) as execution_count,
          count(distinct "user".email) as unqiue_user_count,
          max(history.created_at) as last_execution,
          row_number() over (partition by query.model order by count(distinct history.id) desc) as execution_count_rank,
          row_number() over (partition by query.model order by count(distinct "user".email) desc ) as user_count_rank,
          row_number() over (partition by query.model order by ( (count(distinct history.id) * .35) + (count(distinct "user".email) * .65) )  desc) as derived_rank
      FROM 
          history AS history
          LEFT JOIN look AS look ON history.LOOK_ID = look.ID and history.source_schema = look.source_schema
          LEFT JOIN query AS query ON history.QUERY_ID = query.ID and history.source_schema = query.source_schema
          LEFT JOIN "user" AS "user" ON history.USER_ID = ("user".ID) and ("user".source_schema) = history.source_schema
      WHERE 
          history.source = 'explore'         
          and query.model in ('Experience','Policy','Claims')
          and look.id is null
          and history.created_at > (sysdate - 30)
          and {% condition execution_date %} history.created_at {% endcondition %}
      GROUP BY 1,2,3,4,5,6


# Fields
  fields:
  - dimension: query_id
    type: int
    
  - dimension: query_slug  
    
  - dimension: query_model
  
  - dimension: query_view
  
  - dimension: query_fields
    html: |
      <div>{{top_explores.query_fields._value}}</div>
  
  - dimension: query_filters
    html: |
      <div>{{top_explores.query_filters._value}}</div>
  
  - dimension: derived_rank
    label: "Rank"
    type: int

  - dimension: query_link
    label: "Link"
    sql: ${query_slug}
    html: |
      <a href="/x/{{ top_explores.query_slug._value }}"><img src="/images/layers-2x-324b4fca.png" height=20 width=20></a>
     
   
    
# Measures
    
    
# Filters
  - filter: execution_date
    type: date

    
