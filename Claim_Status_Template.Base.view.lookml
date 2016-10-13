- view: claim_status_template
  sql_table_name: insight.claim_status
  fields:

  - dimension: reportpd
    sql: ${TABLE}.reportpd
    hidden: true  
    
  - dimension: reportperiod
    hidden: true
    view_label: 'Report Dates'
    type: string
    sql: ${TABLE}.reportperiod

  - dimension: claim_number
    view_label: 'Claim Details'
    hidden: True
    sql: ${TABLE}.claimnumber
    
  - dimension: claimantcode
    hidden: True
    type: string
    sql: ${TABLE}.claimantcode
    
  - dimension: featurecode
    hidden: True
    type: string
    sql: ${TABLE}.featurecode
    
  - dimension: adjuster_code
    view_label: 'Claim Organization'
    type: string
    sql: ${TABLE}.adjuster

  - dimension: adjusterref
    view_label: 'Claim Organization'
    label: 'Adjuster Ref'
    type: number
    sql: ${TABLE}.adjusterref
    
#   - dimension: activity_in_month
#     view_label: 'Claim Status Indicators'
#     type: string
#     sql: ${TABLE}.statactivity

  - dimension: claim_open_date
    description: 'Date claim was first entered into the system'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.claimadddt
    
  - dimension: claimstatus
    hidden: True
    type: string
    sql: ${TABLE}.claimstatus
    
  - dimension: claim_status
    description: 'Status of the overall claim'
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.claimstatus

  - dimension: claimstatusactivity
    type: string
    sql: ${TABLE}.claimstatusactivity

  - dimension_group: claimupdatedate
    label: 'Claim Update'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.claimupdatedate

  - dimension: closed1000lessitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month <= 1000 ITD"
    type: string
    sql: ${TABLE}.closed1000lessitd

  - dimension: closed1000lessmtd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 1000 MTD"
    type: string
    sql: ${TABLE}.closed1000lessmtd

  - dimension: closed1000lessytd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 1000 YTD"
    type: string
    sql: ${TABLE}.closed1000lessytd

  - dimension: closed500lessitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month<= 500 ITD"
    type: string
    sql: ${TABLE}.closed500lessitd

  - dimension: closed500lessmtd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 500 MTD"
    type: string
    sql: ${TABLE}.closed500lessmtd

  - dimension: closed500lessytd
    view_label: 'Claim Status Indicators'
    hidden: true
    label: "Closed in Month <= 500 YTD"
    type: string
    sql: ${TABLE}.closed500lessytd

  - dimension: claim_closed_date
    description: 'Date Claim was Closed'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.closeddate  

  - dimension: closed_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.closedinmonth

  - dimension: closed_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.closedinyear

  - dimension: closednopayitd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay ITD"
    type: string
    sql: ${TABLE}.closednopayitd

  - dimension: closednopayitdyearend
    view_label: 'Claim Status Indicators'
    label: "Closed in Year No Pay ITD"
    type: string
    sql: ${TABLE}.closednopayitdyearend

  - dimension: closednopaymtd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay MTD"
    type: string
    sql: ${TABLE}.closednopaymtd

  - dimension: closednopayytd
    view_label: 'Claim Status Indicators'
    label: "Closed in Month No Pay YTD"
    type: string
    sql: ${TABLE}.closednopayytd

  - dimension: closednopayytdyearend
    view_label: 'Claim Status Indicators'
    label: "Closed in Year No Pay YTD"
    type: string
    sql: ${TABLE}.closednopayytdyearend

  - dimension: claims_days_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daysopen

  - dimension: days_to_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daystoopen

  - dimension: days_to_report
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.daystoreport
    
  - dimension: doi_complaint_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.doicomplaintind

  - dimension: exaiminer_code
    view_label: 'Claim Organization'
    type: string
    sql: ${TABLE}.exaiminer

  - dimension: exaiminerref
    view_label: 'Claim Organization'
    label: 'Exaiminer Ref'
    type: number
    sql: ${TABLE}.exaiminerref

  - dimension: featureclosed1000lessitd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 ITD'
    type: string
    sql: ${TABLE}.featureclosed1000lessitd

  - dimension: featureclosed1000lessmtd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 MTD'
    type: string
    sql: ${TABLE}.featureclosed1000lessmtd

  - dimension: featureclosed1000lessytd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 1000 YTD'
    type: string
    sql: ${TABLE}.featureclosed1000lessytd

  - dimension: featureclosed500lessitd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 ITD'
    type: string
    sql: ${TABLE}.featureclosed500lessitd

  - dimension: featureclosed500lessmtd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 MTD'
    type: string
    sql: ${TABLE}.featureclosed500lessmtd
    
  - dimension: featureclosed500lessytd
    view_label: 'Feature Status Indicators'
    label: 'Feature Closed < 500 YTD'
    type: string
    sql: ${TABLE}.featureclosed500lessytd

  - dimension: feature_closed_date
    view_label: 'Feature Dates'
    type: date
    sql: ${TABLE}.featurecloseddate

  - dimension: feature_closed_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosedinmonth

  - dimension: feature_closed_no_pay_itd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopayitd

  - dimension: feature_closed_no_pay_mtd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopaymtd

  - dimension: feature_closed_no_pay_ytd
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureclosednopayytd

  - dimension: feature_days_open
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${TABLE}.featuredaysopen

  - dimension: feature_open_date
    view_label: 'Feature Dates'
    type: date
    sql: ${TABLE}.featureopendate

  - dimension: feature_opened_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featureopenedinmonth

  - dimension: feature_reopen_date
    view_label: 'Feature Dates'
    type: date
#     timeframes: [date, week, month]
#     convert_tz: false
    sql: ${TABLE}.featurereopendate

  - dimension: feature_reopen_in_month
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurereopeninmonth

  - dimension: feature_activity
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurestatactivity

  - dimension: feature_status
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurestatus

  - dimension: feature_total_days_open
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${TABLE}.featuretotaldaysopen

  - dimension_group: featureupdatedate
    label: 'Feature Update'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.featureupdatedate

  - dimension: feature_zero_outstanding
    view_label: 'Feature Status Indicators'
    type: string
    sql: ${TABLE}.featurezerooutstanding

  - dimension: fraud_score
    view_label: 'Fraud Score'
    type: string
    sql: ${TABLE}.fraudscore

  - dimension: fraud_score_description
    view_label: 'Fraud Score'
    type: string
    sql: ${TABLE}.fraudscoredescription

  - dimension: in_siu_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.insiuind
  
  - dimension: itdpaidamt
    type: number
    hidden: true
    sql: ${claim.itdpaidamt}

  - dimension: occurred_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.occurredinmonth

  - dimension: opened_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.openedinmonth

  - dimension: opened_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.openedinyear

  - dimension: claim_reopen_date
    description: 'Date claim was reopened'
    view_label: 'Claim Dates'
    type: date
    sql: ${TABLE}.reopendate

  - dimension: reopen_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reopeninmonth

  - dimension: reported_by
    description: 'Party that reported the claim'
    type: string
    sql: ${TABLE}.reportedby

  - dimension: reported_to
    type: string
    sql: ${TABLE}.reportedto

  - dimension: reported_in_month
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reportinmonth

  - dimension: reported_in_year
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.reportinyear

  - dimension: short_desc
    view_label: 'Claim Details'
    type: string
    sql: ${TABLE}.shortdesc

  - dimension: suit_filed_ind
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.suitfiledind

  - dimension: claims_total_days_open
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${TABLE}.totaldaysopen

  - dimension: zero_outstanding
    view_label: 'Claim Status Indicators'
    type: string
    sql: ${TABLE}.zerooutstanding

  - measure: count
    type: count
    drill_fields: detail*
      
  - measure: count_distinct_claim
    view_label: 'Claim Counts and Days'
    label: "Distinct Claim Count"
    type: count_distinct
    sql: ${claim_number} 
  
  - measure: opened_claim_count
    view_label: 'Claim Counts and Days'
    label: 'Opened in Month Claim Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      opened_in_month: "Yes" 
      
  - measure: open_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    label: 'Open Claims in Month with Payment Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Open"
      claimstatusactivity: "Yes"
      opened_in_month: "Yes"
      itdpaidamt: ">0"
      
  - measure: opened_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      opened_in_year: "Yes"  
      
  - measure: reported_claim_count
    label: 'Reported in Month Claim Count'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      reported_in_month: "Yes"    
      
  - measure: reported_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      reported_in_year: "Yes"     
        
  - measure: claim_occurred_in_month_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      occurred_in_month: "Yes"        
      
  - measure: closed_claim_count
    label: 'Closed in Month Claim Count'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closed_in_month: "Yes"      
      
  - measure: closed_in_year_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closed_in_year: "Yes"     
      
  - measure: closed_claim_no_pay_count
    label: 'Closed in Month Claim No Pay'
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closednopayitd: "Yes"
      
  - measure: closed_in_year_claim_no_pay_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closednopayytdyearend: "Yes"      
      
  - measure: closed_claim_lessthan_500_count
    view_label: 'Claim Counts and Days'
    label: "Closed Claim in Month - Payment <= 500 - Count"
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closed500lessitd: "Yes"   
    
  - measure: closed_claim_lessthan_1000_count
    view_label: 'Claim Counts and Days'
    label: "Closed Claim in Month - Payment <= 1000 - Count"
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closed1000lessitd: "Yes"    
      
  - measure: closed_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    label: 'Closed Claim in Month with Payment Count'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      closednopayitd: "No"    
      
  - measure: closed_in_year_claim_with_pay_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      closednopayitdyearend: "No"       
      
  - measure: claims_with_activity_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatusactivity: "Yes"    
      
  - measure: reopened_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery"  
      claimstatusactivity: "Yes"
      
  - measure: open_claim_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
      
  - measure: open_claim_without_activity_count
    view_label: 'Claim Counts and Days'
    type: number
    sql: ${open_claim_count}-${open__claim_with_activity_count}
   
  - measure: open__claim_with_activity_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
      claimstatusactivity: "Yes"  
      
  - measure: claims_open_with_zero_reserves_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      zero_outstanding: "Yes"

  - measure: claims_open_non_zero_reserves_count
    view_label: 'Claim Counts and Days'
    type: count_distinct
    sql: ${claim_number}
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      zero_outstanding: "No"       
    
  - measure: closed_to_open_ratio
    view_label: 'Claim Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_claim_count}))/NULLIF(${open_claim_count},0)) 
    value_format: '0.00'
    
  - measure: closed_to_opened_ratio
    view_label: 'Claim Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_claim_count}))/NULLIF((${opened_claim_count})+(${reopened_claim_count}),0)) 
    value_format: '0.00'  

  - measure: percentage_open_claims_without_activity
    view_label: 'Claim Ratios & Percentages'
    label: "% Open Without Activity"
    type: number
    sql: ((1.0*(${open_claim_without_activity_count}))/NULLIF(${open_claim_count},0))
    value_format: '0.00%'
    
  - measure: percentage_closed_claims_without_payment
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - No Pay"
    type: number
    sql: ((1.0*(${closed_claim_no_pay_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%'   
    
  - measure: percentage_closed_claims_with_payment_less_500
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - Paid <= 500"
    type: number
    sql: ((1.0*(${closed_claim_lessthan_500_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%'    
    
  - measure: percentage_closed_claims_with_payment_less_1000
    view_label: 'Claim Ratios & Percentages'
    label: "% Closed - Paid <= 1000"
    type: number
    sql: ((1.0*(${closed_claim_lessthan_1000_count}))/NULLIF(${closed_claim_count},0))
    value_format: '0.00%'    
      
  - measure: percentage_open_claims_with_zero_reserves
    view_label: 'Claim Ratios & Percentages'
    label: "% Open With No Reserves"
    type: number
    sql: ((1.0*(${claims_open_with_zero_reserves_count}))/NULLIF(${open_claim_count},0))
    value_format: '0.00%'  
    
  
    
  - measure: average_total_cycle_all_claims 
    view_label: 'Claim Averages'
    description: 'Average number of days since open date, reopen date not contemplated'
    type: avg_distinct
    sql: ${TABLE}.totaldaysopen
    sql_distinct_key: ${TABLE}.claimnumber
    
  - measure: average_cycle_all_claims 
    view_label: 'Claim Averages'
    description: 'Average number of days since open or reopen date'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber    
    
  - measure: average_days_to_close 
    view_label: 'Claim Averages'
    description: 'Average number of days to close claim in month'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber  
    filters:
      claimstatus: "Closed"
      claimstatusactivity: "Yes"
      
  - measure: average_days_open_not_closed 
    view_label: 'Claim Averages'
    description: 'Average number of days to open for outstanding claims'
    type: avg_distinct
    sql: ${TABLE}.daysopen
    sql_distinct_key: ${TABLE}.claimnumber  
    filters:
      claimstatus: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"      

  - measure: count_distinct_feature
    view_label: 'Feature Counts and Days'
    label: "Distinct Feature Count"
    type: count_distinct
    sql:  '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
  
  - measure: opened_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_opened_in_month: "Yes"
  
  - measure: closed_feature_paid_loss_itd
    hidden: true
    label: 'Paid Loss ITD for Features Closed in Month'
    description: 'Paid ITD for Features Closed in Month'
    type: sum
    sql: ${itdpaidamt}
    filters:
      feature_closed_in_month: "Yes"
      
  - measure: feature_average_paid_loss_itd
    label: 'Closed Feature Severity'
    description: 'Claim Severity for Claims Closed in Month - (${closed_feature_paid_loss_itd}/NULLIF(${closed_feature_count},0))'
    view_label: 'Feature Averages'
    type: number
    sql: (${closed_feature_paid_loss_itd}/NULLIF(${closed_feature_count},0))
  
  - measure: closed_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode' 
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      
  - measure: closed_feature_no_pay_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      feature_closed_no_pay_itd: "Yes"
      
  - measure: closed_feature_lessthan_500_count
    view_label: 'Feature Counts and Days'
    label: "Closed Feature - Payment <= 500 - Count"
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      featureclosed500lessitd: "Yes"   
    
  - measure: closed_feature_lessthan_1000_count
    view_label: 'Feature Counts and Days'
    label: "Closed Feature - Payment <= 1000 - Count"
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      featureclosed1000lessitd: "Yes"    
      
  - measure: closed_feature_with_pay_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      closednopayitd: "No"    
      
  - measure: feature_with_activity_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_activity: "Yes"    
      
  - measure: reopened_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery"  
      feature_activity: "Yes"
      
  - measure: open_feature_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
      
  - measure: open_feature_without_activity_count
    view_label: 'Feature Counts and Days'
    type: number
    sql: ${open_feature_count}-${open_feature_with_activity_count}
   
      
  - measure: open_feature_with_activity_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery" 
      feature_activity: "Yes"  
      
  - measure: open_feature_with_zero_reserves_count
    view_label: 'Feature Counts and Days'
    type: count_distinct
    sql: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
      feature_zero_outstanding: "Yes"
       
  - measure: feature_closed_to_open_ratio
    view_label: 'Feature Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_feature_count}))/NULLIF(${open_feature_count},0)) 
    value_format: '0.00'
    
  - measure: feature_closed_to_opened_ratio
    view_label: 'Feature Ratios & Percentages'
    type: number
    sql: ((1.0*(${closed_feature_count}))/NULLIF((${opened_feature_count})+(${reopened_feature_count}),0)) 
    value_format: '0.00'  

  - measure: percentage_open_features_without_activity
    view_label: 'Feature Ratios & Percentages'
    label: "% Open Features Without Activity"
    type: number
    sql: ((1.0*(${open_feature_without_activity_count}))/NULLIF(${open_feature_count},0))
    value_format: '0.00%'
    
  - measure: percentage_closed_features_without_payment
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - No Pay"
    type: number
    sql: ((1.0*(${closed_feature_no_pay_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%'   
    
  - measure: percentage_closed_features_with_payment_less_500
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - Paid <= 500"
    type: number
    sql: ((1.0*(${closed_feature_lessthan_500_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%'    
    
  - measure: percentage_closed_features_with_payment_less_1000
    view_label: 'Feature Ratios & Percentages'
    label: "% Closed Features - Paid <= 1000"
    type: number
    sql: ((1.0*(${closed_feature_lessthan_1000_count}))/NULLIF(${closed_feature_count},0))
    value_format: '0.00%'    
      
  - measure: percentage_open_features_with_zero_reserves
    view_label: 'Feature Ratios & Percentages'
    label: "% Open Features With No Reserves"
    type: number
    sql: ((1.0*(${open_feature_with_zero_reserves_count}))/NULLIF(${open_feature_count},0))
    value_format: '0.00%'  
  - measure: closed_paid_loss_itd
    hidden: true
    label: 'Paid Loss ITD for Claims Closed in Month'
    description: 'Paid ITD for Claims Closed in Month'
    type: sum
    sql: ${itdpaidamt}
    filters:
      closed_in_month: "Yes"
   
  
  - measure: average_paid_loss_itd
    label: 'Closed Claim Severity'
    description: 'Claim Severity for Claims Closed in Month - (${closed_paid_loss_itd}/NULLIF(${closed_claim_count},0))'
    view_label: 'Claim Averages'
    type: number
    sql: (${closed_paid_loss_itd}/NULLIF(${closed_claim_count},0))
    
  - measure: open_outstanding_reserve
    hidden: true
    label: 'Reserve for Open Claims'
    type: sum
    sql: ${outstandingamt} 
    filter: 
     claim_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"    
 
  - measure: average_outstanding_reserve
    description: 'Average Outstanding Reserve - (${open_outstanding_reserve}/NULLIF(${open_claim_count},0))'
    label: 'Average Reserve for Open Claims'
    view_label: 'Claim Averages'
    type: number
    sql: (${open_outstanding_reserve}/NULLIF(${open_claim_count},0))  
  
  - measure: open_incurred_loss_itd
    hidden: true
    label: 'Incurred Loss for Open Claims'
    description: 'Incurred Loss for Open Claims'
    type: sum
    sql: ${itdincurredamt} 
    filter: 
     claim_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"  
 
  - measure: average_incurred_loss_itd
    label: 'Average Incurred Loss for Open Claims'
    description: 'Potential severity for Open Claims - (${open_incurred_loss_itd}/NULLIF(${open_claim_count},0)) '
    view_label: 'Claim Averages'
    type: number
    sql: (${open_incurred_loss_itd}/NULLIF(${open_claim_count},0)) 

  - measure: average_total_cycle_all_features
    view_label: 'Feature Averages'
    description: 'Average number of days since open date, reopen date not contemplated - Feature'
    type: avg_distinct
    sql: ${TABLE}.featuretotaldaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    
  - measure: average_cycle_all_features
    view_label: 'Feature Averages'
    description: 'Average number of days since open or reopen date - Features'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'    
    
  - measure: average_days_to_close_feature 
    view_label: 'Feature Averages'
    description: 'Average number of days to close feature in month'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode' 
    filters:
      feature_status: "Closed"
      feature_activity: "Yes"
      
  - measure: average_days_open_feature_not_closed 
    view_label: 'Feature Averages'
    description: 'Average number of days to open for outstanding features'
    type: avg_distinct
    sql: ${TABLE}.featuredaysopen
    sql_distinct_key: '${TABLE}.claimnumber || ${TABLE}.claimantcode || ${TABLE}.featurecode'
    filters:
      feature_status: "Reopen,Reopen-Adjustment,Reopen-Recovery,Open,Open-Adjustment,Open-Recovery"   
  
  