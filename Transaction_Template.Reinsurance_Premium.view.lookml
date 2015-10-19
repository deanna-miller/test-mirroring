- view: transaction_template_reinsurance_premium
  sql_table_name: masked_data.policyreinsurancestats
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.id

  - dimension_group: accountingdt
    label: "Accounting"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.accountingdt

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.adddt

  - dimension: annualstatementlinecd
    label: "Annual Statement Line"
    sql: ${TABLE}.annualstatementlinecd

  - dimension_group: bookdt
    label: "Book"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: carriercd
    label: "Carrier Code"
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: "Carrier Group Code"
    sql: ${TABLE}.carriergroupcd

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: customerref
    label: "Customer Ref"
    type: int
    sql: ${TABLE}.customerref

  - dimension: earndays
    label: "Earn Days"
    type: int
    sql: ${TABLE}.earndays

  - dimension_group: effectivedt
    label: "Effective"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effectivedt

  - dimension_group: enddt
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.enddt

  - dimension_group: expirationdt
    label: "Expiration"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expirationdt

  - dimension: inforcechangeamt
    hidden: true
    type: number
    sql: ${TABLE}.inforcechangeamt

  - dimension: insurancetypecd
    label: "Insurance Type Code"
    sql: ${TABLE}.insurancetypecd

  - dimension: mastersubind
    hidden: true
    sql: ${TABLE}.mastersubind

  - dimension: newrenewalcd
    label: "New or Renewal"
    sql: ${TABLE}.newrenewalcd

  - dimension: policyformcd
    label: "Policy Form"
    sql: ${TABLE}.policyformcd

  - dimension: policygroupcd
    label: "Policy Group"
    sql: ${TABLE}.policygroupcd

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyref
    hidden: true
    type: int
    sql: ${TABLE}.policyref

  - dimension: policystatuscd
    label: "Policy Status"
    sql: ${TABLE}.policystatuscd

  - dimension: policytypecd
    label: "Policy Type"
    sql: ${TABLE}.policytypecd

  - dimension: policyversion
    label: "Policy Version"
    sql: ${TABLE}.policyversion

  - dimension: policyyear
    label: "Policy Year"
    sql: ${TABLE}.policyyear

  - dimension: productname
    label: "Product Name"
    sql: ${TABLE}.productname

  - dimension: productversionidref
    hidden: true
    sql: ${TABLE}.productversionidref

  - dimension: providercd
    label: "Provider Code"
    sql: ${TABLE}.providercd

  - dimension: reinsurancegroupid
    label: "Reinsurance GroupId"
    sql: ${TABLE}.reinsurancegroupid

  - dimension: reinsuranceitemname
    label: "Reinsurance Item Name"
    sql: ${TABLE}.reinsuranceitemname

  - dimension: reinsurancename
    label: "Reinsurance Name"
    sql: ${TABLE}.reinsurancename

  - dimension_group: startdt
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.startdt

  - dimension: statecd
    label: "State Code"
    sql: ${TABLE}.statecd

  - dimension: statsequence
    hidden: true
    type: int
    sql: ${TABLE}.statsequence

  - dimension: statsequencereplace
    hidden: true
    type: int
    sql: ${TABLE}.statsequencereplace

  - dimension: statuscd
    label: "Status Code"
    sql: ${TABLE}.statuscd

  - dimension: systemid
    hidden: true
    type: int
    sql: ${TABLE}.systemid

  - dimension: termdays
    label: "# of Days in Term"
    type: int
    sql: ${TABLE}.termdays

  - dimension: transactioncd
    label: "Transaction Code"
    sql: ${TABLE}.transactioncd

  - dimension_group: transactioneffectivedt
    label: "Transaction Effective"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transactioneffectivedt

  - dimension: transactionnumber
    label: "Transaction #"
    type: int
    sql: ${TABLE}.transactionnumber

  - dimension: writtencommissionamt
    hidden: true
    type: number
    sql: ${TABLE}.writtencommissionamt

  - dimension: writtenpremiumamt
    hidden: true
    type: number
    sql: ${TABLE}.writtenpremiumamt
    
  - measure: inforcechange
    label: "Inforce Change"
    type: sum
    sql: ${TABLE}.inforcechangeamt  
    
  
  - measure: writtencommission
    label: "Written Commission"
    type: sum
    sql: ${writtencommissionamt}  

  - measure: writtenpremium
    label: "Written Premium"
    type: sum
    sql: ${writtenpremiumamt}

  - measure: count
    hidden: true
    type: count
    drill_fields: [id, reinsurancename, reinsuranceitemname, productname]

