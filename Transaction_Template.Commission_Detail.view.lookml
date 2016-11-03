- view: transaction_template_commission_detail
  sql_table_name: dw.commissiondetail
 
       
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: adddt
    label: 'Add'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.adddt

  - dimension: carriercd
    label: 'Carrier'
    type: string
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: 'Carrier Group'
    type: string
    sql: ${TABLE}.carriergroupcd

  - dimension: commissionarea
    label: 'Commission Area'
    type: string
    sql: ${TABLE}.commissionarea

  - dimension: commissionkey
    label: 'Commission Key'
    type: string
    sql: ${TABLE}.commissionkey

  - dimension: commissionpct
    label: 'Commission Pct'
    type: number
    sql: ${TABLE}.commissionpct
    value_format: '0.00'

  - dimension: correctionind
    label: 'Correction Ind'
    type: string
    sql: ${TABLE}.correctionind

  - dimension: correctionreason
    label: 'Correction Reason'
    type: string
    sql: ${TABLE}.correctionreason

  - dimension: correctionreasoncd
    label: 'Correction Reason Code'
    type: string
    sql: ${TABLE}.correctionreasoncd

  - dimension: insuredname
    label: 'Insured Name'
    type: string
    sql: ${TABLE}.insuredname

  - dimension_group: originalpaythroughdt
    label: 'Original Pay Through'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.originalpaythroughdt

  - dimension: paidaccount
    label: 'Paid Account'
    type: string
    sql: ${TABLE}.paidaccount

  - dimension_group: paiditemdt
    label: 'Paid Item'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paiditemdt

  - dimension: paiditemnumber
    label: 'Paid Item Number'
    type: string
    sql: ${TABLE}.paiditemnumber

  - dimension: paidmethodcd
    label: 'Paid Method Code'
    type: string
    sql: ${TABLE}.paidmethodcd

  - dimension: paidstatuscd
    label: 'Paid Status'
    type: string
    sql: ${TABLE}.paidstatuscd

  - dimension_group: paymentrequesteddt
    label: 'Payment Requested'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paymentrequesteddt

  - dimension: paymentsourceref
    hidden: true
    type: string
    sql: ${TABLE}.paymentsourceref

  - dimension_group: paythroughdt
    label: 'Pay Through'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paythroughdt

  - dimension: paytocd
    label: 'Pay To Code'
    type: string
    sql: ${TABLE}.paytocd

  - dimension: paytoref
    hidden: true
    type: string
    sql: ${TABLE}.paytoref

  - dimension: paytotypecd
    label: 'Pay to Type'
    type: string
    sql: ${TABLE}.paytotypecd

  - dimension: produceragency
    label: 'Producer Agency'
    type: string
    sql: ${TABLE}.produceragency

  - dimension: produceragencyproviderref
    hidden: true
    type: string
    sql: ${TABLE}.produceragencyproviderref

  - dimension: producergroup
    label: 'Producer Group'
    type: string
    sql: ${TABLE}.producergroup

  - dimension: producergroupproviderref
    hidden: true
    type: string
    sql: ${TABLE}.producergroupproviderref
    
#   - dimension: productname
#     hidden: false
#     label: 'Product Name'
#     type: string
#     sql: ${TABLE}.productname   

  - dimension: providercd
    label: 'Provider Code'
    type: string
    sql: ${TABLE}.providercd

  - dimension: providerref
    hidden: true
    type: string
    sql: ${TABLE}.providerref

  - dimension_group: sourceeffectivedt
    label: 'Policy Effective'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sourceeffectivedt

  - dimension: sourcenumber
    label: 'Policy Number'
    type: string
    sql: ${TABLE}.sourcenumber

  - dimension: sourceref
    hidden: true
    type: string
    sql: ${TABLE}.sourceref

  - dimension: sourcetransactionnumber
    label: 'Policy Transaction Number'
    type: number
    sql: ${TABLE}.sourcetransactionnumber

  - dimension: sourceversion
    label: 'Policy Version'
    type: string
    sql: ${TABLE}.sourceversion

  - dimension: subtypecd
    label: 'Policy Type'
    type: string
    sql: ${TABLE}.subtypecd

  - dimension: systemid
    hidden: true
    type: number
    value_format_name: id
    sql: ${TABLE}.systemid

  - dimension: transactioncheckamt
    hidden: true
    type: number
    sql: ${TABLE}.transactioncheckamt

  - dimension: transactionchecknumber
    hidden: true
    type: string
    sql: ${TABLE}.transactionchecknumber

  - dimension_group: transactioneffectivedt
    label: 'Transaction Effective'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transactioneffectivedt

  - dimension_group: transactionentrydt
    label: 'Transaction Entry'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transactionentrydt

  - dimension: transactionentrytm
    hidden: true
    type: string
    sql: ${TABLE}.transactionentrytm

  - dimension: transactiontypecd
    label: 'Transaction Type'
    type: string
    sql: ${TABLE}.transactiontypecd

  - dimension: type
    label: 'Commission Type'
    type: string
    sql: ${TABLE}.type

  - measure: count
    hidden: true
    type: count
    drill_fields: [id, insuredname]
    
  - measure: chargedamt
    label: 'Charge Amount'
    type: sum
    sql: ${TABLE}.chargedamt

  - measure: commissionableamt
    label: 'Amount Subject To Commission'
    type: sum
    sql: ${TABLE}.commissionableamt

  - measure: commissionamt
    label: 'Commission Amount'
    type: sum
    sql: ${TABLE}.commissionamt   
    
  - measure: otherfeeamt
    label: 'Other Fee Amount'
    type: sum
    sql: ${TABLE}.otherfeeamt   
    
  - measure: policyfeeamt
    label: 'Policy Fee Amount'
    type: sum
    sql: ${TABLE}.policyfeeamt

  - dimension: premiumamt
    hidden: true
    type: number
    sql: ${TABLE}.premiumamt
    
  - measure: receivedamt
    label: 'Received Amount'
    type: sum
    sql: ${TABLE}.receivedamt
    
  - measure: taxesamt
    label: 'Tax Amount'
    type: sum
    sql: ${TABLE}.taxesamt  
    
  - measure: writtenpremiumamt
    label: 'Written Premium'
    type: sum
    sql: ${TABLE}.writtenpremiumamt  