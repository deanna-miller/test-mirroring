- view: policy_reinsurance_summary_template 
  sql_table_name: dw.policyreinsurancesummarystats
  fields:

  - dimension_group: accountingdt
    label: 'Accounting'
    view_label: Transaction Detail
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.accountingdt

  - dimension: annualstatementlinecd
    label: 'Annual Statement Line'
    view_label: Policy Coverage Terms
    description:
    type: string
    sql: ${TABLE}.annualstatementlinecd

  - dimension: carriercd
    label: 'Carrier'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: 'Carrier Group'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.carriergroupcd

  - dimension: combinedkey
    hidden: true
    label:
    view_label:
    description:
    type: string
    sql: ${TABLE}.combinedkey

  - dimension: contractreinsuranceind
    label: 'Contract Reinsurance Ind'
    view_label: Reinsurance Terms
    description:
    type: string
    sql: ${TABLE}.contractreinsuranceind

  - dimension: customerref
    label: 'Customer Reference'
    view_label: Policy Contacts
    description:
    type: number
    sql: ${TABLE}.customerref

  - dimension_group: effectivedt
    label: 'Effective'
    view_label: Policy Coverage Terms
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effectivedt

  - dimension_group: expirationdt
    label: 'Expiration'
    view_label: Policy Coverage Terms
    description:
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.expirationdt

  - dimension: insurancetypecd
    label: 'Insurance Type Code'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.insurancetypecd

  - dimension: mastersubind
    hidden: true
    label:
    view_label:
    description:
    type: string
    sql: ${TABLE}.mastersubind

  - dimension: newrenewalcd
    label: 'New or Renewal'
    view_label: Policy Indicator
    description:
    type: string
    sql: ${TABLE}.newrenewalcd

  - dimension: policygroupcd
    label: 'Policy Group'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.policygroupcd

  - dimension: policynumber
    label: 'Policy Number'
    view_label: Policy Coverage Terms
    description:
    type: string
    sql: ${TABLE}.policynumber

  - dimension: policyref
    hidden: true
    label:
    view_label:
    description:
    type: number
    sql: ${TABLE}.policyref

  - dimension: policystatuscd
    hidden: true
    label:
    view_label:
    description:
    type: string
    sql: ${TABLE}.policystatuscd

  - dimension: policytypecd
    label: 'Policy Type'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.policytypecd

  - dimension: policyversion
    label: 'Policy Version'
    view_label: Policy Coverage Terms
    description:
    type: string
    sql: ${TABLE}.policyversion

  - dimension: policyyear
    label: 'Policy Year'
    view_label: Policy Coverage Terms
    description:
    type: string
    sql: ${TABLE}.policyyear

  - dimension: productname
    label: 'Product Name'
    view_label: Policy Coverage Terms
    description:
    type: string
    sql: ${TABLE}.productname

  - dimension: productversionidref
    label: 'Product Version ID'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.productversionidref

  - dimension: providercd
    label: 'Producer Code'
    view_label: Policy Contacts
    description:
    type: string
    sql: ${TABLE}.providercd

  - dimension: reinsurancegroupid
    label: 'Reinsurance Group'
    view_label: Reinsurance Terms
    description:
    type: string
    sql: ${TABLE}.reinsurancegroupid

  - dimension: reinsurancegroupname
    label: 'Reinsurance Group Name'
    view_label: Reinsurance Terms
    description:
    type: string
    sql: ${TABLE}.reinsurancegroupname

  - dimension: reinsuranceitemname
    label: 'Reinsurance Item Name'
    view_label: Reinsurance Terms
    description:
    type: string
    sql: ${TABLE}.reinsuranceitemname

  - dimension: reinsurancename
    label: 'Reinsurance Name'
    view_label: Reinsurance Terms
    description:
    type: string
    sql: ${TABLE}.reinsurancename

  - dimension: reportperiod
    hidden: true
    label: 'Report Period'
    view_label:
    description:
    type: string
    sql: ${TABLE}.reportperiod

  - dimension: statecd
    label: 'State'
    view_label: Location
    description:
    type: string
    sql: ${TABLE}.statecd

  - dimension: statsequence
    hidden: true
    label:
    view_label:
    description:
    type: number
    sql: ${TABLE}.statsequence

  - dimension: statsequencereplace
    hidden: true
    label:
    view_label:
    description:
    type: number
    sql: ${TABLE}.statsequencereplace

  - dimension: statuscd
    label: 'Status'
    view_label: Policy Indicator
    description:
    type: string
    sql: ${TABLE}.statuscd

  - dimension: systemid
    hidden: true
    label:
    view_label:
    description:
    type: number
    value_format_name: id
    sql: ${TABLE}.systemid

  - dimension: transactioncd
    label: 'Transaction Code'
    view_label: Transaction Detail
    description:
    type: string
    sql: ${TABLE}.transactioncd

  - dimension: transactionnumber
    label: 'Transaction Number'
    view_label: Transaction Detail
    description:
    type: number
    sql: ${TABLE}.transactionnumber

  - dimension_group: updatedt
    hidden: 
    label: 'Report Period'
    view_label: Report Period
    description:
    type: time
    timeframes: [date, year, month]
    convert_tz: false
    sql: ${TABLE}.updatedt
    
  ###Measures - All Measures should have a lable  
    
  - measure: inforceamt
    view_label: 'Point in Time Measures'
    label: 'Ceded Inforce Amount'
    description:
    type: sum
    sql: ${TABLE}.inforceamt    
    
  - measure: lastinforceamt
    view_label: 'Point in Time Measures'
    label: 'Ceded Last Inforce Amount'
    description:
    type: sum
    sql: ${TABLE}.lastinforceamt    

  - measure: mtdearnedpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Earned Premium MTD'
    description:    
    type: sum
    sql: ${TABLE}.mtdearnedpremiumamt

  - measure: mtdwrittencommissionamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Written Commission MTD'
    description:    
    type: sum
    sql: ${TABLE}.mtdwrittencommissionamt

  - measure: mtdwrittenpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Written Premium MTD'
    description:    
    type: sum
    sql: ${TABLE}.mtdwrittenpremiumamt    

  - measure: ttdearnedpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Earned Premium TTD'
    description:   
    type: sum
    sql: ${TABLE}.ttdearnedpremiumamt

  - measure: ttdwrittencommissionamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Written Commission TTD'
    description:   
    type: sum
    sql: ${TABLE}.ttdwrittencommissionamt

  - measure: ttdwrittenpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Written Premium TTD'
    description:   
    type: sum
    sql: ${TABLE}.ttdwrittenpremiumamt
    
  - measure: unearnedamt
    view_label: 'Point To Date Measures'
    label: 'Ceded Unearned Premium'
    description:    
    type: sum
    sql: ${TABLE}.unearnedamt
    
  - measure: ytdearnedpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Earned Premium YTD'
    description:    
    type: sum
    sql: ${TABLE}.ytdearnedpremiumamt

  - measure: ytdwrittencommissionamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Written Commission YTD'
    description:   
    type: sum
    sql: ${TABLE}.ytdwrittencommissionamt

  - measure: ytdwrittenpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Written Premium YTD'
    description:   
    type: sum
    sql: ${TABLE}.ytdwrittenpremiumamt

  - measure: count
    label:
    view_label:
    description:
    type: count
    drill_fields: [id, reinsurancename, reinsuranceitemname, productname, reinsurancegroupname]

