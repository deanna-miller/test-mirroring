- view: adjuster
  derived_table:
    sql: |
      Select 
        sourcecd as adjustercd,
        commercialname as adjustername,
        primaryphonenumber,
        bestaddr1 as address1,
        bestaddr2 as address2,
        bestcity as city,
        bestpostalcode as postalcode,
        beststateprovcd as state
      From masked_data.allcontacts
      Where  sourcetypecd  IN ('Examiner','Outside Adjuster', 'Adjuster','Apraiser') and contacttypecd = 'Provider'

  fields:
  
  - dimension: address1
    label: "Address1"
    sql: ${TABLE}.address1
      
  - dimension: address2
    label: "Address2"
    sql: ${TABLE}.address2
    
  - dimension: adjustercd
    label: "Adjuster Code"
    sql: ${TABLE}.adjustercd 
 
  - dimension: adjustername
    label: "Adjuster Name"
    sql: ${TABLE}.adjustername
       
  - dimension: postalcode
    label: "Postal Code"
    sql: ${TABLE}.postalcode 
  
  - dimension: primaryphonenumber
    label: "Primary Phone Number"
    sql: ${TABLE}.primaryphonenumber
      
  - dimension: state
    label: "State"
    sql: ${TABLE}.state