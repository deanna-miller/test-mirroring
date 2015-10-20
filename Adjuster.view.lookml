- view: adjuster
  derived_table:
    sql: |
      Select 
        sourcecd as adjustercd,
        commercialname as adjustername,
        bestaddr1 as address1,
        bestaddr2 as address2,
        bestcity as city,
        bestpostalcode as postalcode,
        beststateprovcd as state
      From masked_data.allcontacts
      Where  sourcetypecd  IN ('Examiner','Outside Adjuster') and contacttypecd = 'Provider'

  fields:
  - dimension: adjustercd
    label: "Adjuster Code"
    sql: ${TABLE}.adjustercd 
 
  - dimension: adjustername
    label: "Adjuster Name"
    sql: ${TABLE}.adjustername
      
  - dimension: address1
    label: "Address1"
    sql: ${TABLE}.address1
      
  - dimension: address2
    label: "Address2"
    sql: ${TABLE}.address2
       
  - dimension: postalcode
    label: "Postal Code"
    sql: ${TABLE}.postalcode 
      
  - dimension: state
    label: "State"
    sql: ${TABLE}.state