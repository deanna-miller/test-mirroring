- dashboard: top_looks
  title: Data Exploration Recommendations
  layout: grid
  rows:
    - elements: [top_looks]
      height: 450
    - elements: [top_explores]
      height: 450      
    - elements: [explore_recommendations]
      height: 450


#  filters:

  elements:

    
  - name: top_looks
    title: Top Looks
    type: table
    model: IRE
    explore: top_looks
    dimensions: [top_looks.look_link, top_looks.query_model, top_looks.look_title, top_looks.look_description]
    filters:
      top_looks.derived_rank: <=10
      top_looks.query_model: '"Experience","Policy","Claim"'
      top_looks.execution_date: 30 days
    sorts: [top_looks.query_model, top_looks.derived_rank]
    limit: 10
    show_view_names: false
    show_row_numbers: false



  - name: top_explores
    title: Top Explores
    type: table
    model: IRE
    explore: top_explores
    dimensions: [top_explores.query_link, top_explores.query_model, top_explores.query_fields,
      top_explores.query_filters]
    filters:
      top_explores.derived_rank: <=10
      top_explores.query_model: '"Experience","Policy","Claim"'
      top_explores.execution_date: 30 days
    sorts: [top_explores.query_model, top_explores.derived_rank]
    limit: 5
    show_view_names: false
    show_row_numbers: false


  - name: explore_recommendations
    title: Explore Recommendations
    type: table
    model: IRE
    explore: recommended_explores
    dimensions: [recommended_explores.query_link, recommended_explores.query_model,
      recommended_explores.query_fields, recommended_explores.query_filters]
    sorts: [recommended_explores.field_count desc]
    limit: 5
    show_view_names: false
    show_row_numbers: false


    
  ## Hiding this one for now  
#   - name: top_policy_looks
#     title: Top Policy Looks
#     type: table
#     model: IRE
#     explore: top_looks
#     dimensions: [top_looks.look_title_link, top_looks.look_description]
#     filters:
#       top_looks.query_model: '"Policy"'
#       top_looks.execution_date: 30 days
#     sorts: [top_looks.derived_rank]
#     limit: 10
#     column_limit: ''