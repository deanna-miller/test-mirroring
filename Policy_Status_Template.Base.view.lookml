- view: policy_status_template
  sql_table_name: insight.policy_status
  fields:

  ###########################################
    # Dimensions for Measures should be hidden#
  ###########################################
    
  - dimension: accountingdt
    hidden: true
    type: date
    sql: ${date.accountingdt_date}
    
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################  
  
  - dimension: accountingdtinmonth
    label: "Accounting Date in Month"
    type: string
    sql: | 
       Case When (Cast(Datepart(Year,${accountingdt}) As varchar) + Right('00'+ Cast(Datepart(Month,${accountingdt}) As varChar), 2)) = ${reportpd} Then 'Yes'
       Else 'No'
       End 
       
  - dimension: canceldate
    label: "Cancel Date"
    type: date
    sql: ${TABLE}.canceldate
    
  - dimension: canceleffectivedtinmonth
    label: "Cancel Effective Date in Month"
    type: string
    sql: | 
        Case When (Cast(Datepart(Year,${canceldate}) As varchar) + Right('00'+ Cast(Datepart(Month,${canceldate}) As varChar), 2)) = ${reportpd} Then 'Yes'
             Else 'No'
             End    
    
  - dimension: canceleffective
    label: "Cancel Effective"
    type: string
    sql: ${TABLE}.canceleffective

  - dimension: cancelissued
    label: "Cancel Issued"
    type: string
    sql: ${TABLE}.cancelissued

  - dimension: inforceinmonth
    label: "Inforce in Month"
    type: string
    sql: ${TABLE}.inforceinmonth

  - dimension: inforcemonthend
    label: "Inforce Month End"
    type: string
    sql: ${TABLE}.inforcemonthend

  - dimension: issuedinmonth
    label: "Issued in Month"
    type: string
    sql: ${TABLE}.issuedinmonth

  - dimension: policyref
    label: "Policy Reference"
    type: number
    sql: ${TABLE}.policyref

  - dimension: reinstatedate
    label: "Reinstate Date"
    type: date
    sql: ${TABLE}.reinstatedate

  - dimension: reinstateeffective
    label: "Reinstate Effective"
    type: string
    sql: ${TABLE}.reinstateeffective

  - dimension: reinstateissued
    label: "Reinstate Issued"
    type: string
    sql: ${TABLE}.reinstateissued

  - dimension: reportpd
    hidden: true
    type: string
    sql: ${TABLE}.reportpd
    
  ######################################
  #Measures, should all contain a label#
  ######################################
    
  - measure: average_new_premium
    label: "Average New Premium"
    type: number
    sql: ((1.0*(${policy.effective_new_premium}))/Nullif(${effective_new_business_policy_count},0))
    
  - measure: average_renewal_premium
    label: "Average Renewal Premium"
    type: number
    sql: ((1.0*(${policy.effective_renewal_premium}))/Nullif(${effective_renewal_policy_count},0))
    
  - measure: cancellation_effective_count
    view_label: 'Policy Counts'
    label: "Cancellation Effective Count"
    type: count_distinct
    sql: ${policyref} 
    filters:    
     canceleffectivedtinmonth: 'Yes'
     
  - measure: cancellation_issued_count
    view_label: 'Policy Counts'
    label: "Cancellation Issued Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     cancelissued: 'Yes' 
   
  - measure: distinct_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
  
  - measure: effective_new_business_policy_count
    view_label: 'Policy Counts'
    label: "Effective New Business Policy Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     policy.effectivedtinmonth: 'Yes' 
     policy.newrenewalcd: 'New'
     inforcemonthend: 'Yes' 
  
  - measure: effective_policy_count
    view_label: 'Policy Counts'
    label: "Effective Policy Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     policy.effectivedtinmonth: 'Yes'  
     inforcemonthend: 'Yes'   
     
  - measure: effective_renewal_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     policy.effectivedtinmonth: 'Yes' 
     policy.newrenewalcd: 'Renewal'
     inforcemonthend: 'Yes'  
     
  - measure: endorsement_issued_count
    view_label: 'Policy Counts'
    label: "Endorsement Issued Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     accountingdtinmonth: 'Yes'  
     policy.transactioncd: 'Endorsement'
     
  - measure: expired_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     policy.expirationdtinmonth: 'Yes'  
  
  - measure: inforce_new_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'
     policy.newrenewalcd: 'New'     
  
  - measure: inforce_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'
     
  - measure: inforce_renewal_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'
     policy.newrenewalcd: 'Renewal'
     
  - measure: issued_new_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     issuedinmonth: 'Yes' 
     policy.newrenewalcd: 'New'
     
  - measure: issued_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     issuedinmonth: 'Yes' 
    
  - measure: issued_renewal_policy_count
    view_label: 'Policy Counts'
    type: count_distinct
    sql: ${policyref} 
    filters:
     issuedinmonth: 'Yes' 
     policy.newrenewalcd: 'Renewal'      
      
  - measure: non_renewal_issued_count
    view_label: 'Policy Counts'
    label: "NonRenewal Issued Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     accountingdtinmonth: 'Yes'  
     policy.transactioncd: 'Non-Renewal' 

  - measure: policy_retention
    label: "Policy Retention"
    type: number
    sql: ((1.0*(${effective_renewal_policy_count}))/Nullif(${expired_policy_count},0))
    value_format: '0.00%'
     
  - measure: reinstate_effective_count
    view_label: 'Policy Counts'
    label: "Reinstate Effective Count"
    type: count_distinct
    sql: ${policyref} 
    filters:    
     policy.reinstateeffectivedtinmonth: 'Yes'   
     
  - measure: reinstate_issued_count
    view_label: 'Policy Counts'
    label: "Reinstate Issued Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     reinstateissued: 'Yes'     
     
  - measure: count
    hidden: true
    type: count
    drill_fields: detail*


