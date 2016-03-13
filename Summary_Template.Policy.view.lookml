- view: summary_template_policy
  extends: [producer, product, report, coverage,organization]
  fields:
  
    ###########################################
    # Dimensions for Measures should be hidden#
    ###########################################
    
  - dimension: mtdearnedpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdearnedpremiumamt

  - dimension: mtdwrittencommissionamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdwrittencommissionamt

  - dimension: mtdwrittencommissionfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdwrittencommissionfeeamt

  - dimension: mtdwrittenpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdwrittenpremiumamt

  - dimension: mtdwrittenpremiumfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdwrittenpremiumfeeamt
    
  - dimension: monthunearnedamt
    type: number
    hidden: true
    sql: ${TABLE}.monthunearnedamt

  - dimension: ytdwrittencommissionamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdwrittencommissionamt

  - dimension: ytdwrittencommissionfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdwrittencommissionfeeamt

  - dimension: ytdwrittenpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdwrittenpremiumamt

  - dimension: ytdwrittenpremiumfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdwrittenpremiumfeeamt

  - dimension: ttdearnedpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.ttdearnedpremiumamt

  - dimension: ttdwrittencommissionamt
    type: number
    hidden: true
    sql: ${TABLE}.ttdwrittencommissionamt

  - dimension: ttdwrittencommissionfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.ttdwrittencommissionfeeamt

  - dimension: ttdwrittenpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.ttdwrittenpremiumamt

  - dimension: ttdwrittenpremiumfeeamt
    type: number
    hidden: true
    sql: ${TABLE}.ttdwrittenpremiumfeeamt

  - dimension: ytdearnedpremiumamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdearnedpremiumamt
    
  - dimension: inforceamt
    type: number
    hidden: true
    sql: ${TABLE}.inforceamt
    
  - dimension: lastinforceamt
    type: number
    hidden: true
    sql: ${TABLE}.lastinforceamt
    
  - dimension: unearnedamt
    type: number
    hidden: true
    sql: ${TABLE}.unearnedamt
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################
    
  - dimension: policy.newrenewalcd
    label: "New Renewal Code"
    sql: ${TABLE}.newrenewalcd
    
  - dimension: policy.policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber
    
  - dimension: policy.policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion
    
  - dimension: policy.statecd
    label: "Policy State"
    sql: ${TABLE}.statecd
    
  - dimension: policy.feecd
    label: "Fee"
    sql: ${TABLE}.feecd
    
  - dimension: policy.policystatuscd
    hidden: true
    label: "Policy Status"
    sql: ${TABLE}.policystatuscd
    
  - dimension: policy.policyyear
    label: "Policy Year"
    sql: ${TABLE}.policyyear
    
  - dimension: policy.insurancetypecd
    label: "Insurance Type"
    sql: ${TABLE}.insurancetypecd
    
  - dimension: policy.coveredperilscd
    label: "Covered Perils"
    sql: ${TABLE}.coveredperilscd
    
  - dimension: policy.commissionareacd
    label: "Commission Area"
    sql: ${TABLE}.commissionareacd
    
  - dimension: policy.coinsurancepct
    label: "Co-Insurance %"
    type: number
    sql: ${TABLE}.coinsurancepct
    
  - dimension_group: policy.effectivedt
    label: "Effective"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.effectivedt
    
  - dimension_group: policy.expirationdt
    label: "Expiration"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.expirationdt
    
  - dimension: policy.limit1
    label: "Limit 1"
    sql: ${TABLE}.limit1
    
  - dimension: policy.limit2
    label: "Limit 2"
    sql: ${TABLE}.limit2
    
  - dimension: policy.limit3
    label: "Limit 3"
    sql: ${TABLE}.limit3
    
  - dimension: policy.limit4
    label: "Limit 4"
    sql: ${TABLE}.limit4
    
  - dimension: policy.limit5
    label: "Limit 5"
    sql: ${TABLE}.limit5
    
  - dimension: policy.limit6
    label: "Limit 6"
    sql: ${TABLE}.limit6
    
  - dimension: policy.limit7
    label: "Limit 7"
    sql: ${TABLE}.limit7
    
  - dimension: policy.limit8
    label: "Limit 8"
    sql: ${TABLE}.limit8
    
  - dimension: policy.limit9
    label: "Limit 9"
    sql: ${TABLE}.limit9
    
  - dimension: policy.deductible1
    label: "Deductible 1"
    sql: ${TABLE}.deductible1

  - dimension: policy.deductible2
    label: "Deductible 2"
    sql: ${TABLE}.deductible2
    
  ######################################
  #Measures, should all contain a label#
  ######################################
 
  - measure: policy.inforce_amt
    label: "Inforce Premium"
    type: sum
    sql: ${inforceamt}
    
  - measure: policy.unearned_amt
    label: "Unearned Premium"
    type: sum
    sql: ${unearnedamt}
    
  - measure: policy.last_inforce_amt
    label: "Last Inforce Premium"
    type: sum
    sql: ${lastinforceamt}
 
  - measure: policy.earned_premium_mtd
    label: "Earned Premium MTD"
    type: sum
    sql: ${mtdearnedpremiumamt}
    
  - measure: policy.written_commission_mtd
    label: "Written Commission MTD"
    type: sum
    sql: ${mtdwrittencommissionamt}

  - measure: policy.written_commission_fee_mtd
    label: "Written Commission Fee MTD"
    type: sum
    sql: ${mtdwrittencommissionfeeamt}

  - measure: policy.written_premium_mtd
    label: "Written Premium MTD"
    type: sum
    sql: ${mtdwrittenpremiumamt}

  - measure: policy.written_premium_fee_mtd
    label: "Written Premium Fee MTD"
    type: sum
    sql: ${mtdwrittenpremiumfeeamt}
    
  - measure: policy.month_unearned_amt
    label: "Month Unearned Premium"
    type: sum
    sql: ${monthunearnedamt} 

  - measure: policy.earned_premium_ytd
    label: "Earned Premium YTD"
    type: sum
    sql: ${ytdearnedpremiumamt}

  - measure: policy.written_commission_ytd
    label: "Written Commission YTD"
    type: sum
    sql: ${ytdwrittencommissionamt}

  - measure: policy.written_commission_fee_ytd
    label: "Written Commission Fee YTD"
    type: sum
    sql: ${ytdwrittencommissionfeeamt}

  - measure: policy.written_premium_ytd
    label: "Written Premium YTD"
    type: sum
    sql: ${ytdwrittenpremiumamt}

  - measure: policy.written_premium_fee_ytd
    label: "Written Premium Fee YTD"
    type: sum
    sql: ${ytdwrittenpremiumfeeamt}

  - measure: policy.earned_premium_ttd
    label: "Earned Premium TTD"
    type: sum
    sql: ${ttdearnedpremiumamt}

  - measure: policy.written_commission_ttd
    label: "Written Commission TTD"
    type: sum
    sql: ${ttdwrittencommissionamt}

  - measure: policy.written_commission_fee_ttd
    label: "Written Commission Fee TTD"
    type: sum
    sql: ${ttdwrittencommissionfeeamt}

  - measure: policy.written_premium_ttd
    label: "Written Premium TTD"
    type: sum
    sql: ${ttdwrittenpremiumamt}

  - measure: policy.written_premium_fee_ttd
    label: "Written Premium Fee TTD"
    type: sum
    sql: ${ttdwrittenpremiumfeeamt}