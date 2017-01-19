- view: experience
  extends: summary_template_experience
  
  fields:
    # This file is for client specific fields for the experience subset
  
  - dimension: claimantcd
    hidden: True
    type: string
    sql: ${TABLE}.claimantcd
    
  - dimension: claimnumber
    hidden: True
    sql: ${TABLE}.claimnumber
    
  - dimension: featurecd
    hidden: True
    type: string
    sql: ${TABLE}.featurecd
  
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
    
  - dimension_group: report_period
    hidden: true
    type: time
    timeframes: [year, month, raw]
    sql: ${TABLE}.reportperiod