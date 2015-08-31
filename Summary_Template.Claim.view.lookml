- view: summary_template_claim
  extends: [producer, product, report, coverage, organization]

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
    
  - dimension: mtdreservechangeamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdreservechangeamt
    
  - dimension: ytdreservechangeamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdreservechangeamt
    
  - dimension: mtdincurrednetrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdincurrednetrecoveryamt
    
  - dimension: ytdincurrednetrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdincurrednetrecoveryamt

  - dimension: itdincurrednetrecoveryamt
    type: number
    hidden: true
    sql: ${TABLE}.itdincurrednetrecoveryamt
    
  - dimension: mtdexpectedrecoverychangeamt
    type: number
    hidden: true
    sql: ${TABLE}.mtdexpectedrecoverychangeamt

  - dimension: ytdexpectedrecoverychangeamt
    type: number
    hidden: true
    sql: ${TABLE}.ytdexpectedrecoverychangeamt
    
  - dimension: openingreserve
    type: number
    hidden: true
    sql: ${TABLE}.openingreserve

  - dimension: originalreserve
    type: number
    hidden: true
    sql: ${TABLE}.originalreserve
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################
    
  - dimension: claim.claimnumber
    label: "Claim Number"
    sql: ${TABLE}.claimnumber
    
  - dimension: claim.claimantcd
    label: "Claimant"
    sql: ${TABLE}.claimantcd
    
  - dimension_group: claim.lossdt
    label: "Loss"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lossdt
    
  - dimension_group: claim.openeddt
    label: "Open"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.openeddt
    
  - dimension_group: claim.closeddt
    label: "Closed"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.closeddt
    
  - dimension_group: claim.denialdt
    label: "Denial"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.denialdt
    
  - dimension_group: claim.firstindemnitypaymentdt
    label: "First Indemnity Payment"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstindemnitypaymentdt
    
  - dimension_group: claim.firstcloseddt
    label: "Claim First Closed"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstcloseddt
    
  - dimension_group: claim.claimlastclosedt
    label: "Claim Last Closed"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.claimlastclosedt
    
  - dimension_group: claim.claimantlastclosedt
    label: "Claimant Last Closed"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.claimantlastclosedt
    
  - dimension_group: claim.reservelastclosedt
    label: "Reserve Last Closed"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reservelastclosedt
    
  - dimension: claim.losscausecd
    label: "Loss Cause"
    sql: ${TABLE}.losscausecd
    
  - dimension: claim.reservetypecd
    label: "Reserve Type"
    sql: ${TABLE}.reservetypecd
    
  - dimension: claim.reservecd
    label: "Reserve"
    sql: ${TABLE}.reservecd
    
  - dimension: claim.subreservecd
    label: "Sub Reserve"
    sql: ${TABLE}.subreservecd
    
  - dimension: claim.lossyear
    label: "Loss Year"
    sql: ${TABLE}.lossyear
    
  - dimension: claim.sublosscausecd
    label: "Sub Loss Cause"
    sql: ${TABLE}.sublosscausecd
    
  - dimension: claim.featurecd
    label: "Feature"
    sql: ${TABLE}.featurecd
    
  - dimension: claim.featuresubcd
    label: "Sub Feature"
    sql: ${TABLE}.featuresubcd

  - dimension: claim.featuretypecd
    label: "Feature Type"
    sql: ${TABLE}.featuretypecd
    
  - dimension: claim.aggregatelimit
    label: "Aggregate Limit"
    sql: ${TABLE}.
    
  - dimension: claim.aggregatelimitdescription
    label: "Aggregate Limit Description"
    sql: ${TABLE}.aggregatelimitdescription

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
    
  - measure: claim.reserve_change_amt_mtd
    label: "Reserve Change MTD"
    type: sum
    sql: ${mtdreservechangeamt} 
    
  - measure: claim.reserve_change_amt_ytd
    label: "Reserve Change YTD"
    type: sum
    sql: ${ytdreservechangeamt} 
    
  - measure: claim.incurred_net_recovery_amt_mtd
    label: "Incurred New Recovery MTD"
    type: sum
    sql: ${mtdincurrednetrecoveryamt} 
    
  - measure: claim.incurred_net_recovery_amt_ytd
    label: "Incurred New Recovery YTD"
    type: sum
    sql: ${ytdincurrednetrecoveryamt} 
  
  - measure: claim.incurred_net_recovery_amt_itd
    label: "Incurred New Recovery ITD"
    type: sum
    sql: ${itdincurrednetrecoveryamt} 
    
  - measure: claim.expected_recovery_change_amt_mtd
    label: "Expected Recovery Change MTD"
    type: sum
    sql: ${mtdexpectedrecoverychangeamt} 
    
  - measure: claim.expected_recovery_change_amt_ytd
    label: "Expected Recovery Change YTD"
    type: sum
    sql: ${ytdexpectedrecoverychangeamt} 
    
  - measure: claim.opening_reserve
    label: "Opening Reserve"
    type: sum
    sql: ${openingreserve} 
    
  - measure: claim.original_reserve
    label: "Original Reserve"
    type: sum
    sql: ${originalreserve} 
    
    