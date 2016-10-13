- view: transaction_template_claims_detail
  sql_table_name: masked_data.claimstats
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    sql: ${TABLE}.id

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.adddt

  - dimension: adjusterprovidercd
    label: "Adjuster Code"
    sql: ${TABLE}.adjusterprovidercd

  - dimension: adjusterproviderref  
    hidden: true
    type: number
    sql: ${TABLE}.adjusterproviderref

  - dimension: aggregatelimit
    label: "Aggregate Limit"
    sql: ${TABLE}.aggregatelimit

  - dimension: aggregatelimitdescription
    label: "Aggregate Limit Description"
    sql: ${TABLE}.aggregatelimitdescription

  - dimension: annualstatementlinecd
    label: "Annual Statement Line Code"
    sql: ${TABLE}.annualstatementlinecd

  - dimension_group: bookdt
    label: "Book"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: branchcd
    label: "Branch Code"
    sql: ${TABLE}.branchcd

  - dimension: carriercd
    label: "Carrier Code"
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: "Carrier Group Code"
    sql: ${TABLE}.carriergroupcd

  - dimension: catastrophenumber
    label: "Catastrophe Number"
    sql: ${TABLE}.catastrophenumber

  - dimension: catastropheref
    label: "Catastrophe Ref"
    sql: ${TABLE}.catastropheref

  - dimension: checkamt
    label: "Check Amount"
    type: number
    sql: ${TABLE}.checkamt

  - dimension_group: checkdt
    label: "Check"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.checkdt

  - dimension: checknumber
    label: "Check Number"
    sql: ${TABLE}.checknumber

  - dimension: claimantcd
    label: "Claimant Code"
    sql: ${TABLE}.claimantcd

  - dimension: claimantlinkidref
    hidden: true
    sql: ${TABLE}.claimantlinkidref

  - dimension: claimantstatuscd
    hidden: true
    sql: ${TABLE}.claimantstatuscd

  - dimension: claimantstatuschgind
    hidden: true
    sql: ${TABLE}.claimantstatuschgind

  - dimension: claimanttransactioncd
    label: "Claimant Transaction Code"
    sql: ${TABLE}.claimanttransactioncd

  - dimension: claimanttransactionidref
    hidden: true
    sql: ${TABLE}.claimanttransactionidref

  - dimension: claimanttransactionnumber
    hidden: true
    type: number
    sql: ${TABLE}.claimanttransactionnumber

  - dimension: claimlimit
    hidden: true
    label: "Claim Limit"
    sql: ${TABLE}.claimlimit

  - dimension: claimnumber
    label: "Claim Number"
    sql: ${TABLE}.claimnumber

  - dimension: claimref
    hidden: true
    type: number
    sql: ${TABLE}.claimref

  - dimension: claimstatuscd
    hidden: true
    sql: ${TABLE}.claimstatuscd

  - dimension: claimstatuschgind
    hidden: true
    hidden: true
    sql: ${TABLE}.claimstatuschgind

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: companycd
    hidden: true
    label: "Comapny Code"
    sql: ${TABLE}.companycd

  - dimension: conversionfilename
    hidden: true
    sql: ${TABLE}.conversionfilename

  - dimension: conversiongroup
    hidden: true
    sql: ${TABLE}.conversiongroup

  - dimension: conversionjobref
    hidden: true
    sql: ${TABLE}.conversionjobref

  - dimension: conversiontemplateidref
    hidden: true
    sql: ${TABLE}.conversiontemplateidref

  - dimension: coveragecd
    label: "Coverage Code"
    sql: ${TABLE}.coveragecd

  - dimension: coverageitemcd
    label: "Coverage Item Code"
    sql: ${TABLE}.coverageitemcd

  - dimension: customerref
    label: "Customer Ref"
    type: number
    sql: ${TABLE}.customerref

  - dimension: deductible
    label: "Deductible"
    sql: ${TABLE}.deductible

  - dimension: deductibledescription
    label: "Deductible Description"
    sql: ${TABLE}.deductibledescription
    
  - dimension: disposalamt
    hidden: true
    label: "Disposal Amount"
    sql: ${TABLE}.disposalamt
    
  - dimension: disposaldate
    hidden: true
    label: "Disposal Date"
    sql: ${TABLE}.disposaldt

  - dimension_group: effectivedt
    label: "Effective"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.effectivedt

  - dimension_group: enddt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.enddt

  - dimension: examinerprovidercd
    label: "Examiner Provider Code"
    sql: ${TABLE}.examinerprovidercd

  - dimension: examinerproviderref
    hidden: true
    type: number
    sql: ${TABLE}.examinerproviderref

  - dimension: expectedrecoverychangeamt
    hidden: true
    type: number
    sql: ${TABLE}.expectedrecoverychangeamt

  - dimension_group: expirationdt
    label: "Expiration"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.expirationdt

  - dimension: featurecd
    label: "Feature Code"
    sql: ${TABLE}.featurecd

  - dimension: featurestatuscd
    hidden: true
    sql: ${TABLE}.featurestatuscd

  - dimension: featurestatuschgind
    hidden: true
    sql: ${TABLE}.featurestatuschgind

  - dimension: featuresubcd
    label: "Feature Sub Code"
    sql: ${TABLE}.featuresubcd

  - dimension: featuretypecd
    label: "Feature Type Code"
    sql: ${TABLE}.featuretypecd
    
  - dimension: indadjuster
    hidden: true
    label: "Independent Adjuster"
    sql: ${TABLE}.independentadjuster
    
  - dimension: insurancedname
    hidden: true
    label: "Insured Name"
    sql: ${TABLE}.insuredname

  - dimension: insurancetypecd
    label: "Insurance Type Code"
    sql: ${TABLE}.insurancetypecd

  - dimension: itemnumber
    label: "Item Number"
    type: number
    sql: ${TABLE}.itemnumber

  - dimension: limitdescription
    label: "Limit Description"
    sql: ${TABLE}.limitdescription

  - dimension: linecd
    label: "Line Code"
    sql: ${TABLE}.linecd

  - dimension: losscausecd
    label: "Cause of Loss"
    sql: ${TABLE}.losscausecd

  - dimension_group: lossdt
    label: "loss"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lossdt
    
  - dimension: losslocationcity
    hidden: true
    label: "Loss Location City"
    sql: ${TABLE}.losslocationcity
    
  - dimension: losslocationcounty
    hidden: true
    label: "Loss Location County"
    sql: ${TABLE}.losslocationcounty
    
  - dimension: losslocationterritorycd
    hidden: true
    label: "Loss Location Territory"
    sql: ${TABLE}.losslocationterritorycd
    
  - dimension: lossreportedby
    hidden: true
    label: "Loss Reported By"
    sql: ${TABLE}.lossreportedby

  - dimension: lossyear
    label: "Loss Year"
    sql: ${TABLE}.lossyear
    
  - dimension: memberinsurer
    hidden: true
    label: "Member Insurer"
    sql: ${TABLE}.memberinsurer
    
  - dimension: memberinsurerpolnu
    hidden: true
    label: "Member Insured Policy Number"
    sql: ${TABLE}.memberinsuredpolicynumber

  - dimension: paidamt
    hidden: true
    type: number
    sql: ${TABLE}.paidamt

  - dimension: paymentaccountcd
    label: "Payment Account Code"
    sql: ${TABLE}.paymentaccountcd

  - dimension: paytoname
    label: "Payee"
    sql: ${TABLE}.paytoname

  - dimension: policydeductible
    label: "Policy Deductible"
    sql: ${TABLE}.policydeductible

  - dimension: policyformcd
    label: "Policy Form Code"
    sql: ${TABLE}.policyformcd

  - dimension: policygroupcd
    label: "Policy Group Code"
    sql: ${TABLE}.policygroupcd

  - dimension: policylimit
    label: "Policy Limit"
    sql: ${TABLE}.policylimit

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

#   - dimension: policyproductname
#     label: "Product Name"
#     sql: ${TABLE}.policyproductname

  - dimension: policyproductversionidref
    hidden: true
    sql: ${TABLE}.policyproductversionidref

  - dimension: policyref
    hidden: true
    type: number
    sql: ${TABLE}.policyref

  - dimension: policytypecd
    label: "Policy Type Code"
    sql: ${TABLE}.policytypecd

  - dimension: policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion

  - dimension: policyyear
    label: "Policy Year"
    sql: ${TABLE}.policyyear

  - dimension: postedrecoveryamt
    hidden: true
    type: number
    sql: ${TABLE}.postedrecoveryamt

  - dimension: producerprovidercd
    label: "Producer Code"
    sql: ${TABLE}.producerprovidercd

  - dimension: producerproviderref
    hidden: true
    type: number
    sql: ${TABLE}.producerproviderref

  - dimension: productname
    label: "Product Name"
    sql: ${TABLE}.productname

  - dimension: productversionidref
    hidden: true
    sql: ${TABLE}.productversionidref

  - dimension: propertydamagedidref
    hidden: true
    sql: ${TABLE}.propertydamagedidref

  - dimension: propertydamagednumber
    label: "Property Damage Number"
    sql: ${TABLE}.propertydamagednumber

  - dimension: providerref
    hidden: true
    sql: ${TABLE}.providerref

  - dimension: providerrole
    hidden: true
    label: "Provider Role"
    sql: ${TABLE}.providerrole

  - dimension: rateareaname
    label: "Rate Area Name"
    sql: ${TABLE}.rateareaname

  - dimension: recordonly
    hidden: true
    sql: ${TABLE}.recordonly

  - dimension_group: reportdt
    label: "Report"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.reportdt

  - dimension: reservecd
    label: "Reserve Code"
    sql: ${TABLE}.reservecd

  - dimension: reservechangeamt
    hidden: true
    type: number
    sql: ${TABLE}.reservechangeamt

  - dimension: reservestatuscd
    hidden: true
    sql: ${TABLE}.reservestatuscd

  - dimension: reservestatuschgind
    hidden: true
    sql: ${TABLE}.reservestatuschgind

  - dimension: reservetypecd
    label: "Reserve Type Code"
    sql: ${TABLE}.reservetypecd

  - dimension: reversalstopind
    hidden: true
    sql: ${TABLE}.reversalstopind

  - dimension: riskcd
    label: "Risk Code"
    sql: ${TABLE}.riskcd
  
  - dimension: salvagedate
    hidden: true
    label: "Salvage Date"
    sql: ${TABLE}.salvagedt
    
  - dimension: salvagevalue
    hidden: true
    label: "Salvage Value"
    sql: ${TABLE}.salvagevalue

  - dimension_group: serviceperiodenddt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.serviceperiodenddt

  - dimension_group: serviceperiodstartdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.serviceperiodstartdt

  - dimension_group: startdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.startdt

  - dimension: statdata
    hidden: true
    label: "Stat Data"
    sql: ${TABLE}.statdata

  - dimension: statecd
    label: "State Code"
    sql: ${TABLE}.statecd

  - dimension: statsequence
    hidden: true
    type: number
    sql: ${TABLE}.statsequence

  - dimension: statsequencereplace
    hidden: true
    type: number
    sql: ${TABLE}.statsequencereplace

  - dimension: statuscd
    hidden: true
    sql: ${TABLE}.statuscd

  - dimension: sublinecd
    hidden: true
    sql: ${TABLE}.sublinecd

  - dimension: sublosscausecd
    label: "Cause of Loss Sub Code"
    sql: ${TABLE}.sublosscausecd

  - dimension: summarykey
    hidden: true
    sql: ${TABLE}.summarykey

  - dimension: systemcheckreference
    hidden: true
    sql: ${TABLE}.systemcheckreference

  - dimension: systemid
    hidden: true
    label: "Primary Key"
    type: number
    sql: ${TABLE}.systemid

  - dimension: transactioncd
    label: "Transaction Code"
    sql: ${TABLE}.transactioncd

  - dimension: transactionnumber
    label: "Transaction #"
    type: number
    sql: ${TABLE}.transactionnumber

 # ----------Measures ----------------------

  - measure: paidloss
    label: "Paid Loss"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    
  - measure: indemnitypaid
    label: "Indemnity Paid"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Indemnity"
      
  - measure: adjustmentpaid
    label: "Adjustment Paid"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Adjustment"  
      
  - measure: defensepaid
    label: "Defense Paid"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Defense"  
      
  - measure: lossexpensepaid
    label: "Loss Expense Paid"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Defense, Adjustment"      
    
  - measure: reservechange
    label: "Reserve Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${reservechangeamt}
    
  - measure: indemnityreservechange
    label: "Indemnity Reserve Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${reservechangeamt}
    filters:
      reservecd: "Indemnity"
      
  - measure: adjustmentreservechange
    label: "Adjustment Reserve Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${reservechangeamt}
    filters:
      reservecd: "Adjustment"  
      
  - measure: defensereservechange
    label: "Defense Reserve Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${reservechangeamt}
    filters:
      reservecd: "Defense"  
      
  - measure: lossexpensereservechange
    label: "Loss Expense Reserve Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${reservechangeamt}
    filters:
      reservecd: "Defense, Adjustment"     
    
  - measure: postedreecoveryamt
    label: "Posted Recovery"
    value_format: "#,##0.00"
    type: sum
    sql: ${postedrecoveryamt}
    
  - measure: postedsalvage
    label: "Posted Salvage"
    value_format: "#,##0.00"
    type: sum
    sql: ${postedrecoveryamt}
    filters:
      reservecd: "Salvage"    
    
  - measure: postedsubrogation
    label: "Posted Subrogation "
    value_format: "#,##0.00"
    type: sum
    sql: ${postedrecoveryamt}  
    filters:
      reservecd: "Subrogation"  
      
  - measure: expectedrecoverychange
    label: "Expected Recovery Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${expectedrecoverychangeamt}   
    
  - measure: expectedsalvagechange
    label: "Expected Salvage Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${expectedrecoverychangeamt}
    filters:
      reservecd: "Salvage"    
    
  - measure: expectedsubrogationchange
    label: "Expected Subrogation Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${expectedrecoverychangeamt}  
    filters:
      reservecd: "Subrogation"   
      
  - measure: dol_to_add_date
    label: "DOL to AddDate"
    value_format: "#,##0"
    type: sum
    sql: ${lossdt_date} - ${adddt_date}
    
    
  - measure: count
    hidden: true
    type: count
    drill_fields: detail*   
    
    
  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - paytoname
    - rateareaname
    - productname
    - policyproductname
    - conversionfilename