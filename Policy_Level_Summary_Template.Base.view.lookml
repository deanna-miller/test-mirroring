- view: policy_level_summary_template
  derived_table:
    sql: |
      Select
             pss2.*,
             pss.unearnedamt,
             pss.inforceamt,
             pss.lastinforceamt,
             pss.mtdwrittenpremiumamt,
             pss.mtdwrittencommissionamt,
             pss.mtdearnedpremiumamt,
             pss.ytdwrittenpremiumamt,
             pss.ytdwrittencommissionamt,
             pss.ytdearnedpremiumamt,
             pss.ttdwrittenpremiumamt,
             pss.ttdwrittencommissionamt,
             pss.ttdearnedpremiumamt,
             coalesce(prss.cededunearnedamt,0) As cededunearnedamt,
             coalesce(prss.cededinforceamt,0) As cededinforceamt,
             coalesce(prss.cededlastinforceamt,0) As cededlastinforceamt,
             coalesce(prss.cededmtdwrittenpremiumamt,0) As cededmtdwrittenpremiumamt,
             coalesce(prss.cededmtdwrittencommissionamt,0) cededmtdwrittencommissionamt,
             coalesce(prss.cededmtdearnedpremiumamt,0) As cededmtdearnedpremiumamt,
             coalesce(prss.cededytdwrittenpremiumamt,0) As cededytdwrittenpremiumamt,
             coalesce(prss.cededytdwrittencommissionamt,0) As cededytdwrittencommissionamt,
             coalesce(prss.cededytdearnedpremiumamt,0) As cededytdearnedpremiumamt,
             coalesce(prss.cededttdwrittenpremiumamt,0) As cededttdwrittenpremiumamt,
             coalesce(prss.cededttdwrittencommissionamt,0) As cededttdwrittencommissionamt,
             coalesce(prss.cededttdearnedpremiumamt,0) As cededttdearnedpremiumamt,
             pss.unearnedamt - coalesce(prss.cededunearnedamt,0) as netunearnedamt,
             pss.inforceamt -  coalesce(prss.cededinforceamt,0) as netinforceamt,
             pss.lastinforceamt - coalesce(prss.cededlastinforceamt,0) as netlastinforceamt,
             pss.mtdwrittenpremiumamt - coalesce(prss.cededmtdwrittenpremiumamt,0) as netmtdwrittenpremiumamt,
             pss.mtdwrittencommissionamt - coalesce(prss.cededmtdwrittencommissionamt,0) as netmtdwrittencommissionamt,
             pss.mtdearnedpremiumamt - coalesce(prss.cededmtdearnedpremiumamt,0) as netmtdearnedpremiumamt,
             pss.ytdwrittenpremiumamt - coalesce(prss.cededytdwrittenpremiumamt,0) as netytdwrittenpremiumamt,
             pss.ytdwrittencommissionamt - coalesce(prss.cededytdwrittencommissionamt,0) as netytdwrittencommissionamt ,
             pss.ytdearnedpremiumamt - coalesce(prss.cededytdearnedpremiumamt,0) as netytdearnedpremiumamt,
             pss.ttdwrittenpremiumamt - coalesce(prss.cededttdwrittenpremiumamt,0) as netttdwrittenpremiumamt,
             pss.ttdwrittencommissionamt - coalesce(prss.cededttdwrittencommissionamt,0) as netttdwrittencommissionamt ,
             pss.ttdearnedpremiumamt - coalesce(prss.cededttdearnedpremiumamt,0) as netttdearnedpremiumamt
      From
      (
      SELECT reportperiod, policyref, 
             sum(unearnedamt) as unearnedamt,
             sum(inforceamt) as inforceamt,
             sum(lastinforceamt) as lastinforceamt,
             Sum(mtdwrittenpremiumamt) as mtdwrittenpremiumamt,
             sum(mtdwrittencommissionamt) as mtdwrittencommissionamt,
             sum(mtdearnedpremiumamt) as mtdearnedpremiumamt,
             Sum(ytdwrittenpremiumamt) as ytdwrittenpremiumamt,
             sum(ytdwrittencommissionamt) as ytdwrittencommissionamt,
             sum(ytdearnedpremiumamt) as ytdearnedpremiumamt,
             Sum(ttdwrittenpremiumamt) as ttdwrittenpremiumamt,
             sum(ttdwrittencommissionamt) as ttdwrittencommissionamt,
             sum(ttdearnedpremiumamt) as ttdearnedpremiumamt
      FROM dw.policysummarystats
      Group By reportperiod, policyref
      Order By reportperiod, policyref
      ) pss
      Left Join
      (
      SELECT reportperiod, policyref, 
             sum(unearnedamt) as cededunearnedamt,
             sum(inforceamt) as cededinforceamt,
             sum(lastinforceamt) as cededlastinforceamt,
             Sum(mtdwrittenpremiumamt) as cededmtdwrittenpremiumamt,
             sum(mtdwrittencommissionamt) as cededmtdwrittencommissionamt,
             sum(mtdearnedpremiumamt) as cededmtdearnedpremiumamt,
             Sum(ytdwrittenpremiumamt) as cededytdwrittenpremiumamt,
             sum(ytdwrittencommissionamt) as cededytdwrittencommissionamt,
             sum(ytdearnedpremiumamt) as cededytdearnedpremiumamt,
             Sum(ttdwrittenpremiumamt) as cededttdwrittenpremiumamt,
             sum(ttdwrittencommissionamt) as cededttdwrittencommissionamt,
             sum(ttdearnedpremiumamt) as cededttdearnedpremiumamt
      FROM dw.policyreinsurancesummarystats
      Group By reportperiod, policyref
      Order By reportperiod, policyref
      ) prss
      On pss.reportperiod = prss.reportperiod and pss.policyref = prss.policyref
      Left Join
      (SELECT distinct reportperiod, updatedt, policyref, policynumber, policyversion, effectivedt, expirationdt,
             policyyear, newrenewalcd, producercd, statecd, productversionidref, carriergroupcd, 
             carriercd, customerref
        FROM dw.policysummarystats
      ) pss2
      On pss.reportperiod = pss2.reportperiod and pss.policyref = pss2.policyref

  fields:
  
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
    
  - dimension: newrenewalcd
    label: 'New or Renewal'
    view_label: Policy Indicator
    description:
    type: string
    sql: ${TABLE}.newrenewalcd
    
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
    
  - dimension: productversionidref
    label: 'Product Version ID'
    view_label: Policy Classification
    description:
    type: string
    sql: ${TABLE}.productversionidref

  - dimension: producercd
    label: 'Producer Code'
    view_label: Policy Contacts
    description:
    type: string
    sql: ${TABLE}.producercd
    
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

  - dimension_group: updatedt
    hidden: 
    label: 'Report Period'
    view_label: Report Period
    description:
    type: time
    timeframes: [date, year, month]
    convert_tz: false
    sql: ${TABLE}.updatedt
    

  ####Measures - All Measures should have a label  
  
  - measure: cededinforceamt
    view_label: 'Point in Time Measures'
    label: 'Ceded Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededinforceamt    
    
  - measure: cededlastinforceamt
    view_label: 'Point in Time Measures'
    label: 'Ceded Last Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededlastinforceamt 
    
  - measure: cededmtdearnedpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Earned Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdearnedpremiumamt

  - measure: cededmtdwrittencommissionamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Written Commission MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdwrittencommissionamt

  - measure: cededmtdwrittenpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Ceded Written Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdwrittenpremiumamt

  - measure: cededunearnedamt
    view_label: 'Point To Date Measures'
    label: 'Ceded Unearned Premium'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededunearnedamt
    
  - measure: cededttdearnedpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Earned Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededttdearnedpremiumamt

  - measure: cededttdwrittencommissionamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Written Commission TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededttdwrittencommissionamt

  - measure: cededttdwrittenpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Ceded Written Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededttdwrittenpremiumamt

  - measure: cededytdearnedpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Earned Premium YTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdearnedpremiumamt

  - measure: cededytdwrittencommissionamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Written Commission YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdwrittencommissionamt

  - measure: cededytdwrittenpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Ceded Written Premium YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdwrittenpremiumamt

  - measure: inforceamt
    view_label: 'Point in Time Measures'
    label: 'Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.inforceamt    
    
  - measure: lastinforceamt
    view_label: 'Point in Time Measures'
    label: 'Last Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.lastinforceamt    

  - measure: mtdearnedpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Earned Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdearnedpremiumamt

  - measure: mtdwrittencommissionamt
    view_label: 'Month To Date Measures'
    label: 'Written Commission MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdwrittencommissionamt

  - measure: mtdwrittenpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Written Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdwrittenpremiumamt 
    
  - measure: netinforceamt
    view_label: 'Point in Time Measures'
    label: 'Net Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netinforceamt    
    
  - measure: netlastinforceamt
    view_label: 'Point in Time Measures'
    label: 'Net Last Inforce Amount'
    description:
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netlastinforceamt    

  - measure: netunearnedamt
    view_label: 'Point To Date Measures'
    label: 'Net Unearned Premium'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netunearnedamt

  - measure: netmtdearnedpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Net Earned Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdearnedpremiumamt

  - measure: netmtdwrittencommissionamt
    view_label: 'Month To Date Measures'
    label: 'Net Written Commission MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdwrittencommissionamt

  - measure: netmtdwrittenpremiumamt
    view_label: 'Month To Date Measures'
    label: 'Net Written Premium MTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdwrittenpremiumamt    

  - measure: netytdearnedpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Net Earned Premium YTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdearnedpremiumamt

  - measure: netytdwrittencommissionamt
    view_label: 'Year To Date Measures'
    label: 'Net Written Commission YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdwrittencommissionamt

  - measure: netytdwrittenpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Net Written Premium YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdwrittenpremiumamt

  - measure: netttdearnedpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Net Earned Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netttdearnedpremiumamt

  - measure: netttdwrittencommissionamt
    view_label: 'Term To Date Measures'
    label: 'Net Written Commission TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netttdwrittencommissionamt

  - measure: netttdwrittenpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Net Written Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netttdwrittenpremiumamt
    
  - measure: ttdearnedpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Earned Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ttdearnedpremiumamt

  - measure: ttdwrittencommissionamt
    view_label: 'Term To Date Measures'
    label: 'Written Commission TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ttdwrittencommissionamt

  - measure: ttdwrittenpremiumamt
    view_label: 'Term To Date Measures'
    label: 'Written Premium TTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ttdwrittenpremiumamt
    
  - measure: unearnedamt
    view_label: 'Point To Date Measures'
    label: 'Unearned Premium'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.unearnedamt

  - measure: ytdearnedpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Earned Premium YTD'
    description:    
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdearnedpremiumamt

  - measure: ytdwrittencommissionamt
    view_label: 'Year To Date Measures'
    label: 'Written Commission YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdwrittencommissionamt

  - measure: ytdwrittenpremiumamt
    view_label: 'Year To Date Measures'
    label: 'Written Premium YTD'
    description:   
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdwrittenpremiumamt

  - measure: count
    type: count
    drill_fields: detail*

  sets:
    detail:
      - reportperiod
      - updatedt
      - policyref
      - policynumber
      - policyversion
      - effectivedt
      - expirationdt
      - policyyear
      - newrenewalcd
      - annualstatementlinecd
      - providercd
      - statecd
      - productversionidref
      - carriergroupcd
      - carriercd
      - productname
      - policytypecd
      - policygroupcd
      - customerref
      - unearnedamt
      - inforceamt
      - lastinforceamt
      - mtdwrittenpremiumamt
      - mtdwrittencommissionamt
      - mtdearnedpremiumamt
      - ytdwrittenpremiumamt
      - ytdwrittencommissionamt
      - ytdearnedpremiumamt
      - ttdwrittenpremiumamt
      - ttdwrittencommissionamt
      - ttdearnedpremiumamt
      - cededunearnedamt
      - cededinforceamt
      - cededlastinforceamt
      - cededmtdwrittenpremiumamt
      - cededmtdwrittencommissionamt
      - cededmtdearnedpremiumamt
      - cededytdwrittenpremiumamt
      - cededytdwrittencommissionamt
      - cededytdearnedpremiumamt
      - cededttdwrittenpremiumamt
      - cededttdwrittencommissionamt
      - cededttdearnedpremiumamt
      - netunearnedamt
      - netinforceamt
      - netlastinforceamt
      - netmtdwrittenpremiumamt
      - netmtdwrittencommissionamt
      - netmtdearnedpremiumamt
      - netytdwrittenpremiumamt
      - netytdwrittencommissionamt
      - netytdearnedpremiumamt
      - netttdwrittenpremiumamt
      - netttdwrittencommissionamt
      - netttdearnedpremiumamt


