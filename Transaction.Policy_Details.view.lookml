- view: policy_details
  extends: transaction_template_policy_details
  
  fields:
    # This file is for client specific fields for the experience subset
  
  - dimension: policy_details.Underwriter
    hidden: true
    label: "Underwriter"
    sql: ${TABLE}.UnderwriterAssignedProducer