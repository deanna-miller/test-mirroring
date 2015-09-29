- view: policy_transactions
  sql_table_name: source_data.policystats
  fields:

  - dimension: id
    hidden: true
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

  - dimension: ageofhome
    hidden: true
    label: "Age of Home"
    sql: ${TABLE}.ageofhome

  - dimension: annualstatementlinecd
    label: "Annual Statement Line Code"
    sql: ${TABLE}.annualstatementlinecd

  - dimension: areasofcoverage
    label: "Areas of Coverage"
    sql: ${TABLE}.areasofcoverage

  - dimension: assigneddriver
    hidden: true
    label: "Assigned Driver"
    sql: ${TABLE}.assigneddriver

  - dimension: bodytype
    hidden: true
    label: "Body Type"
    sql: ${TABLE}.bodytype

  - dimension_group: bookdt
    label: "Book"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.bookdt

  - dimension: buildinglimit
    label: "Building Limit"
    sql: ${TABLE}.buildinglimit

  - dimension: businessclass
    label: "Business Class"
    sql: ${TABLE}.businessclass

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
    label: "Commission Area Code"
    sql: ${TABLE}.commissionareacd

  - dimension: commissionkey
    label: "Commission Key"
    sql: ${TABLE}.commissionkey

  - dimension: companycd
    label: "Company Code"
    sql: ${TABLE}.companycd


  - dimension: compositeadjustment
    label: "Composite Adjustment"
    sql: ${TABLE}.compositeadjustment

  - dimension: constructioncd
    label: "Construction Code"
    sql: ${TABLE}.constructioncd

  - dimension: contentslimit
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

  - dimension: coveredperilscd
    label: "Covered Perils"
    sql: ${TABLE}.coveredperilscd

  - dimension: customerref
    label: "Customer Ref"
    type: int
    sql: ${TABLE}.customerref

  - dimension: deductible1
    label: "Deductible1"
    sql: ${TABLE}.deductible1

  - dimension: deductible2
    label: "Deductible2"
    sql: ${TABLE}.deductible2

  - dimension: defensivedriverind
    label: "Defensive Driver"
    sql: ${TABLE}.defensivedriverind

  - dimension: distbrusharea
    label: "Brush Area"
    sql: ${TABLE}.distbrusharea

  - dimension: donotadjustcompositerate
    hidden: true
    sql: ${TABLE}.donotadjustcompositerate

  - dimension: driverage
    label: "Driver Age"
    sql: ${TABLE}.driverage

  - dimension: driverfirst
    label: "Driver First Name"
    sql: ${TABLE}.driverfirst

  - dimension: drivergendercd
    label: "Driver Gender"
    sql: ${TABLE}.drivergendercd

  - dimension: driverlast
    label: "Driver Last Name"
    sql: ${TABLE}.driverlast

  - dimension: drivermi
    label: "Driver Middle Initial"
    sql: ${TABLE}.drivermi

  - dimension: drivernumber
    label: "Driver Number"
    sql: ${TABLE}.drivernumber



  - dimension_group: driverstartdt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.driverstartdt



  - dimension: drvadddt
    sql: ${TABLE}.drvadddt

 

  - dimension: drvage
    sql: ${TABLE}.drvage



  - dimension: drvbusinessuse
    sql: ${TABLE}.drvbusinessuse


  - dimension: drvfarmuse
    sql: ${TABLE}.drvfarmuse



  - dimension: drvgender
    sql: ${TABLE}.drvgender



  - dimension: drvmaritalstatus
    sql: ${TABLE}.drvmaritalstatus



  - dimension: drvowner
    sql: ${TABLE}.drvowner

 

  - dimension: drvpleasureuse
    sql: ${TABLE}.drvpleasureuse



  - dimension: drvpointscharged
    sql: ${TABLE}.drvpointscharged



  - dimension: drvprincipaloperator
    sql: ${TABLE}.drvprincipaloperator



  - dimension: drvremovedt
    sql: ${TABLE}.drvremovedt

 

  - dimension: drvworkuse
    sql: ${TABLE}.drvworkuse

 
  - dimension: earndays
    type: int
    sql: ${TABLE}.earndays



  - dimension_group: effectivedt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effectivedt



  - dimension_group: enddt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.enddt



  - dimension_group: expirationdt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expirationdt


  - dimension: feecd
    sql: ${TABLE}.feecd



  - dimension: glaggregatelimit
    sql: ${TABLE}.glaggregatelimit


  - dimension: gloccurrencelimit
    sql: ${TABLE}.gloccurrencelimit



  - dimension: gooddriverind
    sql: ${TABLE}.gooddriverind



  - dimension: increasedconstcost
    sql: ${TABLE}.increasedconstcost



  - dimension: inflationguardpct
    sql: ${TABLE}.inflationguardpct



  - dimension: inforcechangeamt
    hidden: true
    type: number
    sql: ${TABLE}.inforcechangeamt



  - dimension: insurancetypecd
    sql: ${TABLE}.insurancetypecd



  - dimension: layer1unmodifiedpremium
    sql: ${TABLE}.layer1unmodifiedpremium


  - dimension: limit1
    sql: ${TABLE}.limit1



  - dimension: limit2
    sql: ${TABLE}.limit2

 

  - dimension: limit3
    sql: ${TABLE}.limit3


  - dimension: limit4
    sql: ${TABLE}.limit4

  

  - dimension: limit5
    sql: ${TABLE}.limit5



  - dimension: limit6
    sql: ${TABLE}.limit6



  - dimension: linecd
    sql: ${TABLE}.linecd



  - dimension: locationaddress1
    sql: ${TABLE}.locationaddress1



  - dimension: locationaddress2
    sql: ${TABLE}.locationaddress2



  - dimension: locationcity
    sql: ${TABLE}.locationcity



  - dimension: locationcounty
    sql: ${TABLE}.locationcounty



  - dimension: locationnumber
    sql: ${TABLE}.locationnumber



  - dimension: locationstate
    sql: ${TABLE}.locationstate



  - dimension: locationzip
    sql: ${TABLE}.locationzip

 

  - dimension: modelyr
    sql: ${TABLE}.modelyr



  - dimension: newrenewalcd
    sql: ${TABLE}.newrenewalcd

 

  - dimension: occupancycd
    sql: ${TABLE}.occupancycd



  - dimension: ordinanceorlawind
    sql: ${TABLE}.ordinanceorlawind



  - dimension: owneroccupiedunits
    sql: ${TABLE}.owneroccupiedunits

  

  - dimension: payplancd
    sql: ${TABLE}.payplancd

 

  - dimension: performancecd
    sql: ${TABLE}.performancecd



  - dimension: pointschargeable
    type: int
    sql: ${TABLE}.pointschargeable



  - dimension: pointscharged
    type: int
    sql: ${TABLE}.pointscharged



  - dimension: policyformcode
    sql: ${TABLE}.policyformcode



  - dimension: policygroupcd
    sql: ${TABLE}.policygroupcd



  - dimension: policyinsuremailingzip
    sql: ${TABLE}.policyinsuremailingzip



  - dimension: policymultipleriskcredit
    sql: ${TABLE}.policymultipleriskcredit



  - dimension: policynumber
    sql: ${TABLE}.policynumber



  - dimension: policyprogramcode
    sql: ${TABLE}.policyprogramcode

 

  - dimension: policyref
    type: int
    sql: ${TABLE}.policyref



  - dimension: policystatuscd
    sql: ${TABLE}.policystatuscd



  - dimension: policytypecd
    sql: ${TABLE}.policytypecd



  - dimension: policyversion
    sql: ${TABLE}.policyversion



  - dimension: policyyear
    sql: ${TABLE}.policyyear



  - dimension: postalcode
    sql: ${TABLE}.postalcode


  - dimension: previouscarriercd
    sql: ${TABLE}.previouscarriercd



  - dimension: producercd
    sql: ${TABLE}.producercd

 
  - dimension: productversionidref
    sql: ${TABLE}.productversionidref


  - dimension: protectionclass
    sql: ${TABLE}.protectionclass

 

  - dimension: rateareaname
    sql: ${TABLE}.rateareaname

 

  - dimension: ratingvalue
    sql: ${TABLE}.ratingvalue



  - dimension: relationshiptoinsuredcd
    sql: ${TABLE}.relationshiptoinsuredcd



  - dimension: riskcd
    sql: ${TABLE}.riskcd



  - dimension: rpc125pct
    sql: ${TABLE}.rpc125pct



  - dimension: seasonal
    sql: ${TABLE}.seasonal



  - dimension: secondary
    sql: ${TABLE}.secondary



  - dimension: shortratestatind
    sql: ${TABLE}.shortratestatind



  - dimension: sprinkleredbuildings
    sql: ${TABLE}.sprinkleredbuildings



  - dimension: sqft
    sql: ${TABLE}.sqft



  - dimension_group: startdt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.startdt



  - dimension: statdata
    sql: ${TABLE}.statdata


  - dimension: statecd
    sql: ${TABLE}.statecd



  - dimension: statementaccountnumber
    sql: ${TABLE}.statementaccountnumber



  - dimension: statementaccountref
    type: int
    sql: ${TABLE}.statementaccountref

 

  - dimension: statsequence
    type: int
    sql: ${TABLE}.statsequence



  - dimension: statsequencereplace
    type: int
    sql: ${TABLE}.statsequencereplace



  - dimension: statuscd
    sql: ${TABLE}.statuscd



  - dimension: stories
    sql: ${TABLE}.stories



  - dimension: sublinecd
    sql: ${TABLE}.sublinecd

 

  - dimension: subtypecd
    sql: ${TABLE}.subtypecd



  - dimension: systemid
    type: int
    sql: ${TABLE}.systemid



  - dimension: tenantoccupiedunits
    sql: ${TABLE}.tenantoccupiedunits



  - dimension: termdays
    type: int
    sql: ${TABLE}.termdays



  - dimension: territorycd
    sql: ${TABLE}.territorycd


  - dimension: timeelement
    sql: ${TABLE}.timeelement

 
  - dimension: tiv
    sql: ${TABLE}.tiv

  

  - dimension: transactioncd
    sql: ${TABLE}.transactioncd



  - dimension_group: transactioneffectivedt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transactioneffectivedt



  - dimension: transactionnumber
    type: int
    sql: ${TABLE}.transactionnumber


  - dimension: typeofstructure
    sql: ${TABLE}.typeofstructure


  - dimension: underlyingtotalunmodifiedliabpremium
    sql: ${TABLE}.underlyingtotalunmodifiedliabpremium


  - dimension: units
    sql: ${TABLE}.units


  - dimension: vehadddt
    sql: ${TABLE}.vehadddt



  - dimension: vehiclemanufacturer
    sql: ${TABLE}.vehiclemanufacturer

  

  - dimension: vehiclemodel
    sql: ${TABLE}.vehiclemodel



  - dimension: vehiclenumber
    sql: ${TABLE}.vehiclenumber

 

  - dimension: vehicletype
    sql: ${TABLE}.vehicletype


  - dimension: vehicleyear
    sql: ${TABLE}.vehicleyear



  - dimension: vehidentificationnumber
    sql: ${TABLE}.vehidentificationnumber



  - dimension: vehremovedt
    sql: ${TABLE}.vehremovedt



  - dimension: vehtype
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
    sql: ${TABLE}.yearbuilt
    
    
 #############################################################  
 #-------------------------Measures--------------------------#  
 #############################################################
 
  - measure: inforcechange
    label: "In force Change"
    type: sum
    sql: ${inforcechangeamt}
    
  - measure: inforcepremchange
    label: "In Force Premium Change"
    type: sum
    sql: ${inforcechangeamt} 
    filters: 
     feecd:  "Null"  
    
  - measure: inforcechangefee
    label: "In Force Fee Change"
    type: sum
    sql: ${inforcechangeamt} 
    filters: 
     feecd:  "-Null"


  - measure: writtencommission
    label: "Written Commision"
    type: sum
    sql: ${writtencommissionamt}

  - measure: writtencommissionfee
    label: "Written Commision Fee"
    type: sum
    sql: ${writtencommissionfeeamt}

  - measure: writtenpremium
    label: "Written Premium"
    type: sum
    sql: ${writtenpremiumamt}
    value_format: '$0.00'

  - measure: writtenpremiumfee
    label: "Written Premium Fee"
    type: sum
    sql: ${writtenpremiumfeeamt}
    value_format: '$0.00'
    
  - measure: writtentotal
    label: "Written Total"
    type: number
    sql: (${writtenpremium} + ${writtenpremiumfee})    

  - measure: count
    type: count
    drill_fields: [id, rateareaname, conversionfilename, rateareaname, conversionfilename]

