- connection: iic_internal
- label: "IRE"
- hidden: true

- scoping: true           # for backward compatibility
- include: "*.IRE.view.lookml"
- include: "*.IRE.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       foreign_key: order_id
#     - join: users
#       foreign_key: orders.user_id

- explore: recommended_explores
  access_filter_fields: [recommended_explores.user_filter]
  hidden: true
  
  
- explore: recently_viewed
  access_filter_fields: [recently_viewed.user_filter]
  always_filter:
    execution_date: 'last 7 days'
  hidden: true


- explore: top_looks
  always_filter:
    execution_date: 'last 30 days'
    query_model: '"Experience","Policy","Claim","Transactions"'
    derived_rank: <=10
  hidden: true
  
- explore: top_explores
  always_filter:
    execution_date: 'last 30 days'
    query_model: '"Experience","Policy","Claim","Transactions"'
    derived_rank: <=10
  hidden: true