- view: claim_level_summary_template
  derived_table:
    sql: |
      SELECT 
          css.reportperiod, 
          css.claimnumber,
          css.outstandingamt,
          css.mtdreservechangeamt,
          css.ytdreservechangeamt,
          css.outstandingexpectedrecoveryamt ,
          css.mtdexpectedrecoverychangeamt,
          css.ytdexpectedrecoverychangeamt ,
          css.itdpaidamt ,
          css.mtdpaidamt ,
          css.ytdpaidamt,
          css.itdpostedrecoveryamt,
          css.mtdpostedrecoveryamt,
          css.ytdpostedrecoveryamt,
          css.itdincurredamt,
          css.mtdincurredamt,
          css.ytdincurredamt,
          css.itdincurrednetrecoveryamt,
          css.mtdincurrednetrecoveryamt,
          css.ytdincurrednetrecoveryamt,
          coalesce(crss.cededoutstandingamt,0) As cededoutstandingamt,
          coalesce(crss.cededmtdreservechangeamt,0) As cededmtdreservechangeamt ,
          coalesce(crss.cededytdreservechangeamt,0) As cededytdreservechangeamt ,
          coalesce(crss.cededoutstandingexpectedrecoveryamt,0) As cededoutstandingexpectedrecoveryamt,
          coalesce(crss.cededmtdexpectedrecoverychangeamt,0) As cededmtdexpectedrecoverychangeamt ,
          coalesce(crss.cededytdexpectedrecoverychangeamt,0) As cededytdexpectedrecoverychangeamt,
          coalesce(crss.cededitdpaidamt,0) As cededitdpaidamt,
          coalesce(crss.cededmtdpaidamt,0) As cededmtdpaidamt ,
          coalesce(crss.cededytdpaidamt,0) As cededytdpaidamt,
          coalesce(crss.cededitdpostedrecoveryamt,0) As cededitdpostedrecoveryamt,
          coalesce(crss.cededmtdpostedrecoveryamt,0) As cededmtdpostedrecoveryamt,
          coalesce(crss.cededytdpostedrecoveryamt,0) As cededytdpostedrecoveryamt,
          coalesce(crss.cededitdincurredamt,0) As cededitdincurredamt,
          coalesce(crss.cededmtdincurredamt,0) As cededmtdincurredamt ,
          coalesce(crss.cededytdincurredamt,0) As cededytdincurredamt,
          coalesce(crss.cededitdincurrednetrecoveryamt,0) As cededitdincurrednetrecoveryamt,
          coalesce(crss.cededmtdincurrednetrecoveryamt,0) As cededmtdincurrednetrecoveryamt,
          coalesce(crss.cededytdincurrednetrecoveryamt,0) As cededytdincurrednetrecoveryamt,
          css.outstandingamt - coalesce(crss.cededoutstandingamt,0) As netoutstandingamt,
          css.mtdreservechangeamt - coalesce(crss.cededmtdreservechangeamt,0) AS netmtdreservechangeamt,
          css.ytdreservechangeamt - coalesce(crss.cededytdreservechangeamt,0) AS netytdreservechangeamt,
      --  css.outstandingexpectedrecoveryamt  - coalesce(crss.cededoutstandingexpectedrecoveryamt,0) AS netoutstandingexpectedrecoveryamt ,
      --  css.mtdexpectedrecoverychangeamt - coalesce(crss.cededmtdexpectedrecoverychangeamt,0) AS netmtdexpectedrecoverychangeamt,
      --  css.ytdexpectedrecoverychangeamt  - coalesce(crss.cededytdexpectedrecoverychangeamt,0) AS netytdexpectedrecoverychangeamt ,
          css.itdpaidamt  - coalesce(crss.cededitdpaidamt,0) AS netitdpaidamt ,
          css.mtdpaidamt  - coalesce(crss.cededmtdpaidamt,0) AS netmtdpaidamt ,
          css.ytdpaidamt - coalesce(crss.cededytdpaidamt,0) AS netytdpaidamt, 
      --  css.itdpostedrecoveryamt - coalesce(crss.cededitdpostedrecoveryamt,0) AS netitdpostedrecoveryamt,
      --  css.mtdpostedrecoveryamt - coalesce(crss.cededmtdpostedrecoveryamt,0) AS netmtdpostedrecoveryamt,
      --  css.ytdpostedrecoveryamt - coalesce(crss.cededytdpostedrecoveryamt,0) AS netytdpostedrecoveryamt,
          css.itdincurredamt  - coalesce(crss.cededitdincurredamt,0) AS netitdincurredamt ,
          css.mtdincurredamt  - coalesce(crss.cededmtdincurredamt,0) AS netmtdincurredamt ,
          css.ytdincurredamt - coalesce(crss.cededytdincurredamt,0) AS netytdincurredamt,
      --    css.itdincurrednetrecoveryamt - coalesce(crss.cededitdincurrednetrecoveryamt,0) AS netitdincurrednetrecoveryamt,
      --  css.mtdincurrednetrecoveryamt - coalesce(crss.cededmtdincurrednetrecoveryamt,0) AS netmtdincurrednetrecoveryamt,
      --  css.ytdincurrednetrecoveryamt - coalesce(crss.cededytdincurrednetrecoveryamt,0) AS netytdincurrednetrecoveryamt ,
          css.outstandingamt - coalesce(crss.cededoutstandingamt,0) + css.itdpaidamt  - coalesce(crss.cededitdpaidamt,0) - css.itdpostedrecoveryamt AS netitdincurrednetrecoveryamt,
          css.ytdreservechangeamt - coalesce(crss.cededytdreservechangeamt,0) + css.ytdpaidamt  - coalesce(crss.cededytdpaidamt,0) - css.ytdpostedrecoveryamt AS netytdincurrednetrecoveryamt,
          css.mtdreservechangeamt - coalesce(crss.cededmtdreservechangeamt,0) + css.mtdpaidamt  - coalesce(crss.cededmtdpaidamt,0) - css.mtdpostedrecoveryamt AS netmtdincurrednetrecoveryamt,
      -- Can't include Recovery measures because reservecd different in tables
          css2.updatedt, 
          css2.policyref, 
          css2.policynumber, 
          css2.policyversion, 
          css2.policyyear, 
          css2.producerprovidercd, 
          css2.statecd, 
          css2.claimref, 
          css2.carriercd, 
          css2.carriergroupcd, 
          css2.lossyear, 
          css2.lossdt, 
          css2.reportdt, 
          css2.losscausecd, 
          css2.productname, 
          css2.customerref, 
          css2.catastropheref, 
          css2.catastrophenumber 
      FROM 
      (Select 
          reportperiod,claimnumber,  
          sum(outstandingamt) AS outstandingamt,
          sum(mtdreservechangeamt) AS mtdreservechangeamt,
          sum(ytdreservechangeamt) AS ytdreservechangeamt,
          sum(outstandingexpectedrecoveryamt ) AS outstandingexpectedrecoveryamt ,
          sum(mtdexpectedrecoverychangeamt) AS mtdexpectedrecoverychangeamt,
          sum(ytdexpectedrecoverychangeamt ) AS ytdexpectedrecoverychangeamt ,
          sum(itdpaidamt ) AS itdpaidamt ,
          sum(mtdpaidamt ) AS mtdpaidamt ,
          sum(ytdpaidamt) AS ytdpaidamt,
          sum(itdpostedrecoveryamt) AS itdpostedrecoveryamt,
          sum(mtdpostedrecoveryamt) AS mtdpostedrecoveryamt,
          sum(ytdpostedrecoveryamt) AS ytdpostedrecoveryamt,
          sum(itdincurredamt) AS itdincurredamt,
          sum(mtdincurredamt) AS mtdincurredamt,
          sum(ytdincurredamt) AS ytdincurredamt,
          sum(itdincurrednetrecoveryamt) AS itdincurrednetrecoveryamt,
          sum(mtdincurrednetrecoveryamt) AS mtdincurrednetrecoveryamt,
          sum(ytdincurrednetrecoveryamt) AS ytdincurrednetrecoveryamt
      From dw.claimsummarystats
      Group By reportperiod, claimnumber  
      Order By reportperiod, claimnumber  
      ) css
      left join
      (Select 
          reportperiod, claimnumber,-- reservecd,
          sum(outstandingamt) AS cededoutstandingamt,
          sum(mtdreservechangeamt) AS cededmtdreservechangeamt,
          sum(ytdreservechangeamt) AS cededytdreservechangeamt,
          sum(outstandingexpectedrecoveryamt ) AS cededoutstandingexpectedrecoveryamt ,
          sum(mtdexpectedrecoverychangeamt) AS cededmtdexpectedrecoverychangeamt,
          sum(ytdexpectedrecoverychangeamt ) AS cededytdexpectedrecoverychangeamt ,
          sum(itdpaidamt ) AS cededitdpaidamt ,
          sum(mtdpaidamt ) AS cededmtdpaidamt ,
          sum(ytdpaidamt) AS cededytdpaidamt,
          sum(itdpostedrecoveryamt) AS cededitdpostedrecoveryamt,
          sum(mtdpostedrecoveryamt) AS cededmtdpostedrecoveryamt,
          sum(ytdpostedrecoveryamt) AS cededytdpostedrecoveryamt,
          sum(itdincurredamt) AS cededitdincurredamt,
          sum(mtdincurredamt) AS cededmtdincurredamt,
          sum(ytdincurredamt) AS cededytdincurredamt,
          sum(itdincurrednetrecoveryamt) AS cededitdincurrednetrecoveryamt,
          sum(mtdincurrednetrecoveryamt) AS cededmtdincurrednetrecoveryamt,
          sum(ytdincurrednetrecoveryamt) AS cededytdincurrednetrecoveryamt
      From dw.claimreinsurancesummarystats
      Group By reportperiod, claimnumber  
      Order By reportperiod, claimnumber  
      ) crss
      On css.reportperiod = crss.reportperiod and
      css.claimnumber = crss.claimnumber -- Can't join on reservecd because values different
      Left Join
      (
      Select distinct
          reportperiod, claimnumber, updatedt, policyref, policynumber, policyversion, policyyear, producerprovidercd, statecd, claimref, 
          carriercd, carriergroupcd, lossyear, lossdt, reportdt, losscausecd, productname, customerref, catastropheref, catastrophenumber 
      From dw.claimsummarystats
      ) css2
      On css.reportperiod = css2.reportperiod and
      css.claimnumber = css2.claimnumber
 
  fields:
  
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
    type: string
    sql: ${TABLE}.claimref

  - dimension: customerref
    view_label: Policy Contacts
    label: 'Customer Reference'
    description:
    type: string
    sql: ${TABLE}.customerref

  - dimension: losscausecd
    view_label: Claim Details
    label: 'Loss Cause'
    description:
    type: string
    sql: ${TABLE}.losscausecd

  - dimension: lossdt
    view_label: Claim Dates
    label: 'Loss Date'
    description:
    type: date
    sql: ${TABLE}.lossdt

  - dimension: lossyear
    view_label: Claim Dates
    label: 'Loss Year'
    description:
    type: string
    sql: ${TABLE}.lossyear    
  
  - dimension: policynumber
    view_label: Policy Coverage Terms
    label: 'Policy Number'
    description:
    type: string
    sql: ${TABLE}.policynumber

  - dimension: policyref
    view_label: Policy Coverage Terms
    label: 'Policy Ref'
    description:
    type: string
    sql: ${TABLE}.policyref

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
  
  - dimension: producerprovidercd
    view_label: Policy Contacts
    label: 'Producer Code'
    description:
    type: string
    sql: ${TABLE}.producerprovidercd

  - dimension: productname
    view_label: Policy Classification
    label: 'Product Name'
    description:
    type: string
    sql: ${TABLE}.productname

  - dimension: statecd
    view_label: Location
    label: 'State Code'
    description:
    type: string
    sql: ${TABLE}.statecd

  - dimension: reportdt
    hidden: true
    view_label: Claim Dates
    label: 'Report Date'
    description:
    type: date
    sql: ${TABLE}.reportdt

  - dimension: reportperiod
    hidden: true
    view_label: Report Period Dates
    label: 'Report Period'
    description:
    type: string
    sql: ${TABLE}.reportperiod
    
  - dimension_group: report_period
    label: "Report Period"
    view_label: Report Period
    type: time
    convert_tz: false
    timeframes: [month, year]
    sql: ${TABLE}.updatedt   
  
  - dimension: updatedt
    view_label: Report Period
    label: 'Update'
    description:
    type: date
    sql: ${TABLE}.updatedt  
    
  ############################
  #####   MEASURES   #########
  ############################
  
  - measure: count
    view_label: Counts
    label: 
    description:
    type: count
    drill_fields: detail*
    
  - measure: cededitdincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss ITD'
    description: 'Ceded Incurred Loss since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededitdincurredamt

  - measure: cededitdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery ITD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededitdincurrednetrecoveryamt

  - measure: cededitdpaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Paid Loss ITD'
    description: 'Ceded Paid Loss from inception of claim'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededitdpaidamt

  - measure: cededitdpostedrecoveryamt
    view_label: Inception To Date Measures
    label: 'Posted Reinsurance Recovery ITD'
    description: 'Reinsurance Recovery received from inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededitdpostedrecoveryamt

  - measure: cededmtdexpectedrecoverychangeamt
    hidden: true  
    view_label: Month to Date Measures
    label: 'Expected Reinsurance Recovery MTD'
    description: 'The expected reinsurance recovery change in month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdexpectedrecoverychangeamt

  - measure: cededmtdincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss MTD'
    description: 'Ceded Incurred Loss during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdincurredamt

  - measure: cededmtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery MTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdincurrednetrecoveryamt
    
  - measure: cededmtdpaidamt
    view_label: Month to Date Measures
    label: 'Ceded Paid Loss MTD'
    description: 'Ceded Paid Loss during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdpaidamt

  - measure: cededmtdpostedrecoveryamt
    view_label: Month to Date Measures
    label:  'Posted Reinsurance Recovery MTD'
    description: 'Reinsurance Recovery received during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdpostedrecoveryamt

  - measure: cededmtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Reserve Change MTD'
    description: 'The ceded reserve change during the month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededmtdreservechangeamt

  - measure: cededoutstandingamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Reserve'
    description: 'The ceded reserve total at the end of the period'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededoutstandingamt

  - measure: cededoutstandingexpectedrecoveryamt
    hidden: true
    view_label: Point In Time Measures
    label: 'Outstanding Expected Reinsurance Recovery'
    description: 'The outstanding expected reinsurance recovery not recieved'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededoutstandingexpectedrecoveryamt

  - measure: cededytdexpectedrecoverychangeamt
    hidden: true
    view_label: Year To Date Measures
    label: 'Expected Reinsurance Recovery YTD'
    description: 'The ceded expected reinsurance recovery change in year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdexpectedrecoverychangeamt

  - measure: cededytdincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss YTD'
    description: 'Ceded Incurred Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdincurredamt

  - measure: cededytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery YTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdincurrednetrecoveryamt

  - measure: cededytdpaidamt
    view_label: Year To Date Measures
    label: 'Ceded Paid Loss YTD'
    description: 'Ceded Paid Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdpaidamt

  - measure: cededytdpostedrecoveryamt
    view_label: Year To Date Measures
    label: 'Posted Reinsurance Recovery YTD'
    description: 'Reinsurance Recovery received during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.cededytdpostedrecoveryamt

  - measure: cededytdreservechangeamt
    label: 'Ceded Reserve Change YTD'
    description: 'The ceded reserve change during the year'  
    type: sum
    value_format: "#,##0.00"
    view_label: Year To Date Measures
    sql: ${TABLE}.cededytdreservechangeamt

  - measure: itdincurredamt
    view_label: Inception To Date Measures
    label: 'Incurred Loss ITD'
    description: 'Incurred Loss since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.itdincurredamt

  - measure: itdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Incurred Loss Net Recovery ITD'
    description: 'Incurred Loss Net Recovery since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.itdincurrednetrecoveryamt

  - measure: itdpaidamt
    view_label: Inception To Date Measures
    label: 'Paid Loss ITD'
    description: 'Paid Loss from inception of claim'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.itdpaidamt

  - measure: itdpostedrecoveryamt
    view_label: Inception To Date Measures
    label: 'Recovery Posted ITD'
    description: 'Recovery received from inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.itdpostedrecoveryamt

  - measure: mtdexpectedrecoverychangeamt
    view_label: Month to Date Measures
    label: 'Expected Recovery Change MTD'
    description: 'The expected recovery change in month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdexpectedrecoverychangeamt

  - measure: mtdincurredamt
    view_label: Month to Date Measures
    label: 'Incurred Loss MTD'
    description: 'Incurred Loss during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdincurredamt

  - measure: mtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Incurred Loss Net Recovery MTD'
    description: 'Incurred Loss Net Recovery during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdincurrednetrecoveryamt

  - measure: mtdpaidamt
    view_label: Month to Date Measures
    label: 'Paid Loss MTD'
    description: 'Paid Loss during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdpaidamt

  - measure: mtdpostedrecoveryamt
    view_label: Month to Date Measures
    label: 'Recovery Posted MTD'
    description: 'Recovery received during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdpostedrecoveryamt

  - measure: mtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Reserve Change MTD'
    description: 'The reserve change during the month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.mtdreservechangeamt

  - measure: netitdincurredamt
    view_label: Inception To Date Measures
    label: 'Net Incurred Loss ITD'
    description: 'Incurred Loss since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netitdincurredamt

  - measure: netitdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Net Incurred Loss Net Recovery ITD'
    description: 'Incurred Loss Net Recovery since inception'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netitdincurrednetrecoveryamt
 
  - measure: netitdpaidamt
    view_label: Inception To Date Measures
    label: 'Net Paid Loss ITD'
    description: 'Net Paid Loss from inception of claim'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netitdpaidamt

  - measure: netmtdincurredamt
    view_label: Month to Date Measures
    label: 'Net Incurred Loss MTD'
    description: 'Net Incurred Loss Net Recovery during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdincurredamt

  - measure: netmtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Net Incurred Loss Net Recovery MTD'
    description: 'Net Incurred Loss Net Recovery during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdincurrednetrecoveryamt    

  - measure: netmtdpaidamt
    view_label: Month to Date Measures
    label: 'Net Paid Loss MTD'
    description: 'Net Paid Loss during month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdpaidamt

  - measure: netmtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Net Reserve Change MTD'
    description: 'The net reserve change during the month'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netmtdreservechangeamt

  - measure: netoutstandingamt
    view_label: Point In Time Measures
    label: 'Net Outstanding Reserve'
    description: 'The net reserve total at the end of the period'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netoutstandingamt

  - measure: netytdincurredamt
    view_label: Year To Date Measures
    label: 'Net Incurred Loss YTD'
    description: 'Net Incurred Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdincurredamt

  - measure: netytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Net Incurred Loss Net Recovery YTD'
    description: 'Net Incurred Loss Net Recovery during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdincurrednetrecoveryamt

  - measure: netytdpaidamt
    view_label: Year To Date Measures
    label: 'Net Paid Loss YTD'
    description: 'Net Paid Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdpaidamt
    
  - measure: netytdreservechangeamt
    view_label: Year To Date Measures
    label: 'Net Reserve Change YTD'
    description: 'The net reserve change during the year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.netytdreservechangeamt
 
  - measure: outstandingamt
    view_label: Point In Time Measures
    label: 'Outstanding Reserve'
    description: 'The reserve total at the end of the period'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.outstandingamt

  - measure: outstandingexpectedrecoveryamt
    view_label: Point In Time Measures
    label: 'Outstanding Expected Recovery'
    description: 'The outstanding expected recovery not recieved'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.outstandingexpectedrecoveryamt

  - measure: prioryearendcededoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Ceded Outstanding Reserve'
    description: 'The ceded reserve total at the end of the previous year'
    type: number
    sql: (${claim_level_summary.cededoutstandingamt}-${claim_level_summary.cededytdreservechangeamt})

  - measure: prioryearendnetoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Net Outstanding Reserve'
    description: 'The net reserve total at the end of the previous year'
    type: number
    sql: (${claim_level_summary.netoutstandingamt}-${claim_level_summary.netytdreservechangeamt})    
    
  - measure: prioryearendoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Outstanding Reserve'
    description: 'The reserve total at the end of the previous period'
    type: number
    sql: (${claim_level_summary.outstandingamt}-${claim_level_summary.ytdreservechangeamt})

  - measure: ytdexpectedrecoverychangeamt
    view_label: Year To Date Measures
    label: 'Expected Recovery Change YTD'
    description: 'The expected recovery change in year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdexpectedrecoverychangeamt

  - measure: ytdincurredamt
    view_label: Year To Date Measures
    label: 'Incurred Loss YTD'
    description: 'Incurred Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdincurredamt

  - measure: ytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Incurred Loss Net Recovery YTD'
    description: 'Incurred Loss Net Recovery during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdincurrednetrecoveryamt

  - measure: ytdpaidamt
    view_label: Year To Date Measures
    label: 'Paid Loss YTD'
    description: 'Paid Loss during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdpaidamt

  - measure: ytdpostedrecoveryamt
    view_label: Year To Date Measures
    label: 'Recovery Posted YTD'
    description: 'Recovery received during year'
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdpostedrecoveryamt

  - measure: ytdreservechangeamt
    view_label: Year To Date Measures
    label: 'Reserve Change YTD'
    description: 'The reserve change during the year'  
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.ytdreservechangeamt
 
  sets:
    detail:
      - reportperiod
      - claimsum
      - outstandingamt
      - mtdreservechangeamt
      - ytdreservechangeamt
      - outstandingexpectedrecoveryamt
      - mtdexpectedrecoverychangeamt
      - ytdexpectedrecoverychangeamt
      - itdpaidamt
      - mtdpaidamt
      - ytdpaidamt
      - itdpostedrecoveryamt
      - mtdpostedrecoveryamt
      - ytdpostedrecoveryamt
      - itdincurredamt
      - mtdincurredamt
      - ytdincurredamt
      - itdincurrednetrecoveryamt
      - mtdincurrednetrecoveryamt
      - ytdincurrednetrecoveryamt
      - cededoutstandingamt
      - cededmtdreservechangeamt
      - cededytdreservechangeamt
      - cededoutstandingexpectedrecoveryamt
      - cededmtdexpectedrecoverychangeamt
      - cededytdexpectedrecoverychangeamt
      - cededitdpaidamt
      - cededmtdpaidamt
      - cededytdpaidamt
      - cededitdpostedrecoveryamt
      - cededmtdpostedrecoveryamt
      - cededytdpostedrecoveryamt
      - cededitdincurredamt
      - cededmtdincurredamt
      - cededytdincurredamt
      - cededitdincurrednetrecoveryamt
      - cededmtdincurrednetrecoveryamt
      - cededytdincurrednetrecoveryamt
      - netoutstandingamt
      - netmtdreservechangeamt
      - netytdreservechangeamt
      - netitdpaidamt
      - netmtdpaidamt
      - netytdpaidamt
      - netitdincurredamt