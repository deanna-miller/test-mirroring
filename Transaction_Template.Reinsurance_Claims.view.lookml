- view: transaction_template_reinsurance_claims
  sql_table_name: masked_data.claimreinsurancestats
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

  - dimension: annualstatementlinecd
    label: "Annual Statement Line Code"
    sql: ${TABLE}.annualstatementlinecd

  - dimension_group: bookdt
    label: "Book Date"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt

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

  - dimension: combinedkey
    hidden: true
    sql: ${TABLE}.combinedkey

  - dimension: customerref
    label: "Customer Ref"
    type: number
    sql: ${TABLE}.customerref

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

  - dimension: expectedrecoverychangeamt
    hidden: true
    type: number
    sql: ${TABLE}.expectedrecoverychangeamt

  - dimension_group: expirationdt
    label: "Expiration"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.expirationdt

  - dimension: losscausecd
    label: "Cause of Loss Code"
    sql: ${TABLE}.losscausecd

  - dimension_group: lossdt
    label: "Loss"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lossdt

  - dimension: lossyear
    label: "Loss Year"
    sql: ${TABLE}.lossyear

  - dimension: mastersubind
    sql: ${TABLE}.mastersubind

  - dimension: paidamt
    hidden: true
    type: number
    sql: ${TABLE}.paidamt

  - dimension: policyformcd
    label: "Policy Form Code"
    sql: ${TABLE}.policyformcd

  - dimension: policygroupcd
    label: "Policy Group Code"
    sql: ${TABLE}.policygroupcd

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyproductname
    label: "Policy Product Name"
    sql: ${TABLE}.policyproductname

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

  - dimension: productname
    label: "Product Name"
    sql: ${TABLE}.productname

  - dimension: productversionidref
    hidden: true
    sql: ${TABLE}.productversionidref

  - dimension: recoverytransactioncd
    label: "Recovery Transaction Code"
    sql: ${TABLE}.recoverytransactioncd

  - dimension: recoverytransactionnumber
    label: "Recovery Transaction #"
    type: number
    sql: ${TABLE}.recoverytransactionnumber

  - dimension: reinsuranceitemname
    label: "Reinsurance Item Name"
    sql: ${TABLE}.reinsuranceitemname

  - dimension: reinsurancename
    label: "Reinsurance Name"
    sql: ${TABLE}.reinsurancename

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

  - dimension: reservetypecd
    label: "Reserve Type Code"
    sql: ${TABLE}.reservetypecd

  - dimension: reversalstopind
    hidden: true
    sql: ${TABLE}.reversalstopind

  - dimension_group: startdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.startdt

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

  - dimension: sublosscausecd
    label: "Cause of Loss Sub Code"
    sql: ${TABLE}.sublosscausecd

  - dimension: summarykey
    hidden: true
    sql: ${TABLE}.summarykey

  - dimension: systemid
    hidden: true
    label: Primary Key
    type: number
    sql: ${TABLE}.systemid

  - dimension: transactioncd
    label: "Transaction Code"
    sql: ${TABLE}.transactioncd

  - dimension: transactionnumber
    label: "Transaction #"
    type: number
    sql: ${TABLE}.transactionnumber
  
    
  - measure: paidloss
    label: "Paid Loss"
    type: sum
    sql: ${paidamt}
    
      
  - measure: indemnitypaid
    label: "Indemnity Paid"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Indemnity"
      
  - measure: adjustmentpaid
    label: "Adjustment Paid"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Adjustment"  
      
  - measure: defensepaid
    label: "Defense Paid"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Defense"  
      
  - measure: lossexpensepaid
    label: "Loss Expense Paid"
    type: sum
    sql: ${paidamt}
    filters:
      reservecd: "Defense, Adjustment"      
    
  - measure: reservechange
    label: "Reserve Change"
    type: sum
    sql: ${reservechangeamt}
    
  - measure: indemnityreservechange
    label: "Indemnity Reserve Change"
    type: sum
    sql: ${reservechange}
    filters:
      reservecd: "Indemnity"
      
  - measure: adjustmentreservechange
    label: "Adjustment Reserve Change"
    type: sum
    sql: ${reservechange}
    filters:
      reservecd: "Adjustment"  
      
  - measure: defensereservechange
    label: "Defense Reserve Change"
    type: sum
    sql: ${reservechange}
    filters:
      reservecd: "Defense"  
      
  - measure: lossexpensereservechange
    label: "Loss Expense Reserve Change"
    type: sum
    sql: ${reservechange}
    filters:
      reservecd: "Defense, Adjustment"     
    
  - measure: postedreecoveryamt
    label: "Posted Reinsurance Recovery"
    type: sum
    sql: ${postedrecoveryamt}
      
  - measure: expectedrecoverychange
    label: "Expected Reinsurance Recovery"
    type: sum
    sql: ${expectedrecoverychangeamt}   
    
    
      

  - measure: count
    hidden: true
    type: count
    drill_fields: [id, reinsurancename, reinsuranceitemname, productname, policyproductname]