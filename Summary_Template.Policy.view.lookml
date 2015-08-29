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
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################
    
  - dimension: policy.newrenewalcd
    label: "New Renewal Code"
    sql: ${TABLE}.newrenewalcd
    
  - dimension: policy.policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber
    
  - dimension: policy.statecd
    label: "Policy State"
    sql: ${TABLE}.statecd
    
  - dimension_group: policy.effectivedt
    label: "Effective"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effectivedt
    
  - dimension_group: policy.expirationdt
    label: "Expiration"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expirationdt
    
    
  ######################################
  #Measures, should all contain a label#
  ######################################
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