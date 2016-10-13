- view: policy
  extends: summary_template_policy

  fields:
    # This file is for client specific fields for the experience subset
  
  - dimension: policy.MitigationIBHS
    hidden: true
    label: "Mitigation/IBHS"
    sql: ${TABLE}.MitigationIBHS