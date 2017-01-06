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
  
  - measure: count
    view_label: Counts
    label: 
    description:
    type: count
    drill_fields: detail*

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

  - dimension: claimnumber
    view_label: Claim Details
    label: 'Claim Number'
    description:
    type: string
    sql: ${TABLE}.claimnumber

  - dimension: updatedt
    view_label: Report Period
    label: 'Update'
    description:
    type: date
    sql: ${TABLE}.updatedt    
    
  - dimension: lossdt
    view_label: Claim Dates
    label: 'Loss Date'
    description:
    type: date
    sql: ${TABLE}.lossdt
    
  - dimension: reportdt
    hidden: true
    view_label: Claim Dates
    label: 'Report Date'
    description:
    type: date
    sql: ${TABLE}.reportdt
    
  - dimension: policyyear
    view_label: Policy Coverage Terms
    label: 'Policy Year'
    description:
    type: date
    sql: ${TABLE}.policyyear
    
  - dimension: lossyear
    view_label: Claim Dates
    label: 'Loss Year'
    description:
    type: date
    sql: ${TABLE}.lossyear    
    
  - dimension: policyref
    view_label: Policy Coverage Terms
    label: 'Policy Ref'
    description:
    type: string
    sql: ${TABLE}.policyref
    
  - dimension: policynumber
    view_label: Policy Coverage Terms
    label: 'Policy Number'
    description:
    type: string
    sql: ${TABLE}.policynumber
    
  - dimension: policyversion
    view_label: Policy Coverage Terms
    label: 'Policy Version'
    description:
    type: string
    sql: ${TABLE}.policyversion
    
  - dimension: producerprovidercd
    view_label: Policy Contacts
    label: 'Producer Code'
    description:
    type: string
    sql: ${TABLE}.producerprovidercd
    
  - dimension: statecd
    view_label: Location
    label: 'State Code'
    description:
    type: string
    sql: ${TABLE}.statecd
    
  - dimension: claimref
    view_label: Claim Details
    label: 'Claim Ref'
    description:
    type: string
    sql: ${TABLE}.claimref
    
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
    
  - dimension: losscausecd
    view_label: Claim Details
    label: 'Loss Cause'
    description:
    type: string
    sql: ${TABLE}.losscausecd
    
  - dimension: productname
    view_label: Policy Classification
    label: 'Product Name'
    description:
    type: string
    sql: ${TABLE}.productname
    
  - dimension: customerref
    view_label: Policy Contacts
    label: 'Customer Reference'
    description:
    type: string
    sql: ${TABLE}.customerref
    
  - dimension: catastropheref
    view_label: Claim Details
    label: 'Catastrophe Reference'
    description:
    type: string
    sql: ${TABLE}.catastropheref
    
  - dimension: catastrophenumber
    view_label: Claim Details
    label: 'Catastrophe Number'
    description:
    type: string
    sql: ${TABLE}.catastrophenumber
    
  - measure: outstandingamt
    view_label: Point In Time Measures
    label: 'Outstanding Reserve'
    description: 'The reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.outstandingamt
    
  - measure: prioryearendoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Outstanding Reserve'
    description: 'The reserve total at the end of the previous period'
    type: number
    sql: (${claim_level_summary.outstandingamt}-${claim_level_summary.ytdreservechangeamt})

  - measure: mtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Resereve Change MTD'
    description: 'The reserve change during the month'
    type: sum
    sql: ${TABLE}.mtdreservechangeamt

  - measure: ytdreservechangeamt
    view_label: Year To Date Measures
    label: 'Resereve Change YTD'
    description: 'The reserve change during the year'  
    type: sum
    sql: ${TABLE}.ytdreservechangeamt

  - measure: outstandingexpectedrecoveryamt
    view_label: Point In Time Measures
    label: 'Outstanding Expected Recovery'
    description: 'The outstanding expected recovery not recieved'
    type: sum
    sql: ${TABLE}.outstandingexpectedrecoveryamt

  - measure: mtdexpectedrecoverychangeamt
    view_label: Month to Date Measures
    label: 'Expected Recovery Change MTD'
    description: 'The expected recovery change in month'
    type: sum
    sql: ${TABLE}.mtdexpectedrecoverychangeamt

  - measure: ytdexpectedrecoverychangeamt
    view_label: Year To Date Measures
    label: 'Expected Recovery Change YTD'
    description: 'The expected recovery change in year'
    type: sum
    sql: ${TABLE}.ytdexpectedrecoverychangeamt

  - measure: itdpaidamt
    view_label: Inception To Date Measures
    label: 'Paid Loss ITD'
    description: 'Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.itdpaidamt

  - measure: mtdpaidamt
    view_label: Month to Date Measures
    label: 'Paid Loss MTD'
    description: 'Paid Loss during month'
    type: sum
    sql: ${TABLE}.mtdpaidamt

  - measure: ytdpaidamt
    view_label: Year To Date Measures
    label: 'Paid Loss YTD'
    description: 'Paid Loss during year'
    type: sum
    sql: ${TABLE}.ytdpaidamt

  - measure: itdpostedrecoveryamt
    view_label: Inception To Date Measures
    label: 'Recovery Posted ITD'
    description: 'Recovery received from inception'
    type: sum
    sql: ${TABLE}.itdpostedrecoveryamt

  - measure: mtdpostedrecoveryamt
    view_label: Month to Date Measures
    label: 'Recovery Posted MTD'
    description: 'Recovery received during month'
    type: sum
    sql: ${TABLE}.mtdpostedrecoveryamt

  - measure: ytdpostedrecoveryamt
    view_label: Year To Date Measures
    label: 'Recovery Posted YTD'
    description: 'Recovery received during year'
    type: sum
    sql: ${TABLE}.ytdpostedrecoveryamt

  - measure: itdincurredamt
    view_label: Inception To Date Measures
    label: 'Incurred Loss ITD'
    description: 'Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.itdincurredamt

  - measure: mtdincurredamt
    view_label: Month to Date Measures
    label: 'Incurred Loss MTD'
    description: 'Incurred Loss during month'
    type: sum
    sql: ${TABLE}.mtdincurredamt

  - measure: ytdincurredamt
    view_label: Year To Date Measures
    label: 'Incurred Loss YTD'
    description: 'Incurred Loss during year'
    type: sum
    sql: ${TABLE}.ytdincurredamt

  - measure: itdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Incurred Loss Net Recovery ITD'
    description: 'Incurred Loss Net Recovery since inception'
    type: sum
    sql: ${TABLE}.itdincurrednetrecoveryamt

  - measure: mtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Incurred Loss Net Recovery MTD'
    description: 'Incurred Loss Net Recovery during month'
    type: sum
    sql: ${TABLE}.mtdincurrednetrecoveryamt

  - measure: ytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Incurred Loss Net Recovery YTD'
    description: 'Incurred Loss Net Recovery during year'
    type: sum
    sql: ${TABLE}.ytdincurrednetrecoveryamt

  - measure: cededoutstandingamt
    view_label: Point In Time Measures
    label: 'Ceded Outstanding Reserve'
    description: 'The ceded reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.cededoutstandingamt

  - measure: prioryearendcededoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Ceded Outstanding Reserve'
    description: 'The ceded reserve total at the end of the previous year'
    type: number
    sql: (${claim_level_summary.cededoutstandingamt}-${claim_level_summary.cededytdreservechangeamt})

  - measure: cededmtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Ceded Resereve Change MTD'
    description: 'The ceded reserve change during the month'
    type: sum
    sql: ${TABLE}.cededmtdreservechangeamt

  - measure: cededytdreservechangeamt
    label: 'Ceded Resereve Change YTD'
    description: 'The ceded reserve change during the year'  
    type: sum
    view_label: Year To Date Measures
    sql: ${TABLE}.cededytdreservechangeamt

  - measure: cededoutstandingexpectedrecoveryamt
    hidden: true
    view_label: Point In Time Measures
    label: 'Outstanding Expected Reinsurance Recovery'
    description: 'The outstanding expected reinsurance recovery not recieved'
    type: sum
    sql: ${TABLE}.cededoutstandingexpectedrecoveryamt

  - measure: cededmtdexpectedrecoverychangeamt
    hidden: true  
    view_label: Month to Date Measures
    label: 'Expected Reinsurance Recovery MTD'
    description: 'The expected reinsurance recovery change in month'
    type: sum
    sql: ${TABLE}.cededmtdexpectedrecoverychangeamt

  - measure: cededytdexpectedrecoverychangeamt
    hidden: true
    view_label: Year To Date Measures
    label: 'Expected Reinsurance Recovery YTD'
    description: 'The ceded expected reinsurance recovery change in year'
    type: sum
    sql: ${TABLE}.cededytdexpectedrecoverychangeamt

  - measure: cededitdpaidamt
    view_label: Inception To Date Measures
    label: 'Ceded Paid Loss ITD'
    description: 'Ceded Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.cededitdpaidamt

  - measure: cededmtdpaidamt
    view_label: Month to Date Measures
    label: 'Ceded Paid Loss MTD'
    description: 'Ceded Paid Loss during month'
    type: sum
    sql: ${TABLE}.cededmtdpaidamt

  - measure: cededytdpaidamt
    view_label: Year To Date Measures
    label: 'Ceded Paid Loss YTD'
    description: 'Ceded Paid Loss during year'
    type: sum
    sql: ${TABLE}.cededytdpaidamt

  - measure: cededitdpostedrecoveryamt
    view_label: Inception To Date Measures
    label: 'Posted Reinsurance Recovery ITD'
    description: 'Reinsurance Recovery received from inception'
    type: sum
    sql: ${TABLE}.cededitdpostedrecoveryamt

  - measure: cededmtdpostedrecoveryamt
    view_label: Month to Date Measures
    label:  'Posted Reinsurance Recovery MTD'
    description: 'Reinsurance Recovery received during month'
    type: sum
    sql: ${TABLE}.cededmtdpostedrecoveryamt

  - measure: cededytdpostedrecoveryamt
    view_label: Year To Date Measures
    label: 'Posted Reinsurance Recovery YTD'
    description: 'Reinsurance Recovery received during year'
    type: sum
    sql: ${TABLE}.cededytdpostedrecoveryamt

  - measure: cededitdincurredamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss ITD'
    description: 'Ceded Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.cededitdincurredamt

  - measure: cededmtdincurredamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss MTD'
    description: 'Ceded Incurred Loss during month'
    type: sum
    sql: ${TABLE}.cededmtdincurredamt

  - measure: cededytdincurredamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss YTD'
    description: 'Ceded Incurred Loss during year'
    type: sum
    sql: ${TABLE}.cededytdincurredamt

  - measure: cededitdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery ITD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery since inception'
    type: sum
    sql: ${TABLE}.cededitdincurrednetrecoveryamt

  - measure: cededmtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery MTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during month'
    type: sum
    sql: ${TABLE}.cededmtdincurrednetrecoveryamt

  - measure: cededytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Ceded Incurred Loss Net Reinsurance Recovery YTD'
    description: 'Ceded Incurred Loss Net Reinsurance Recovery during year'
    type: sum
    sql: ${TABLE}.cededytdincurrednetrecoveryamt

  - measure: netoutstandingamt
    view_label: Point In Time Measures
    label: 'Net Outstanding Reserve'
    description: 'The net reserve total at the end of the period'
    type: sum
    sql: ${TABLE}.netoutstandingamt
    
  - measure: prioryearendnetoutstandingamt
    view_label: Point In Time Measures
    label: 'Prior Year End Net Outstanding Reserve'
    description: 'The net reserve total at the end of the previous year'
    type: number
    sql: (${claim_level_summary.netoutstandingamt}-${claim_level_summary.netytdreservechangeamt})    

  - measure: netmtdreservechangeamt
    view_label: Month to Date Measures
    label: 'Net Resereve Change MTD'
    description: 'The net reserve change during the month'
    type: sum
    sql: ${TABLE}.netmtdreservechangeamt

  - measure: netytdreservechangeamt
    view_label: Year To Date Measures
    label: 'Net Resereve Change YTD'
    description: 'The net reserve change during the year'
    type: sum
    sql: ${TABLE}.netytdreservechangeamt

  - measure: netitdpaidamt
    view_label: Inception To Date Measures
    label: 'Net Paid Loss ITD'
    description: 'Net Paid Loss from inception of claim'
    type: sum
    sql: ${TABLE}.netitdpaidamt

  - measure: netmtdpaidamt
    view_label: Month to Date Measures
    label: 'Net Paid Loss MTD'
    description: 'Net Paid Loss during month'
    type: sum
    sql: ${TABLE}.netmtdpaidamt

  - measure: netytdpaidamt
    view_label: Year To Date Measures
    label: 'Net Paid Loss YTD'
    description: 'Net Paid Loss during year'
    type: sum
    sql: ${TABLE}.netytdpaidamt

  - measure: netitdincurredamt
    view_label: Inception To Date Measures
    label: 'Net Incurred Loss ITD'
    description: 'Incurred Loss since inception'
    type: sum
    sql: ${TABLE}.netitdincurredamt
    
  - measure: netytdincurredamt
    view_label: Year To Date Measures
    label: 'Net Incurred Loss YTD'
    description: 'Net Incurred Loss during year'
    type: sum
    sql: ${TABLE}.netytdincurredamt
    
  - measure: netmtdincurredamt
    view_label: Month to Date Measures
    label: 'Net Incurred Loss MTD'
    description: 'Net Incurred Loss Net Recovery during month'
    type: sum
    sql: ${TABLE}.netmtdincurredamt
    
  - measure: netitdincurrednetrecoveryamt
    view_label: Inception To Date Measures
    label: 'Net Incurred Loss Net Recovery ITD'
    description: 'Incurred Loss Net Recovery since inception'
    type: sum
    sql: ${TABLE}.netitdincurrednetrecoveryamt
    
  - measure: netytdincurrednetrecoveryamt
    view_label: Year To Date Measures
    label: 'Net Incurred Loss Net Recovery YTD'
    description: 'Net Incurred Loss Net Recovery during year'
    type: sum
    sql: ${TABLE}.netytdincurrednetrecoveryamt
    
  - measure: netmtdincurrednetrecoveryamt
    view_label: Month to Date Measures
    label: 'Net Incurred Loss Net Recovery MTD'
    description: 'Net Incurred Loss Net Recovery during month'
    type: sum
    sql: ${TABLE}.netmtdincurrednetrecoveryamt    


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
