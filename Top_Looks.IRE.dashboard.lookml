- dashboard: top_looks
  title: Top Looks
  layout: grid
  rows:
    - elements: [top_experience_looks]
      height: 600
#     - elements: [top_policy_looks]
#       height: 300


#  filters:

  elements:

  - name: top_experience_looks
    title: Top Experience Looks
    type: table
    model: IRE
    explore: top_looks
    dimensions: [top_looks.query_model,top_looks.look_title_link, top_looks.look_description]
    filters:
      top_looks.query_model: '"Experience","Policy","Claim"'
      top_looks.execution_date: 30 days
      top_looks.derived_rank: <=10
    sorts: [top_looks.query_model,top_looks.derived_rank]
    limit: 10
    column_limit: ''
    
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