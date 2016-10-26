- view: experience
  extends: summary_template_experience
  
  fields:
    # This file is for client specific fields for the experience subset
  
  - dimension: experience.insuredname
    label: "Insured Name"
    sql: ${TABLE}.insuredname
    
  - dimension: policyref
    hidden: true
    type: number
    sql: ${TABLE}.policyref
    
  - dimension: reportpd
    hidden: true
    type: string
    sql: ${TABLE}.reportpd
    
  - dimension: claimnumber
    hidden: True
    sql: ${TABLE}.claimnumber
    
  - dimension: claimantcd
    hidden: True
    type: string
    sql: ${TABLE}.claimantcd
    
  - dimension: featurecd
    hidden: True
    type: string
    sql: ${TABLE}.featurecd