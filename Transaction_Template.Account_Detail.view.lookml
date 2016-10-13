- view: transaction_template_account_detail
  sql_table_name: masked_data.accountstats
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

  - dimension: accountnumber
    label: "Account Number"
    sql: ${TABLE}.accountnumber

  - dimension: accountref
    hidden: true
    sql: ${TABLE}.accountref

  - dimension: accounttypecd
    label: "Account Type Code"
    sql: ${TABLE}.accounttypecd



  - dimension: activitytypecd
    label: "Activity Type Code"
    sql: ${TABLE}.activitytypecd

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.adddt

  - dimension: adjustmentamt
    hidden: true
    type: number
    sql: ${TABLE}.adjustmentamt

  - dimension: adjustmenttypecd
    label: "Adjustment Type Code"
    sql: ${TABLE}.adjustmenttypecd

  - dimension: balanceamt
    hidden: true
    type: number
    sql: ${TABLE}.balanceamt

  - dimension: batchid
    label: "Batch Id"
    sql: ${TABLE}.batchid

  - dimension: billingentitysequencenumber
    hidden: true
    sql: ${TABLE}.billingentitysequencenumber

  - dimension: billmethod
    label: "Bill Method"
    sql: ${TABLE}.billmethod

  - dimension_group: bookdt
    label: "Book"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt
    
  - dimension: carriercd
    label: "Carrier Code"
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: "Carrier Group Code"
    sql: ${TABLE}.carriergroupcd

  - dimension: categorycd
    label: "Category Code"
    sql: ${TABLE}.categorycd
    
  - dimension: chargeamt
    hidden: true
    type: number
    sql: ${TABLE}.chargeamt
    
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

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: commisionpct
    label: "Commission Pct"
    type: number
    sql: ${TABLE}.commisionpct

  - dimension: commissionchargeamt
    hidden: true
    type: number
    sql: ${TABLE}.commissionchargeamt

  - dimension: commissionkey
    hidden: true
    label: "Commission Key"
    sql: ${TABLE}.commissionkey

  - dimension: commissiontakenamt
    hidden: true
    label: "Commission Taken"
    type: number
    sql: ${TABLE}.commissiontakenamt

  - dimension: commissiontypecd
    label: "Commission Type Code"
    sql: ${TABLE}.commissiontypecd

  - dimension: companycd
    label: "Company Code"
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

  - dimension: customerref
    label: "Customer Ref"
    type: number
    sql: ${TABLE}.customerref

  - dimension: depositorylocationcd
    label: "Depository Location Code"
    sql: ${TABLE}.depositorylocationcd

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

  - dimension_group: entrydt
    label: "Entry"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.entrydt

  - dimension: grossnetind
    label: "Gross or Net"
    sql: ${TABLE}.grossnetind

  - dimension: insuredname
    label: "Insured Name"
    sql: ${TABLE}.insuredname

  - dimension: netadjustmentamt
    hidden: true
    type: number
    sql: ${TABLE}.netadjustmentamt

  - dimension: netbalanceamt
    hidden: true
    type: number
    sql: ${TABLE}.netbalanceamt

  - dimension: netchargeamt
    hidden: true
    type: number
    sql: ${TABLE}.netchargeamt

  - dimension: netpaidamt
    hidden: true
    type: number
    sql: ${TABLE}.netpaidamt

  - dimension_group: nextduedt
    label: "Next Due"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.nextduedt

  - dimension: paidamt
    hidden: true
    type: number
    sql: ${TABLE}.paidamt

  - dimension: paidby
    label: "Paid by"
    sql: ${TABLE}.paidby

  - dimension: paidbyname
    label: "Paid By Name"
    sql: ${TABLE}.paidbyname

  - dimension: payoffamt
    hidden: true
    type: number
    sql: ${TABLE}.payoffamt

  - dimension: payplancd
    label: "Pay Plan Code"
    sql: ${TABLE}.payplancd

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyref
    hidden: true
    sql: ${TABLE}.policyref

  - dimension: policytransactioncd
    label: "Policy Transaction Code"
    sql: ${TABLE}.policytransactioncd

  - dimension_group: policytransactioneffectivedt
    label: "Policy Transaction Effective"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.policytransactioneffectivedt

  - dimension: policytransactionnumber
    label: "Policy Transaction #"
    sql: ${TABLE}.policytransactionnumber

  - dimension: policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion

  - dimension: providercd
    label: "Provider Code"
    sql: ${TABLE}.providercd

  - dimension: reversalstopind
    hidden: true
    sql: ${TABLE}.reversalstopind

  - dimension_group: settlementdt
    label: "Settlement"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.settlementdt

  - dimension: sourcecd
    label: "Source Code"
    sql: ${TABLE}.sourcecd

  - dimension_group: startdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.startdt

  - dimension: statecd
    label: "State Code"
    sql: ${TABLE}.statecd

  - dimension: statementaccountnumber
    label: "Statement Account #"
    sql: ${TABLE}.statementaccountnumber



  - dimension: statementtypecd
    label: "Statement Type Code"
    sql: ${TABLE}.statementtypecd

  - dimension: statuscd
    sql: ${TABLE}.statuscd

  - dimension: transactiondesc
    label: "Transaction Desc"
    sql: ${TABLE}.transactiondesc

  - dimension: transactionnumber
    label: "Transaction #"
    sql: ${TABLE}.transactionnumber

  - dimension: transactiontypecd
    label: "Transaction Type Code"
    sql: ${TABLE}.transactiontypecd
    
  ####Dimensions that are hidden
  
  - dimension: achagent
    hidden: true
    sql: ${TABLE}.achagent
    
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
    
  - dimension: systemid
    hidden: true
    type: number
    sql: ${TABLE}.systemid
    
  - dimension: systemchecknumber
    hidden: true
    sql: ${TABLE}.systemchecknumber
    
####Measures
    
  - measure: chargeamtbillfee
    label: "Billing Fee Charge"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt}
    filters:
        categorycd: "LateFee, NSFFee, ReinstatementFee"
    
  - measure: chargeamtinstall
    label: "Installment Fee Charge"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt}    
    filters:
      categorycd: "InstallmentFee" 
      
  - measure: chargeamtpremium
    label: "Premium Charge"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt}
    filters:
      categorycd: "Premium"
      
  - measure: chargeamttax
    label: "Tax Charge"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt} 
    filters:
      categorycd: "Tax"
    
  - measure: chargeamttotal
    label: "Charge Amount"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt}
    
  - measure: chargeamttotalundfee
    label: "Underwriting Fee Charge"
    value_format: "#,##0.00"
    type: sum
    sql: ${chargeamt} 
    filters:
      categorycd: "CAFraud, CIGA, ICS, InspectionFee, PolicyFee, SeismicSafetyCommission"    
  
  - measure: adjustmentamount
    label: "Adjustment Amount"
    value_format: "#,##0.00"
    type: sum
    sql: ${adjustmentamt} 
  
  - measure: balanceamount
    label: "Balance Amount"
    value_format: "#,##0.00"
    type: sum
    sql: ${balanceamt}
    
  - measure: paidinstallfee
    label: "Paid Install Fee"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      categorycd: "InstallmentFee"
    
  - measure: paidpremium
    label: "Paid Premium"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      categorycd: "Premium"
      
  - measure: paidreceipts
    label:  "Paid Recepts"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
      
  - measure: paidbillingfee
    label: "Paid Billing Fees"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      categorycd: "LateFee, NSFFee, ReinstatementFee" 
   
  - measure: paidtax
    label: "Paid Tax"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      categorycd: "Tax"  
      
  - measure: paidundfee
    label: "Paid Underwritting Fees"
    value_format: "#,##0.00"
    type: sum
    sql: ${paidamt}
    filters:
      categorycd: "CAFraud, CIGA, ICS, InspectionFee, PolicyFee, SeismicSafetyCommission"     
        
  - measure: payoffamount
    label: "Pay Off Amount"
    value_format: "#,##0.00"
    type: sum
    sql: ${payoffamt}  
      
  - measure: count
    hidden: true
    type: count
    drill_fields: [id, insuredname, paidbyname, conversionfilename]