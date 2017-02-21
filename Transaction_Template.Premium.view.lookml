- view: transaction_template_premium
  sql_table_name: dw.accountingstats
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    sql: ${TABLE}.id

  - dimension_group: accountingdt
    label: "Accounting"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.accountingdt

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.adddt

  - dimension: annualstatementlinecd
    label: "Annual Statement Line Code"
    sql: ${TABLE}.annualstatementlinecd

  - dimension_group: bookdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: businesssourcecd
    label: "Business Source Code"
    sql: ${TABLE}.businesssourcecd

  - dimension: carriercd
    label: "Carrier Code"
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: "Carrier Group Code" 
    sql: ${TABLE}.carriergroupcd

  - dimension: coinsurancepct
    label: "Coinsurance %"
    type: number
    sql: ${TABLE}.coinsurancepct

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: commissionareacd
    hidden: true
    label: "Commission Area Code"
    sql: ${TABLE}.commissionareacd

  - dimension: commissionkey
    hidden: true
    label: "Commission Key"
    sql: ${TABLE}.commissionkey

#   - dimension: companycd
#     label: "Company Code"
#     sql: ${TABLE}.companycd

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

  - dimension: coveredperilscd
    label: "Coverage Perils Code"
    sql: ${TABLE}.coveredperilscd

  - dimension: customerref
    label: "Customer Ref"
    type: number
    sql: ${TABLE}.customerref

  - dimension: deductible1
    label: "Deductible 1"
    sql: ${TABLE}.deductible1

  - dimension: deductible2
    label: "Deductible 1"
    sql: ${TABLE}.deductible2

  - dimension: earndays
    label: "Earn Days"  
    type: number
    sql: ${TABLE}.earndays

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

  - dimension_group: expirationdt
    label: "Expiration"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.expirationdt

  - dimension: feecd
    label: "Fee Code"
    sql: ${TABLE}.feecd

  - dimension: inforcechangeamt
    label: "Inforce Change Amount"
    type: number
    sql: ${TABLE}.inforcechangeamt

  - dimension: insurancetypecd
    label: "Insurance Type Code"
    sql: ${TABLE}.insurancetypecd

  - dimension: limit1
    label: "Limit 1"
    sql: ${TABLE}.limit1

  - dimension: limit2
    label: "Limit 1"
    sql: ${TABLE}.limit2

  - dimension: linecd
    label: "Line Code"
    sql: ${TABLE}.linecd

  - dimension: newrenewalcd
    label: "New or Renewal"
    sql: ${TABLE}.newrenewalcd

  - dimension: payplancd
    label: "Pay Plan Code"
    sql: ${TABLE}.payplancd

  - dimension: policygroupcd
    label: "Policy Group Code"
    sql: ${TABLE}.policygroupcd

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyref
    hidden: true
    type: number
    sql: ${TABLE}.policyref

  - dimension: policystatuscd
    hidden: true
    label: "Policy Status Code"
    sql: ${TABLE}.policystatuscd

  - dimension: policytypecd
    label: "Policy Type Code"
    sql: ${TABLE}.policytypecd

  - dimension: policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion

  - dimension: policyyear
    label: "Policy Year"
    sql: ${TABLE}.policyyear

  - dimension: producercd
    label: "Producer Code"
    sql: ${TABLE}.producercd

  - dimension: productname
    label: "Product Name"
    sql: ${TABLE}.productname

  - dimension: productversionidref
    label: "Product Version Id Ref"
    sql: ${TABLE}.productversionidref

  - dimension: rateareaname
    label: "Rate Area Name"
    sql: ${TABLE}.rateareaname

  - dimension: riskcd
    label: "Risk Code"
    sql: ${TABLE}.riskcd

  - dimension: shortratestatind
    hidden: true
    sql: ${TABLE}.shortratestatind

  - dimension_group: startdt
    label: "Start"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.startdt

  - dimension: statdata
    hidden: true
    sql: ${TABLE}.statdata

  - dimension: statecd
    label: "State Code"
    sql: ${TABLE}.statecd

  - dimension: statementaccountnumber
    label: "Statement Account #"
    sql: ${TABLE}.statementaccountnumber

  - dimension: statementaccountref
    hidden: true
    type: number
    sql: ${TABLE}.statementaccountref

  - dimension: statsequence
    hidden: true
    type: number
    sql: ${TABLE}.statsequence

  - dimension: statsequencereplace
    hidden: true
    type: number
    sql: ${TABLE}.statsequencereplace

  - dimension: statuscd
    label: "Status Code"
    sql: ${TABLE}.statuscd

#   - dimension: sublinecd
#     label: "Subline Code"
#     sql: ${TABLE}.sublinecd

  - dimension: systemid
    hidden: true
    type: number
    sql: ${TABLE}.systemid

  - dimension: termdays
    type: number
    sql: ${TABLE}.termdays

  - dimension: transactioncd
    label: "Transaction Code"
    sql: ${TABLE}.transactioncd

  - dimension_group: transactioneffectivedt
    label: "Transaction Effective"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.transactioneffectivedt

  - dimension: transactionnumber
    label: "Transaction #"
    type: number
    sql: ${TABLE}.transactionnumber

  - dimension: writtencommissionamt
    hidden: true
    type: number
    sql: ${TABLE}.writtencommissionamt

  - dimension: writtencommissionfeeamt
    hidden: true
    type: number
    sql: ${TABLE}.writtencommissionfeeamt

  - dimension: writtenpremiumamt
    hidden: true
    type: number
    sql: ${TABLE}.writtenpremiumamt

  - dimension: writtenpremiumfeeamt
    hidden: true
    type: number
    sql: ${TABLE}.writtenpremiumfeeamt

  #####################################
      ##MEASURES##
  #####################################
  
  - measure: count
    hidden: true
    type: count
    drill_fields: [id, rateareaname, productname, conversionfilename]
    
  - measure: inforcechange_avg
    label: "Average Inforce Change Amount"
    description: "This measure represents the average inforce change amount"
    value_format: "#,##0.00"
    type: avg
    sql: ${inforcechangeamt}
 
  - measure: inforcechange
    label: "Total Inforce Change Amount"
    description: "This measure represents the total inforce change amount"
    value_format: "#,##0.00"
    type: sum
    sql: ${inforcechangeamt}
    
  - measure: writtencommission
    label: "Written Commission"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtencommissionamt} 

  - measure: writtencommissionfee
    label: "Written Commission Fee"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtencommissionfeeamt}

  - measure: writtenpremium
    label: "Written Premium"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtenpremiumamt} 

  - measure: writtenpremiumfee
    label: "Written Premium Fee"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtenpremiumfeeamt}
    
  - measure: writtenpremiumtotal
    label: "Written Premium + Fee"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtenpremiumfeeamt} + ${writtenpremiumamt} 
  