- view: claim_reinsurance_summary_template
  sql_table_name: dw.claimreinsurancesummarystats
  fields:

  - dimension: id
    hidden: true
    primary_key: false
    type: string
    sql: ${TABLE}.id

  - dimension: annualstatementlinecd
    view_label: Policy Coverage Terms
    label: 'Annual Statement Line'
    description: 'Coverage Level Annual Statement Line Code'
    type: string
    sql: ${TABLE}.annualstatementlinecd

  - dimension_group: awarenessdt
    hidden: true
    view_label: Claim Dates
    label: 'Awareness'
    description:    
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.awarenessdt

  - dimension: carriercd
    view_label: Policy Classification
    label: 'Carrier'
    description:    
    type: string
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    view_label: Policy Classification
    label: 'Carrier Group'
    description:
    type: string
    sql: ${TABLE}.carriergroupcd

  - dimension: catastrophenumber
    view_label: Claim Details
    label: 'Catastrophe Number'
    description:
    type: string
    sql: ${TABLE}.catastrophenumber

  - dimension: catastropheref
    view_label: Claim Details
    label: 'Catastrophe Reference'
    description:
    type: string
    sql: ${TABLE}.catastropheref

  - dimension: claimnumber
    view_label: Claim Details
    label: 'Claim Number'
    description:
    type: string
    sql: ${TABLE}.claimnumber

  - dimension: claimref
    view_label: Claim Details
    label: 'Claim Ref'
    description:
    type: number
    sql: ${TABLE}.claimref

  - dimension: claimstatuscd
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.claimstatuscd

  - dimension: classificationcd
    hidden: false
    view_label:  Tranaction Details
    label: 'Classification Code' 
    description:
    type: string
    sql: ${TABLE}.classificationcd

  - dimension: coveragetriggercd
    hidden: true
    view_label:  
    label: 'Coverage Trigger Code'
    description:
    type: string
    sql: ${TABLE}.coveragetriggercd

  - dimension: customerref
    view_label: Policy Contacts
    label: 'Customer Reference'
    description:
    type: number
    sql: ${TABLE}.customerref

  - dimension_group: effectivedt
    view_label:  Policy Coverage Terms
    label: 'Effective Date'
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effectivedt

  - dimension_group: expirationdt
    view_label:  Policy Coverage Terms
    label: 'Expiration Date'
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.expirationdt

  - dimension: losscausecd
    view_label: Claim Details
    label: 'Loss Cause'
    description:
    type: string
    sql: ${TABLE}.losscausecd

  - dimension_group: lossdt
    view_label: Claim Dates
    label: 'Loss'
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.lossdt

  - dimension: lossyear
    view_label: Claim Dates
    label: 'Loss Year'
    description:
    type: string
    sql: ${TABLE}.lossyear

  - dimension: mastersubind
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.mastersubind

  - dimension: paymenttypecd
    view_label:  Transaction Detail
    label: 'Payment Type Code'
    description:
    type: string
    sql: ${TABLE}.paymenttypecd

  - dimension: policygroupcd
    view_label:  Policy Classification
    label:  'Policy Group'
    description:
    type: string
    sql: ${TABLE}.policygroupcd

  - dimension: policynumber
    view_label: Policy Coverage Terms
    label: 'Policy Number'
    description:
    type: string
    sql: ${TABLE}.policynumber

  - dimension: policyproductname
    view_label:  Policy Classification
    label:  'Policy Product'
    description:
    type: string
    sql: ${TABLE}.policyproductname

  - dimension: policyproductversionidref
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.policyproductversionidref

  - dimension: policyref
    view_label: Policy Coverage Terms
    label: 'Policy Ref'
    description:
    type: number
    sql: ${TABLE}.policyref

  - dimension: policytypecd
    view_label:  Policy Classification
    label: 'Policy Type'
    description:
    type: string
    sql: ${TABLE}.policytypecd

  - dimension: policyversion
    view_label: Policy Coverage Terms
    label: 'Policy Version'
    description:
    type: string
    sql: ${TABLE}.policyversion

  - dimension: policyyear
    view_label: Policy Coverage Terms
    label: 'Policy Year'
    description:
    type: string
    sql: ${TABLE}.policyyear

  - dimension: productlinecd
    view_label:  Policy Classification
    label: 'Product Line Code' 
    description:
    type: string
    sql: ${TABLE}.productlinecd

  - dimension: productname
    view_label:  Policy Classification
    label: 'Product Name'
    description:
    type: string
    sql: ${TABLE}.productname

  - dimension: productversionidref
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.productversionidref

  - dimension: reinsuranceitemname
    view_label:  Treaty Detail
    label: 'Reinsurance Item Name' 
    description:
    type: string
    sql: ${TABLE}.reinsuranceitemname

  - dimension: reinsurancename
    view_label:  Treaty Detail
    label:  'Reinsurance Name'
    description:
    type: string
    sql: ${TABLE}.reinsurancename

  - dimension_group: reportdt
    view_label:  Claim Dates
    label:  'Report'
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.reportdt

  - dimension: reportperiod
    hidden: true
    type: string
    sql: ${TABLE}.reportperiod
    
  - dimension_group: report_period
    label: "Report Period"
    view_label: 'Report Period Dates'
    type: time
    convert_tz: false
    timeframes: [month, year]
    sql: ${TABLE}.updatedt    

  - dimension: reservecd
    view_label:  Claim Details
    label:  'Reserve'
    description:
    type: string
    sql: ${TABLE}.reservecd

  - dimension: reservetypecd
    view_label:  Claim Details
    label:  'Reserve Type Code'
    description:
    type: string
    sql: ${TABLE}.reservetypecd

  - dimension: statecd
    view_label:  Location
    label: 'State Code'
    description:
    type: string
    sql: ${TABLE}.statecd

  - dimension: statuscd
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.statuscd
    
  - dimension: attachmentpoint
    hidden: false
    view_label:  Treaty Detail
    label: 'Attachment Point'
    description:
    type: string
    sql: ${TABLE}.startlimit 

  - dimension: sublosscausecd
    view_label:  Claim Details
    label: 'Sub Loss Cause'
    description:
    type: string
    sql: ${TABLE}.sublosscausecd

  - dimension: summarykey
    hidden: true
    view_label:  
    label:  
    description:
    type: string
    sql: ${TABLE}.summarykey

  - dimension: systemid
    hidden: true
    view_label:  
    label:  
    description:
    type: number
    value_format_name: id
    sql: ${TABLE}.systemid

  - dimension: transactioncd
    view_label:  Transaction Detail
    label: 'Transaction Code'
    description:
    type: string
    sql: ${TABLE}.transactioncd

  - dimension: transactionnumber
    view_label:  Transaction Detail
    label: 'Transaction Number' 
    description:
    type: number
    sql: ${TABLE}.transactionnumber

  - dimension_group: updatedt
    hidden: true
    view_label:  
    label:  
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.updatedt

  - measure: count
    hidden: true
    view_label: Counts
    label: 
    description:
    type: count
    drill_fields: [id, reinsurancename, reinsuranceitemname, productname, policyproductname]
    
  - measure: count_policies
    view_label: Counts
    label: 'Distinct Policy Count'
    description:
    type: count_distinct
    sql: ${policyref}
    
  - measure: count_claim
    view_label: Counts
    label: 'Distinct Claims'
    description:
    type: count_distinct
    sql: ${claimref}    

  - measure: outstandingamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Reserve'
    description: 'The Ceded reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt
 
  - measure: outstandingadjustmentamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Adjustment Reserve'
    description: 'The Ceded adjustment reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt   
    filters:
      reservecd: "Adjustment"    
      
  - measure: outstandingdefenseamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Defense Reserve'
    description: 'The Ceded defense reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt   
    filters:
      reservecd: "Defense" 

  - measure: outstandingindemnityamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Indemnity Reserve'
    description: 'The Ceded defense reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt   
    filters:
      reservecd: "Indemnity" 
      
  - measure: outstandingexpenseamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Expense Reserve'
    description: 'The Ceded expense reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt   
    filters:
      reservetypecd: "Expense"      
      
  - measure: priorytdoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Ceded Outstanding Reserve'
    description: 'The Ceded reserve total at the end of the previous year end'
    type: number
    sql: (${claim_reinsurance_summary.outstandingamt}-${claim_reinsurance_summary.ytdreservechangeamt})

  - measure: mtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Resereve Change MTD'
    description: 'The Ceded reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt
    
  - measure: mtdexpensereservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Expense Resereve Change MTD'
    description: 'The Ceded expense reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt
    filters:
      reservetypecd: "Expense" 
    
  - measure: mtdadjustmentreservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Resereve Change MTD'
    description: 'The Ceded adjustment reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt
    filters:
      reservecd: "Adjustment" 
    
  - measure: mtddefensereservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Defense Resereve Change MTD'
    description: 'The Ceded defense reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt
    filters:
      reservecd: "Defense" 
    
  - measure: mtdindemnityreservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Indemnity Resereve Change MTD'
    description: 'The Ceded indemnity reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt
    filters:
      reservecd: "Indemnity" 

  - measure: ytdreservechangeamt
    view_label: Year To Date Measures
    label: 'Ceded Resereve Change YTD'
    description: 'The Ceded reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt

  - measure: ytdindemnityreservechangeamt
    view_label: Year To Date Measures
    label: 'Ceded Indemnity Resereve Change YTD'
    description: 'The Ceded indemnity reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt
    filters:
      reservecd: "Indemnity" 
      
  - measure: ytddefensereservechangeamt
    view_label: Year To Date Measures
    label: 'Ceded Defense Resereve Change YTD'
    description: 'The Ceded defense reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt
    filters:
      reservecd: "Defense" 
      
  - measure: ytdadjustmentreservechangeamt
    view_label: Year To Date Measures
    label: 'Ceded Adjustment Resereve Change YTD'
    description: 'The Ceded adjustment reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt
    filters:
      reservecd: "Adjustment" 
      
  - measure: ytdexpensereservechangeamt
    view_label: Year To Date Measures
    label: 'Ceded Expense Resereve Change YTD'
    description: 'The Ceded expense reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt
    filters:
      reservetypecd: "Expense" 

  - measure: outstandingexpectedrecoveryamt
    hidden: true
    view_label: Point In Time Measures
    label: 'Outstanding Expected Reinsurance Recovery'
    description: 'The outstanding expected reinsurance recovery not recieved'
    type: sum
    sql: ${TABLE}.outstandingexpectedrecoveryamt

  - measure: mtdexpectedrecoverychangeamt
    hidden: true       
    view_label: Month to Date Measures
    label: 'Expected Reinsurance Recovery MTD'
    description: 'The expected reinsurance recovery change in month'
    type: sum
    sql: ${TABLE}.mtdexpectedrecoverychangeamt

  - measure: ytdexpectedrecoverychangeamt
    hidden: true
    view_label: Year To Date Measures
    label: 'Expected Reinsurance Recovery YTD'
    description: 'The expected reinsurance recovery change in year'
    type: sum
    sql: ${TABLE}.ytdexpectedrecoverychangeamt

  - measure: itdpaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Paid Loss ITD'
    description: 'Ceded Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt

  - measure: itdexpensepaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Expense Paid Loss ITD'
    description: 'Ceded Expense Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt    
    filters:
      reservetypecd: "Expense" 
      
  - measure: itdadjustmentpaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Adjustment Paid Loss ITD'
    description: 'Ceded Adjustment Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt    
    filters:
      reservecd: "Adjustment" 
      
  - measure: itddefensepaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Defense Paid Loss ITD'
    description: 'Ceded Defense Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt    
    filters:
      reservecd: "Defense" 
      
  - measure: itdindemnitypaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Indemnity Paid Loss ITD'
    description: 'Ceded Indemnity Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt    
    filters:
      reservecd: "Indemnity" 

  - measure: mtdpaidamt
    view_label: Month to Date Measures
    label: 'Ceded Paid Loss MTD'
    description: 'Ceded Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt
    
  - measure: mtdexpensepaidamt
    view_label: Month to Date Measures
    label: 'Ceded Expense Paid Loss MTD'
    description: 'Ceded Expense Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt
    filters:
      reservetypecd: "Expense" 
      
  - measure: mtdddjustmentpaidamt
    view_label: Month to Date Measures
    label: 'Ceded Adjustment Paid Loss MTD'
    description: 'Ceded Adjustment Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt
    filters:
      reservecd: "Adjustment"
      
  - measure: mtddefensepaidamt
    view_label: Month to Date Measures
    label: 'Ceded Defense Paid Loss MTD'
    description: 'Ceded Defense Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt
    filters:
      reservecd: "Defense"
      
  - measure: mtdindemnitypaidamt
    view_label: Month to Date Measures
    label: 'Ceded Indemnity Paid Loss MTD'
    description: 'Ceded Indemnity Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt
    filters:
      reservecd: "Indemnity"

  - measure: ytdpaidamt
    view_label: Year To Date Measures
    label: 'Ceded Paid Loss YTD'
    description: 'Ceded Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt
 
  - measure: ytdexpensepaidamt
    view_label: Year To Date Measures
    label: 'Ceded Expense Paid Loss YTD'
    description: 'Ceded Expense Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt   
    filters:
      reservetypecd: "Expense" 
      
  - measure: ytdadjustmentpaidamt
    view_label: Year To Date Measures
    label: 'Ceded Adjustment Paid Loss YTD'
    description: 'Ceded Adjustment Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt   
    filters:
      reservecd: "Adjustment" 
      
  - measure: ytddefensepaidamt
    view_label: Year To Date Measures
    label: 'Ceded Defense Paid Loss YTD'
    description: 'Ceded Defense Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt   
    filters:
      reservecd: "Defense" 
      
  - measure: ytdindemnitypaidamt
    view_label: Year To Date Measures
    label: 'Ceded Indemnity Paid Loss YTD'
    description: 'Ceded Indemnity Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt   
    filters:
      reservecd: "Indemnity" 

  - measure: itdpostedrecoveryamt
    view_label: Inception To Date Measures
    label: 'Posted Reinsurance Recovery ITD'
    description: 'Reinsurance Recovery received from inception'
    type: sum
    sql: ${TABLE}.itdpostedrecoveryamt

  - measure: mtdpostedrecoveryamt
    view_label: Month to Date Measures
    label: 'Posted Reinsurance Recovery MTD'
    description: 'Reinsurance Recovery received during month'
    type: sum
    sql: ${TABLE}.mtdpostedrecoveryamt

  - measure: ytdpostedrecoveryamt
    view_label: Year To Date Measures
    label: 'Posted Reinsurance Recovery YTD'
    description: 'Reinsurance Recovery received during year'
    type: sum
    sql: ${TABLE}.ytdpostedrecoveryamt

  - measure: itdincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss ITD'
    description: 'Ceded Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt
 
  - measure: itdindemnityincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Indemnity Incurred Loss ITD'
    description: 'Ceded Indemnity Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt   
    filters:
      reservecd: "Indemnity" 
      
  - measure: itdadjustmentincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Adjustment Incurred Loss ITD'
    description: 'Ceded Adjustment Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt   
    filters:
      reservecd: "Adjustment"
      
  - measure: itddefenseincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Defense Incurred Loss ITD'
    description: 'Ceded Defense Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt   
    filters:
      reservecd: "Defense"
      
  - measure: itdexpenseincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Expense Incurred Loss ITD'
    description: 'Ceded Expense Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt   
    filters:
      reservetypecd: "Expense"

  - measure: mtdincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss MTD'
    description: 'Ceded Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt
    
  - measure: mtdindemnityincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Indemnity Incurred Loss MTD'
    description: 'Ceded Indemnity Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt
    filters:
      reservecd: "Indemnity"
      
  - measure: mtdadjustmentincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Adjustment Incurred Loss MTD'
    description: 'Ceded Adjustment Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt
    filters:
      reservecd: "Adjustment"
      
  - measure: mtddefenseincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Defense Incurred Loss MTD'
    description: 'Ceded Defense Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt
    filters:
      reservecd: "Defense"
      
  - measure: mtdexpenseincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Expense Incurred Loss MTD'
    description: 'Ceded Expense Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt
    filters:
      reservetypecd: "Expense"

  - measure: ytdincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss YTD'
    description: 'Ceded Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt
  
  - measure: ytdadjustmentincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Adjustment Incurred Loss YTD'
    description: 'Ceded Adjustment Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt  
    filters:
      reservecd: "Adjustment" 
      
  - measure: ytddefenseincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Defense Incurred Loss YTD'
    description: 'Ceded Defense Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt  
    filters:
      reservecd: "Defense" 
      
  - measure: ytdexpenseincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Expense Incurred Loss YTD'
    description: 'Ceded Expense Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt  
    filters:
      reservetypecd: "Expense" 
      
  - measure: ytdindemnityincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Indemnity Incurred Loss YTD'
    description: 'Ceded Indemnity Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt  
    filters:
      reservecd: "Indemnity" 

  - measure: itdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery ITD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery since inception'
    type: sum
    sql: ${TABLE}.itdincurrednetrecoveryamt

  - measure: mtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery MTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during month'
    type: sum
    sql: ${TABLE}.mtdincurrednetrecoveryamt

  - measure: ytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery YTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during year'
    type: sum
    sql: ${TABLE}.ytdincurrednetrecoveryamt
