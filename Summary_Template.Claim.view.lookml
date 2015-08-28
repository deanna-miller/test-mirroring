- view: summary_template_claim
  extends: [producer, product, report, coverage]

  fields:
    ###########################################
    # Dimensions for Measures should be hidden#
    ###########################################
  - dimension: ytdincurredamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdincurredamt

  - dimension: mtdincurredamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdincurredamt
    
  - dimension: itdincurredamt
    type: number
    hidden: true
    sql: ${TABLE}.itdincurredamt
    
  - dimension: mtdpaidamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdpaidamt

  - dimension: ytdpaidamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdpaidamt
    
  - dimension: itdpaidamt
    type: number
    hidden: true
    sql: ${TABLE}.itdpaidamt
  
  - dimension: outstandingamt
    type: number
    hidden: true
    sql: ${TABLE}.outstandingamt

  - dimension: outstandingexpectedrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.outstandingexpectedrecoveryamt
    
  - dimension: mtdpostedrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdpostedrecoveryamt
    
  - dimension: itdpostedrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.itdpostedrecoveryamt
    
  - dimension: ytdpostedrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdpostedrecoveryamt
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################
    
  - dimension: claim.claimnumber
    label: "Claim Number"
    sql: ${TABLE}.claimnumber
    
  - dimension_group: lossdt
    label: "Loss"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lossdt
    
  - dimension: losscausecd
    label: "Loss Cause"
    sql: ${TABLE}.losscausecd

  ######################################
  #Measures, should all contain a label#
  ######################################
  
  - measure: claim.outstanding_expected_recovery
    label: "Outstanding Expected Recovery"
    type: sum
    sql: ${outstandingexpectedrecoveryamt}
    
  - measure: claim.outstanding_reserve
    label: "Outstanding Reserve"
    type: sum
    sql: ${outstandingamt}
  
  - measure: claim.posted_recovery_mtd
    label: "Recovery Posted MTD"
    type: sum
    sql: ${mtdpostedrecoveryamt} 
    
  - measure: claim.posted_recovery_ytd
    label: "Recovery Posted YTD"
    type: sum
    sql: ${ytdpostedrecoveryamt} 
    
  - measure: claim.posted_recovery_itd
    label: "Recovery Posted ITD"
    type: sum
    sql: ${itdpostedrecoveryamt} 
     
  - measure: claim.incurred_loss_mtd
    label: "Incurred Loss MTD"
    type: sum
    sql: ${mtdincurredamt}
    
  - measure: claim.incurred_loss_itd
    label: "Incurred Loss ITD"  
    type: sum
    sql: ${itdincurredamt}

  - measure: claim.incurred_loss_ytd
    label: "Incurred Loss YTD"  
    type: sum
    sql: ${ytdincurredamt}
  
  - measure: claim.paid_loss_mtd
    label: "Paid MTD"
    type: sum
    sql: ${mtdpaidamt}

  - measure: claim.paid_loss_ytd
    label: "Paid YTD"
    type: sum
    sql: ${ytdpaidamt}
    
  - measure: claim.paid_loss_itd
    label: "Paid ITD"
    type: sum
    sql: ${itdpaidamt}