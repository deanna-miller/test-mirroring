- view: claims_detail
  extends: transaction_template_claims_detail

  fields:
    # This file is for client specific fields for the claim subset
  
  - dimension: CatastropheClaim
    label: "Catastrophe Claim"
    type: string
    sql: | 
        Case When (${claims_detail.catastrophenumber}) is null Then 'Daily'
             Else 'CAT'
             End    
