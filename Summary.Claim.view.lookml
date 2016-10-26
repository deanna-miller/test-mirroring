- view: claim
  extends: summary_template_claim
  
  fields:
    # This file is for client specific fields for the claim subset
  
  - dimension: claim.catastrophenumber
    label: "Catastrophe Number"
    sql: ${TABLE}.catastrophenumber
    
  - dimension: claim.CatastropheClaim
    label: "Catastrophe Claim"
    type: string
    sql: | 
        Case When (${claim.catastrophenumber}) is null Then 'Daily'
             Else 'CAT'
             End    
