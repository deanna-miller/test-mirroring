- view: transaction_template_policy_detail_status
  derived_table:
   sql: |
     Select ps1.id 
       ,ps1.policyref
       ,ps2.accountingdt
       ,ps2.transactioneffectivedt
       ,ps2.deductibletype
       ,Case When transactioncd = 'Cancellation' Then 'Yes' Else 'No' End as cancelissued
       ,Case When transactioncd = 'Cancellation' Then transactioneffectivedt Else Null End as canceldate
       ,Case When transactioncd = 'Reinstatement' Then 'Yes' Else 'No' End as reinstateissued
       ,Case When transactioncd = 'Reinstatement' Then transactioneffectivedt Else Null End as reinstatedate
     from (Select max(systemid) as id, policyref
           from dw.policystats
           where feecd <> 'CRCTax' OR feecd IS NULL
           group by policyref) as ps1
     Left Join dw.policystats ps2 On 
        ps1.id = ps2.systemid     
     WHERE {% condition policy_status_update_date %}transactioneffectivedt {% endcondition %}
          

  fields:
  #   Dimension
  - dimension: accountingdt
    hidden: true
    sql: ${TABLE}.accountingdt
    
  - dimension: canceldate
    label: "Cancel Date"
    type: string
    sql: ${TABLE}.canceldate
    
  - dimension: cancelissued
    hidden: true
    type: string
    sql: ${TABLE}.cancelissued
    
  - dimension: deductibletype
    hidden: true
    sql: ${policy_details.deductibletype}
    
  - dimension: id
    hidden: true
    sql: ${TABLE}.id