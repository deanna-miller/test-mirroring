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
    
  - dimension: claim.itdpaidamt
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
    
  - dimension: reportperiod
    sql: ${TABLE}.reportperiod
    hidden: true
    
  - dimension: reportpd
    sql: ${TABLE}.reportpd
    hidden: true  
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################
    
  - dimension: claim.claimnumber
    label: "Claim Number"
    sql: ${TABLE}.claimnumber
    
  - dimension: claim.claimantcd
    label: "Claimant"
    sql: ${TABLE}.claimantcd
    
  - dimension: claim.claimstatuscd
    hidden: true
    label: "Claim Status"
    sql: ${TABLE}.claimstatuscd
    
  - dimension_group: claim.lossdt
    label: "Loss"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lossdt
    
  - dimension_group: claim.openeddt
    label: "Open"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.openeddt
    
  - dimension_group: claim.closeddt
    label: "Closed"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.closeddt
    
  - dimension_group: claim.denialdt
    label: "Denial"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.denialdt
    
  - dimension_group: claim.firstindemnitypaymentdt
    label: "First Indemnity Payment"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.firstindemnitypaymentdt
    
  - dimension_group: claim.firstcloseddt
    label: "Claim First Closed"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.firstcloseddt
    
  - dimension_group: claim.claimlastclosedt
    label: "Claim Last Closed"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.claimlastclosedt
    
  - dimension_group: claim.claimantlastclosedt
    label: "Claimant Last Closed"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.claimantlastclosedt
    
  - dimension_group: claim.reservelastclosedt
    label: "Reserve Last Closed"
    type: time
    timeframes: [date, week, month]
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
    sql: ${TABLE}.aggregatelimit
    
  - dimension: claim.aggregatelimitdescription
    label: "Aggregate Limit Description"
    sql: ${TABLE}.aggregatelimitdescription
    
  - dimension: claim.productname
    label: "Product Name"
    sql: ${TABLE}.productname
    
  - dimension: claim.insuredname
    label: "Insured Name"
    sql: ${TABLE}.insuredname
    
  
  ######################################
  #Measures, should all contain a label#
  ######################################
  
  - measure: claim.outstanding_expected_recovery
    label: "Outstanding Expected Recovery"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingexpectedrecoveryamt}
    
  - measure: claim.outstanding_expected_subrogation
    label: "Outstanding Expected Subrogation"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingexpectedrecoveryamt}   
    filters:
      claim.reservecd: "Subrogation"
      
  - measure: claim.outstanding_expected_salvage
    label: "Outstanding Expected Salvage"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingexpectedrecoveryamt}   
    filters:
      claim.reservecd: "Salvage"    
    
  - measure: claim.outstanding_reserve
    label: "Outstanding Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingamt}
    
  - measure: claim.outstanding_indemnity_reserve
    label: "Outstanding Indemnity Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingamt}  
    filters:
      claim.reservecd: "Indemnity"
  
  - measure: claim.outstanding_adjustment_reserve
    label: "Outstanding Adjustment Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingamt}  
    filters:
      claim.reservecd: "Adjustment"
      
  - measure: claim.outstanding_defense_reserve
    label: "Outstanding Defense Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${outstandingamt}  
    filters:
      claim.reservecd: "Defense"
      
  
  - measure: claim.posted_recovery_mtd
    label: "Recovery Posted MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpostedrecoveryamt}
      
  - measure: claim.posted_salvage_mtd
    label: "Salvage Posted MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpostedrecoveryamt}
    filters:
      claim.reservecd: "Salvage"
      
  - measure: claim.posted_subrogation_mtd
    label: "Subrogation Posted MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpostedrecoveryamt}
    filters:
      claim.reservecd: "Subrogation"
    
  - measure: claim.posted_recovery_ytd
    label: "Recovery Posted YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpostedrecoveryamt} 
    
  - measure: claim.posted_salvage_ytd
    label: "Salvage Posted YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpostedrecoveryamt}
    filters:
      claim.reservecd: "Salvage"
      
  - measure: claim.posted_subrogation_ytd
    label: "Subrogation Posted YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpostedrecoveryamt}
    filters:
      claim.reservecd: "Subrogation" 
    
  - measure: claim.posted_recovery_itd
    label: "Recovery Posted ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdpostedrecoveryamt} 
    
  - measure: claim.posted_salvage_itd
    label: "Salvage Posted ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdpostedrecoveryamt}
    filters:
      claim.reservecd: "Salvage"
      
  - measure: claim.posted_subrogation_itd
    label: "Subrogation Posted ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdpostedrecoveryamt}
    filters:
      claim.reservecd: "Subrogation"
     
  - measure: claim.incurred_loss_mtd
    label: "Incurred Loss MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurredamt}
    
  - measure: claim.indemnity_incurredmtd
    label: "Indemnity Incurred MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurredamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurredmtd
    label: "Adjustment Incurred MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurredamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurredmtd
    label: "Defense Incurred MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurredamt}
    filters:
      claim.reservecd: "Defense"    
    
  - measure: claim.incurred_loss_itd
    label: "Incurred Loss ITD"  
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurredamt}
    
  - measure: claim.indemnity_incurreditd
    label: "Indemnity Incurred ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurredamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurreditd
    label: "Adjustment Incurred ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurredamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurreditd
    label: "Defense Incurred ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurredamt}
    filters:
      claim.reservecd: "Defense"   

  - measure: claim.incurred_loss_ytd
    label: "Incurred Loss YTD"  
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurredamt}
    
  - measure: claim.indemnity_incurredytd
    label: "Indemnity Incurred YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurredamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurredytd
    label: "Adjustment Incurred YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurredamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurredytd
    label: "Defense Incurred YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurredamt}
    filters:
      claim.reservecd: "Defense"  
  
  - measure: claim.paid_loss_mtd
    label: "Paid MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpaidamt}
    
  - measure: claim.indemnity_paid_mtd
    label: "Indemnity Paid MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpaidamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_paid_mtd
    label: "Adjustment Paid MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpaidamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_paid_mtd
    label: "Defense Paid MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdpaidamt}
    filters:
      claim.reservecd: "Defense"  
      
  - measure: claim.paid_loss_ytd
    label: "Paid YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpaidamt}
    
  - measure: claim.indemnity_paidytd
    label: "Indemnity Paid YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpaidamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_paidytd
    label: "Adjustment Paid YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpaidamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_paidytd
    label: "Defense Paid YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdpaidamt}
    filters:
      claim.reservecd: "Defense"      
    
  - measure: claim.paid_loss_itd
    value_format: "#,##0.00"
    label: "Paid ITD"
    type: sum
    sql: ${claim.itdpaidamt}
    
  - measure: claim.indemnity_paiditd
    label: "Indemnity Paid ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${claim.itdpaidamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_paiditd
    label: "Adjustment Paid ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${claim.itdpaidamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_paiditd
    label: "Defense Paid ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${claim.itdpaidamt}
    filters:
      claim.reservecd: "Defense"      
    
  - measure: claim.reserve_change_amt_mtd
    label: "Reserve Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdreservechangeamt} 
    
  - measure: claim.indemnity_reserve_change_amt_mtd
    label: "Indemnity Reserve Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdreservechangeamt} 
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_reserve_change_amt_mtd
    label: "Adjustment Reserve Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdreservechangeamt} 
    filters:
      claim.reservecd: "Adjustment"
      
  - measure: claim.defense_reserve_change_amt_mtd
    label: "Defense Reserve Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdreservechangeamt} 
    filters:
      claim.reservecd: "Defense"      
          
  - measure: claim.reserve_change_amt_ytd
    label: "Reserve Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdreservechangeamt} 
    
  - measure: claim.indemnity_reserve_change_amt_ytd
    label: "Indemnity Reserve Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdreservechangeamt} 
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_reserve_change_amt_ytd
    label: "Adjustment Reserve Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdreservechangeamt} 
    filters:
      claim.reservecd: "Adjustment"
      
  - measure: claim.defense_reserve_change_amt_ytd
    label: "Defense Reserve Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdreservechangeamt} 
    filters:
      claim.reservecd: "Defense"      
             
  - measure: claim.incurred_net_recovery_amt_mtd
    label: "Incurred Net Recovery MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurrednetrecoveryamt} 
    
  - measure: claim.indemnity_incurred_net_recoverymtd
    label: "Indemnity Incurred Net Recovery MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurred_net_recoverymtd
    label: "Adjustment Incurred Net Recovery MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurred_net_recoverymtd
    label: "Defense Incurred Net Recovery MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Defense"      
    
  - measure: claim.incurred_net_recovery_amt_ytd
    label: "Incurred Net Recovery YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurrednetrecoveryamt} 
    
  - measure: claim.indemnity_incurred_net_recoveryytd
    label: "Indemnity Incurred Net Recovery YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurred_net_recoveryytd
    label: "Adjustment Incurred Net Recovery YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurred_net_recoveryytd
    label: "Defense Incurred Net Recovery YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Defense"      
       
  - measure: claim.incurred_net_recovery_amt_itd
    label: "Incurred Net Recovery ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurrednetrecoveryamt} 
    
  - measure: claim.indemnity_incurred_net_recoveryitd
    label: "Indemnity Incurred Net Recovery ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.adjustment_incurred_net_recoveryitd
    label: "Adjustment Incurred Net Recovery ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Adjustment"  
      
  - measure: claim.defense_incurred_net_recoveryitd
    label: "Defense Incurred Net Recovery ITD"
    value_format: "#,##0.00"
    type: sum
    sql: ${itdincurrednetrecoveryamt}
    filters:
      claim.reservecd: "Defense"      
       
  - measure: claim.expected_recovery_change_amt_mtd
    label: "Expected Recovery Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdexpectedrecoverychangeamt} 
    
  - measure: claim.expected_subrogation_change_amt_mtd
    label: "Expected Subrogation Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdexpectedrecoverychangeamt}  
    filters:
      claim.reservecd: "Subrogation"
      
  - measure: claim.expected_salvage_change_amt_mtd
    label: "Expected Salvage Change MTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${mtdexpectedrecoverychangeamt}  
    filters:
      claim.reservecd: "Salvage"    
 
  - measure: claim.expected_recovery_change_amt_ytd
    label: "Expected Recovery Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdexpectedrecoverychangeamt} 
    
  - measure: claim.expected_subrogation_change_amt_ytd
    label: "Expected Subrogation Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdexpectedrecoverychangeamt}  
    filters:
      claim.reservecd: "Subrogation"
      
  - measure: claim.expected_salvage_change_amt_ytd
    label: "Expected Salvage Change YTD"
    value_format: "#,##0.00"
    type: sum
    sql: ${ytdexpectedrecoverychangeamt}  
    filters:
      claim.reservecd: "Salvage"       
    
  - measure: claim.opening_reserve
    label: "Opening Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${openingreserve} 
    
  - measure: claim.opening_indemnity_reserve
    label: "Opening Indemnity Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${openingreserve} 
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.opening_adjustment_reserve
    label: "Opening Adjustment Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${openingreserve} 
    filters:
      claim.reservecd: "Adjustment" 
      
  - measure: claim.opening_defense_reserve
    label: "Opening Defense Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${openingreserve} 
    filters:
      claim.reservecd: "Defense"    
    
  - measure: claim.original_reserve
    label: "Original Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${originalreserve} 
    
  - measure: claim.original_indemnity_reserve
    label: "Original Indemnity Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${originalreserve} 
    filters:
      claim.reservecd: "Indemnity"
      
  - measure: claim.original_adjustment_reserve
    label: "Original Adjustment Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${originalreserve} 
    filters:
      claim.reservecd: "Adjustment" 
      
  - measure: claim.original_defense_reserve
    label: "Original Defense Reserve"
    value_format: "#,##0.00"
    type: sum
    sql: ${originalreserve} 
    filters:
      claim.reservecd: "Defense"   
      
 