- view: transaction_template_payable
  sql_table_name: masked_data.payablestats
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    sql: ${TABLE}.id

  - dimension: accountnumber
    label: "Account Number"
    sql: ${TABLE}.accountnumber

  - dimension: accounttransidref
    hidden: true
    sql: ${TABLE}.accounttransidref

  - dimension: accounttransreference
    hidden: true
    sql: ${TABLE}.accounttransreference

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.adddt

  - dimension: allocationamt
    label: "Allocation Amount"
    type: number
    sql: ${TABLE}.allocationamt

  - dimension_group: bookdt
    label: "Book"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: claimantnumber
    label: "Claimant #"
    type: number
    sql: ${TABLE}.claimantnumber

  - dimension: claimanttransactionidref
    hidden: true
    sql: ${TABLE}.claimanttransactionidref

  - dimension: claimnumber
    label: "Claim Number"
    sql: ${TABLE}.claimnumber

  - dimension: classificationcd
    label: "Classification Code"
    sql: ${TABLE}.classificationcd

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: combinepaymentind
    label: "Combine Payment Indicator"
    sql: ${TABLE}.combinepaymentind

  - dimension: itemamt
    label: "Check Amount"
    type: number
    sql: ${TABLE}.itemamt

  - dimension_group: itemdt
    label: "Check"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.itemdt

  - dimension: itemnumber
    label: "Check Number"
    sql: ${TABLE}.itemnumber

  - dimension_group: lossdt
    label: "Loss"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lossdt

  - dimension: paymentaccountcd
    label: "Account Type"
    sql: ${TABLE}.paymentaccountcd

  - dimension: paymentstatuscd
    label: "Payment Status Code"
    sql: ${TABLE}.paymentstatuscd

  - dimension: paymentsystemid
    label: "Payment System ID"
    type: number
    sql: ${TABLE}.paymentsystemid

  - dimension: paytoname
    label: "Payee"
    sql: ${TABLE}.paytoname

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyproviderref
    label: "Policy Provider Ref"
    type: number
    sql: ${TABLE}.policyproviderref

  - dimension: printertemplateidref
    hidden: true
    sql: ${TABLE}.printertemplateidref

  - dimension: providercd
    label: "Provider Code"
    sql: ${TABLE}.providercd

  - dimension: providerref
    label: "Provider Ref"
    type: number
    sql: ${TABLE}.providerref

  - dimension_group: requestdt
    label: "Request"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.requestdt

  - dimension: sequencenumber
    label: "Sequence #"
    type: number
    sql: ${TABLE}.sequencenumber

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

  - dimension: sourcecd
    label: "Account"
    sql: ${TABLE}.sourcecd

  - dimension: sourceref
    label: "Item Reference"
    sql: ${TABLE}.sourceref

  - dimension: statcd
    label: "Stat Code"
    sql: ${TABLE}.statcd

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

  - dimension: systemid
    hidden: true
    label: "Primary key"
    type: number
    sql: ${TABLE}.systemid

  - dimension: transactionamt
    label: "Transaction Amount"
    type: number
    sql: ${TABLE}.transactionamt

  - dimension_group: transactiondt
    label: "Transaction"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.transactiondt

  - dimension: transactionnumber
    label: "Transaction #"
    type: number
    sql: ${TABLE}.transactionnumber

  - dimension: transactiontm
    hidden: true
    sql: ${TABLE}.transactiontm

  - dimension: transactiontypecd
    label: "Transaction Type Code"
    sql: ${TABLE}.transactiontypecd

  - dimension: transactionuser
    label: "Transaction User"
    sql: ${TABLE}.transactionuser

  - dimension: typecd
    label: "Type Code"
    sql: ${TABLE}.typecd

  - measure: count
    hidden: true
    type: count
    drill_fields: [id, paytoname]