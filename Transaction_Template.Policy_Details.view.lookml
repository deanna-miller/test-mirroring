- view: transaction_template_policy_details
  sql_table_name: dw.policystats
  fields:

   ###########################################
    # Dimensions for Measures should be hidden#
    ###########################################
    
  - dimension: id
    hidden: true
    primary_key: true
    sql: ${TABLE}.id
    
   #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################

  - dimension_group: accountingdt
    label: "Accounting"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.accountingdt
    
  - dimension: acvlosssettlementroof
    hidden: true
    label: "ACV Loss Settlment Roof"
    sql: ${TABLE}.acvlosssettlmentroof
    
  - dimension: addnlinsamt
    hidden: true
    label: "Additional Amount of Insurance"
    sql: ${TABLE}.additionalinsuranceamt

  - dimension_group: adddt
    label: "Add"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.adddt

  - dimension: ageofhome
    hidden: true
    label: "Age of Home"
    sql: ${TABLE}.ageofhome

  - dimension: annualstatementlinecd
    label: "Annual Statement Line Code"
    sql: ${TABLE}.annualstatementlinecd

  - dimension: assigneddriver
    hidden: true
    label: "Assigned Driver"
    sql: ${TABLE}.assigneddriver
  
  - dimension: beachcoastal
    hidden: true
    label: "Beach Costal"
    sql: ${TABLE}.beachcoastal
    
  - dimension: bldngadditionalterationincrlimit
    hidden: true
    label: "Building Additions and Alterations Increase Limit"
    sql: ${TABLE}.buildingaddalterationinclimit

  - dimension: bodytype
    hidden: true
    label: "Body Type"
    sql: ${TABLE}.bodytype

  - dimension_group: bookdt  # Book date should not be used.  Use Accounting Date instead
    hidden: true
    label: "Book"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: businesssourcecd
    label: "Business Source Code"
    sql: ${TABLE}.businesssourcecd

  - dimension: cancelreason
    label: "Cancel Reason"
    sql: ${TABLE}.cancelreason

  - dimension: carriercd
    label: "Carrier Code"
    sql: ${TABLE}.carriercd

  - dimension: carriergroupcd
    label: "Carrier Group Code"
    sql: ${TABLE}.carriergroupcd

  - dimension: city
    label: "City"
    sql: ${TABLE}.city

  - dimension: classcd
    label: "Class Code"
    sql: ${TABLE}.classcd

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

  - dimension: companycd
    hidden: true
    label: "Company Code"
    sql: ${TABLE}.companycd

  - dimension: compositeadjustment
    hidden: true
    label: "Composite Adjustment"
    sql: ${TABLE}.compositeadjustment

  - dimension: constructioncd
    hidden: true
    label: "Construction Code"
    sql: ${TABLE}.constructioncd

  - dimension: contentslimit
    hidden: true
    label: "Contents Limit"
    sql: ${TABLE}.contentslimit
  
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

  - dimension: county
    label: "County"
    sql: ${TABLE}.county

  - dimension: coveragecd
    label: "Coverage Code"
    sql: ${TABLE}.coveragecd

  - dimension: coverageitemcd
    label: "Coverage Item Code"
    sql: ${TABLE}.coverageitemcd
    
  - dimension: coveragename
    hidden: true
    label: "Coverage Name"
    sql: ${TABLE}.coveragename

  - dimension: coveredperilscd
    label: "Covered Perils"
    sql: ${TABLE}.coveredperilscd

  - dimension: customerref
    label: "Customer Ref"
    type: number
    sql: ${TABLE}.customerref

  - dimension: deductible1
    label: "Deductible1"
    sql: ${TABLE}.deductible1

  - dimension: deductible2
    label: "Deductible2"
    sql: ${TABLE}.deductible2

  - dimension: defensivedriverind
    hidden: true
    label: "Defensive Driver"
    sql: ${TABLE}.defensivedriverind

  - dimension: distbrusharea
    hidden: true
    label: "Brush Area"
    sql: ${TABLE}.distbrusharea

  - dimension: donotadjustcompositerate
    hidden: true
    sql: ${TABLE}.donotadjustcompositerate

  - dimension: driverage
    hidden: true
    label: "Driver Age"
    sql: ${TABLE}.driverage

  - dimension: driverfirst
    hidden: true
    label: "Driver First Name"
    sql: ${TABLE}.driverfirst

  - dimension: drivergendercd
    hidden: true
    label: "Driver Gender"
    sql: ${TABLE}.drivergendercd

  - dimension: driverlast
    hidden: true
    label: "Driver Last Name"
    sql: ${TABLE}.driverlast

  - dimension: drivermi
    hidden: true
    label: "Driver Middle Initial"
    sql: ${TABLE}.drivermi

  - dimension: drivernumber
    hidden: true
    label: "Driver Number"
    sql: ${TABLE}.drivernumber

  - dimension_group: driverstartdt
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.driverstartdt

  - dimension: drvadddt
    hidden: true
    sql: ${TABLE}.drvadddt

  - dimension: drvage
    hidden: true
    sql: ${TABLE}.drvage

  - dimension: drvbusinessuse
    hidden: true
    sql: ${TABLE}.drvbusinessuse

  - dimension: drvfarmuse
    hidden: true
    sql: ${TABLE}.drvfarmuse

  - dimension: drvgender
    hidden: true
    sql: ${TABLE}.drvgender

  - dimension: drvmaritalstatus
    hidden: true
    sql: ${TABLE}.drvmaritalstatus

  - dimension: drvowner
    hidden: true
    sql: ${TABLE}.drvowner

  - dimension: drvpleasureuse
    hidden: true
    sql: ${TABLE}.drvpleasureuse

  - dimension: drvpointscharged
    hidden: true
    sql: ${TABLE}.drvpointscharged

  - dimension: drvprincipaloperator
    hidden: true
    sql: ${TABLE}.drvprincipaloperator

  - dimension: drvremovedt
    hidden: true
    sql: ${TABLE}.drvremovedt

  - dimension: drvworkuse
    hidden: true
    sql: ${TABLE}.drvworkuse

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

  - dimension: glaggregatelimit
    hidden: true
    sql: ${TABLE}.glaggregatelimit

  - dimension: gloccurrencelimit
    hidden: true
    sql: ${TABLE}.gloccurrencelimit

  - dimension: gooddriverind
    hidden: true
    sql: ${TABLE}.gooddriverind

  - dimension: increasedconstcost
    hidden: true
    sql: ${TABLE}.increasedconstcost

  - dimension: inflationguardpct
    hidden: true
    sql: ${TABLE}.inflationguardpct

  - dimension: inforcechangeamt
    hidden: true
    type: number
    sql: ${TABLE}.inforcechangeamt

  - dimension: insurancetypecd
    label: "Insurance Type"
    sql: ${TABLE}.insurancetypecd

  - dimension: layer1unmodifiedpremium
    hidden: true
    sql: ${TABLE}.layer1unmodifiedpremium

  - dimension: limit1
    label: "Limit 1"
    sql: ${TABLE}.limit1

  - dimension: limit2
    label: "Limit 2"
    sql: ${TABLE}.limit2

  - dimension: limit3
    label: "Limit 3"
    sql: ${TABLE}.limit3

  - dimension: limit4
    label: "Limit 4"
    sql: ${TABLE}.limit4

  - dimension: limit5
    label: "Limit 5"
    sql: ${TABLE}.limit5

  - dimension: limit6
    label: "Limit 6"
    sql: ${TABLE}.limit6

  - dimension: linecd
    label: "Line Code"
    sql: ${TABLE}.linecd

  - dimension: locationaddress1
    hidden: true
    sql: ${TABLE}.locationaddress1

  - dimension: locationaddress2
    hidden: true
    sql: ${TABLE}.locationaddress2

  - dimension: locationcity
    hidden: true
    sql: ${TABLE}.locationcity

  - dimension: locationcounty
    sql: ${TABLE}.locationcounty

  - dimension: locationnumber
    hidden: true
    sql: ${TABLE}.locationnumber

  - dimension: locationstate
    hidden: true
    sql: ${TABLE}.locationstate

  - dimension: locationzip
    hidden: true
    sql: ${TABLE}.locationzip
    
  - dimension: memberinsurer
    hidden: true
    label: "Member Insurer"
    sql: ${TABLE}.memberinsurer
    
  - dimension: memberinsurerpolnum
    hidden: true
    label: "Member Insured Policy Number"
    sql: ${TABLE}.memberinsuredpolicynumber
    
  - dimension: mitigationibhs
    hidden: true
    label: "Mitigation IBHS"
    sql: ${TABLE}.mitigationibhs

  - dimension: modelyr
    hidden: true
    sql: ${TABLE}.modelyr

  - dimension: newrenewalcd
    label: "New or Renewal"
    sql: ${TABLE}.newrenewalcd

  - dimension: occupancycd
    hidden: true
    sql: ${TABLE}.occupancycd
    
  - dimension: ordinanceorlaw
    hidden: true
    label: "Ordinance or Law"
    sql: ${TABLE}.ordinanceorlaw

  - dimension: ordinanceorlawind
    hidden: true
    sql: ${TABLE}.ordinanceorlawind

  - dimension: owneroccupiedunits
    hidden: true
    sql: ${TABLE}.owneroccupiedunits

  - dimension: payplancd
    label: "Pay Plan"
    sql: ${TABLE}.payplancd

  - dimension: performancecd
    hidden: true
    sql: ${TABLE}.performancecd
    
  - dimension: perspropreplcost
    hidden: true
    label: "Personal Property Replacement Cost"
    sql: ${TABLE}.personalpropreplacementcost

  - dimension: pointschargeable
    hidden: true
    type: number
    sql: ${TABLE}.pointschargeable

  - dimension: pointscharged
    hidden: true
    type: number
    sql: ${TABLE}.pointscharged

  - dimension: policyformcode
    label: "Policy Form"
    sql: ${TABLE}.policyformcode

  - dimension: policygroupcd
    hidden: true
    sql: ${TABLE}.policygroupcd
  
  - dimension: policyinceptiondt
    hidden: true
    label: "Policy Inception Date"
    sql: ${TABLE}.policyinceptiondt

  - dimension: policyinsuremailingzip
    hidden: true
    sql: ${TABLE}.policyinsuremailingzip

  - dimension: policymultipleriskcredit
    hidden: true
    sql: ${TABLE}.policymultipleriskcredit

  - dimension: policynumber
    label: "Policy Number"
    sql: ${TABLE}.policynumber

  - dimension: policyprogramcode
    hidden: true
    sql: ${TABLE}.policyprogramcode

  - dimension: policyref
    hidden: true
    type: number
    sql: ${TABLE}.policyref

  - dimension: policystatuscd
    hidden: true
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

  - dimension: previouscarriercd
    label: "Previous Carrier"
    sql: ${TABLE}.previouscarriercd

  - dimension: producercd
    label: "Producer Code"
    sql: ${TABLE}.producercd
  
  - dimension: productname
    hidden: true
    label: "Product Name"
    sql: ${TABLE}.productname
 
  - dimension: productversionidref
    hidden: true
    sql: ${TABLE}.productversionidref

  - dimension: protectionclass
    hidden: true
    sql: ${TABLE}.protectionclass

  - dimension: rateareaname
    label: "Rate Area Name"
    sql: ${TABLE}.rateareaname

  - dimension: ratingvalue
    hidden: true
    sql: ${TABLE}.ratingvalue

  - dimension: relationshiptoinsuredcd
    hidden: true
    sql: ${TABLE}.relationshiptoinsuredcd

  - dimension: riskcd
    label: "Risk Code"
    sql: ${TABLE}.riskcd
  
  - dimension: replaccostlosssettlementlimit
    hidden: true
    label: "Replacement Cost Loss Settlement Limit"
    sql: ${TABLE}.replaccostlosssettlementlimit

  - dimension: rpc125pct
    hidden: true
    sql: ${TABLE}.rpc125pct

  - dimension: seasonal
    hidden: true
    sql: ${TABLE}.seasonal

  - dimension: secondary
    hidden: true
    sql: ${TABLE}.secondary

  - dimension: shortratestatind
    hidden: true
    sql: ${TABLE}.shortratestatind
    
  - dimension: splcomputercoverage
    hidden: true
    label: "Special Computer Coverage"
    sql: ${TABLE}.specialcomputercoverage

  - dimension: sprinkleredbuildings
    hidden: true
    sql: ${TABLE}.sprinkleredbuildings

  - dimension: sqft
    hidden: true
    sql: ${TABLE}.sqft

  - dimension_group: startdt
    hidden: true
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
    hidden: true
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
    hidden: true
    sql: ${TABLE}.statuscd

  - dimension: stories
    hidden: true
    sql: ${TABLE}.stories

  - dimension: sublinecd
    hidden: true
    sql: ${TABLE}.sublinecd

  - dimension: subtypecd
    hidden: true
    sql: ${TABLE}.subtypecd

  - dimension: systemid
    hidden: true
    type: number
    sql: ${TABLE}.systemid

  - dimension: tenantoccupiedunits
    hidden: true
    sql: ${TABLE}.tenantoccupiedunits

  - dimension: termdays
    label: "Term Days"
    type: number
    sql: ${TABLE}.termdays

  - dimension: territorycd
    label: "Territory Code"
    sql: ${TABLE}.territorycd
    
  - dimension: theftcovincrease
    hidden: true
    label: "Theft Coverage Increase Limit"
    sql: ${TABLE}.theftcoverageincreaselimit

  - dimension: timeelement
    hidden: true
    label: "Time Element"
    sql: ${TABLE}.timeelement

  - dimension: tiv
    hidden: true
    sql: ${TABLE}.tiv
    
  - dimension: townhouserowhouseunits
    hidden: true
    label: "Townhouse/Row House"
    sql: ${TABLE}.townhouserowhouseunits

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

  - dimension: typeofstructure
    hidden: true
    sql: ${TABLE}.typeofstructure

  - dimension: underlyingtotalunmodifiedliabpremium
    hidden: true
    sql: ${TABLE}.underlyingtotalunmodifiedliabpremium
    
  - dimension: updateuser
    hidden: true
    label: "Update User"
    sql: ${TABLE}.updateuser

  - dimension: units
    hidden: true
    sql: ${TABLE}.units

  - dimension: vehadddt
    hidden: true
    sql: ${TABLE}.vehadddt

  - dimension: vehiclemanufacturer
    hidden: true
    sql: ${TABLE}.vehiclemanufacturer

  - dimension: vehiclemodel
    hidden: true
    sql: ${TABLE}.vehiclemodel

  - dimension: vehiclenumber
    hidden: true
    sql: ${TABLE}.vehiclenumber

  - dimension: vehicletype
    hidden: true
    sql: ${TABLE}.vehicletype

  - dimension: vehicleyear
    hidden: true
    sql: ${TABLE}.vehicleyear

  - dimension: vehidentificationnumber
    hidden: true
    sql: ${TABLE}.vehidentificationnumber

  - dimension: vehremovedt
    hidden: true
    sql: ${TABLE}.vehremovedt

  - dimension: vehtype
    hidden: true
    sql: ${TABLE}.vehtype

  - dimension: writtencommissionamt
    hidden: True
    type: number
    sql: ${TABLE}.writtencommissionamt

  - dimension: writtencommissionfeeamt
    hidden: True
    type: number
    sql: ${TABLE}.writtencommissionfeeamt

  - dimension: writtenpremiumamt
    hidden: True
    type: number
    sql: ${TABLE}.writtenpremiumamt

  - dimension: writtenpremiumfeeamt
    hidden: True
    type: number
    sql: ${TABLE}.writtenpremiumfeeamt

  - dimension: yearbuilt
    hidden: true
    sql: ${TABLE}.yearbuilt
    
    
 #############################################################  
 #-------------------------Measures--------------------------#  
 #############################################################
 
  - measure: inforcechange
    label: "In force Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${inforcechangeamt}
    
  - measure: inforcepremchange
    label: "In Force Premium Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${inforcechangeamt} 
    filters: 
     feecd:  "Null"  
    
  - measure: inforcechangefee
    label: "In Force Fee Change"
    value_format: "#,##0.00"
    type: sum
    sql: ${inforcechangeamt} 
    filters: 
     feecd:  "-Null"

  - measure: writtencommission
    label: "Written Commision"
    value_format: "#,##0.00"
    type: sum
    sql: ${writtencommissionamt}

  - measure: writtencommissionfee
    label: "Written Commision Fee"
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
    
  - measure: writtentotal
    label: "Written Premium & Fees"
    value_format: "#,##0.00"
    type: number
    sql: (${writtenpremium} + ${writtenpremiumfee})    

  - measure: count
    hidden: true
    type: count
    drill_fields: [id, rateareaname, conversionfilename, rateareaname, conversionfilename]