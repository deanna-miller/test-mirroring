- view: transaction_template_claims_detail_status

- view: transaction_template_claims_detail_status
  derived_table:
   sql: |
     Select t1.updatedt 
     , st4.claimnumber As "claimnumber"
     , st4.claimstatuscd As "status"
     , st4.losscausecd
     , Case When Left(st4.claimstatuscd,6) = 'Closed' then updatedt else Null End As "closeddate"
     , Case When Left(st4.claimstatuscd,6) = 'Reopen' then updatedt else Null End As "reopendate"
     , t1.id
     , st4.systemid 
     From 
        (Select Max(st1.systemid) As id
         , Max(st1.bookdt) As updatedt
         , st1.claimnumber
         From dw.claimstats st1
         Group By st1.claimnumber
         Having Max(st1.systemid)) t1   
     Left Join dw.claimstats st4 On 
      t1.id = st4.systemid  
     Where {% condition Claim_Status_Update_Date %}updatedt {% endcondition %}

  fields:
  #   Dimension
    
  - dimension: claimnumber
    hidden: true
    sql: ${TABLE}.claimnumber
    
  - dimension: systemid
    hidden: true
    sql: ${TABLE}.systemid
    
  - dimension: updatedt
    hidden: true
    label: "Claim_Status_Update_Date"
    sql: ${TABLE}.updatedt
    
  - dimension: closeddate
    label: "Closed Date"
    sql: ${TABLE}.closeddate
    
  - dimension: reopendate
    label: "Reopen Date"