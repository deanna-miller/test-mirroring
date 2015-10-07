## To-Do List
## 1. Add user filter so that users only see top Looks for models they can access
## 2. Revisit rank calculation logic

- view: top_looks
  derived_table:
    sql: |
      SELECT
          look.id as look_id,
          look.title as look_title,
          look.description as look_description,
          query.id as query_id,
          query.model as query_model,
          query.view as query_view,
          query.fields as query_fields,
          query.filters as query_filters,
          count(distinct history.id) as execution_count,
          count(distinct "user".email) as unqiue_user_count,
          max(history.created_at) as last_execution,
          row_number() over (partition by query.model order by count(distinct history.id) desc) as execution_count_rank,
          row_number() over (partition by query.model order by count(distinct "user".email) desc ) as user_count_rank,
          row_number() over (partition by query.model order by ( (count(distinct history.id) * .35) + (count(distinct "user".email) * .65) )  desc) as derived_rank
      FROM 
          looker_repo_data.history AS history
          LEFT JOIN looker_repo_data.look AS look ON history.LOOK_ID = look.ID and history.source_schema = look.source_schema
          LEFT JOIN looker_repo_data.query AS query ON history.QUERY_ID = query.ID and history.source_schema = query.source_schema
          LEFT JOIN looker_repo_data.user AS "user" ON history.USER_ID = ("user".ID) and ("user".source_schema) = history.source_schema
      WHERE 
          history.source = 'look'         
          and history.source_schema = 'looker_insights'
          and query.model in ('Experience','Policy','Claims')
          and look.id is not null
          and history.created_at > (sysdate - 30)
          and {% condition execution_date %} history.created_at {% endcondition %}
      GROUP BY 1,2,3,4,5,6,7,8


# Fields
  fields:
  - dimension: look_id
    hidden: true
  
  - dimension: look_title
    
    
  - dimension: look_description
    label: "Description"
  
  - dimension: query_id
    type: int
    
  - dimension: query_model
  
  - dimension: query_view
  
  - dimension: query_fields
  
  - dimension: query_filters
  
  - dimension: derived_rank
    label: "Rank"
    type: int

  - dimension: look_title_link
    label: "Title"
    type: string
    sql: ${look_id}
    html: |
      {{ top_looks.look_title._value }}
      <a href="/looks/{{ value }}" target="_new">
      <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>
      
  - dimension: look_link
    label: "Link"
    sql: ${look_id}
    html: |
      <a href="/looks/{{ value }}"><img src="/images/layers-2x-324b4fca.png" height=20 width=20></a>
     
   
   
    
# Measures
    
    
# Filters
  - filter: execution_date
    type: date

    
