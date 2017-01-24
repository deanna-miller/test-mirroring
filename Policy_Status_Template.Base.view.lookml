- view: policy_status_template
  #sql_table_name: insight.policy_status
  derived_table:
    sql: |
      Select       
        pss1.reportperiod as reportpd,
        to_date(pss1.reportperiod,'YYYYMM') as reportperiod,
        pss1.policyref as policyref,
        pss2.inforcemonthend,
        pss2.inforceinmonth,
        case 
          when pss3.issuedinmonth = 'Yes' then 'Yes' 
          else 'No' 
        end as issuedinmonth,
        stats.cancelissued,
        stats.canceldate,
        stats.canceleffective,
        stats.reinstateissued,
        stats.reinstatedate,
        stats.reinstateeffective
        From (Select reportperiod,policyref
             From  dw.policysummarystats
             Where statuscd = 'Active'
        Group by reportperiod,policyref
        ) pss1 
        Left Join
        (
               Select reportperiod, policyref, 
               Case When Sum(unearnedamt) > 0 Then 'Yes'
                   Else 'No'
               End As inforcemonthend,
               Case When Sum(mtdearnedpremiumamt) > 0 Then 'Yes'
                   Else 'No'
               End As inforceinmonth
              from  dw.policysummarystats     
              Group By reportperiod,policyref
        ) pss2
        On pss1.reportperiod = pss2.reportperiod and pss1.policyref = pss2.policyref
        Left Join
        (
              Select policyref, min(reportperiod) as reportperiod, 'Yes' as issuedinmonth
              from  dw.policysummarystats
              where statuscd = 'Active'
              group by policyref
        ) pss3
        On pss1.reportperiod = pss3.reportperiod and pss1.policyref = pss3.policyref
        Left Join
        (
              Select ps1.reportperiod, ps1.policyref, 
              Case When transactioncd = 'Cancellation' Then 'Yes' Else 'No' End as cancelissued,
              Case When transactioncd = 'Cancellation' Then transactioneffectivedt Else Null End as canceldate,
              Case When transactioncd = 'Cancellation' and 
                   (Cast(Datepart(Year,transactioneffectivedt) As varchar) + Right('00'+ Cast(Datepart(Month,transactioneffectivedt) As varChar), 2)) = ps1.reportperiod 
              Then 'Yes' Else 'No' End as canceleffective,
              Case When transactioncd = 'Reinstatement' Then 'Yes' Else 'No' End as reinstateissued,
              Case When transactioncd = 'Reinstatement' and 
                   (Cast(Datepart(Year,transactioneffectivedt) As varchar) + Right('00'+ Cast(Datepart(Month,transactioneffectivedt) As varChar), 2)) = ps1.reportperiod 
              Then 'Yes' Else 'No' End as reinstateeffective,
              Case When transactioncd = 'Reinstatement' Then transactioneffectivedt Else Null End as reinstatedate
          From
          (
              Select max(systemid) as id , policyref, cast(datepart(year,accountingdt) as varchar)||right('00'||cast(datepart(month,accountingdt) as varchar),2) as reportperiod
              from  dw.policystats
              group by policyref, cast(datepart(year,accountingdt) as varchar)||right('00'||cast(datepart(month,accountingdt) as varchar),2) 
          ) ps1
         Left Join
           dw.policystats ps2
          On ps1.id = ps2.systemid
          ) stats
          On pss1.reportperiod = stats.reportperiod and pss1.policyref = stats.policyref
  
  
  fields:

 
    #########################################################################
    #Dimensions which are attributes/no measures, should all contain a label#
    #########################################################################  
  
  - dimension: accountingdtinmonth
    label: "Accounting Date in Month"
    type: string
    sql: | 
       Case When (Cast(Datepart(Year,${date.accountingdt_raw}) As varchar) + Right('00'+ Cast(Datepart(Month,${date.accountingdt_raw}) As varChar), 2)) = ${reportpd} Then 'Yes'
       Else 'No'
       End 
       
  - dimension: canceldate
    label: "Cancel Date"
    type: date
    sql: ${TABLE}.canceldate
    
  - dimension: canceleffective
    label: "Cancel Effective"
    type: string
    sql: ${TABLE}.canceleffective

  - dimension: canceleffectivedtinmonth
    label: "Cancel Effective Date in Month"
    type: string
    sql: | 
        Case When (Cast(Datepart(Year,${canceldate}) As varchar) + Right('00'+ Cast(Datepart(Month,${canceldate}) As varChar), 2)) = ${reportpd} Then 'Yes'
             Else 'No'
             End  
    
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
    
  - dimension: reinstateeffectivedtinmonth
    label: "Reinstate Effective Date in Month"
    type: string
    sql: | 
        Case When (Cast(Datepart(Year,${TABLE}.reinstatedate) As varchar) + Right('00'+ Cast(Datepart(Month,${TABLE}.reinstatedate) As varChar), 2)) = ${report_period_month} Then 'Yes'
             Else 'No'
             End 

  - dimension: reinstateissued
    label: "Reinstate Issued"
    type: string
    sql: ${TABLE}.reinstateissued

  - dimension: reportpd
    hidden: true
    type: string
    sql: ${TABLE}.reportpd
    
  - dimension_group: report_period
    hidden: true
    type: time
    timeframes: [year, month, raw]
    sql: ${TABLE}.reportperiod

  ######################################
  #Measures, should all contain a label#
  ######################################

  - measure: average_new_premium
    view_label: "Policy Premium"
    label: "Average New Premium"
    type: number
    value_format: "#,##0.00" 
    sql: ((1.0*(${policy.effective_new_premium}))/Nullif(${effective_new_business_policy_count},0))

  - measure: average_renewal_premium
    view_label: "Policy Premium"
    label: "Average Renewal Premium"
    type: number
    value_format: "#,##0.00"
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
    label: "Effective Renewal Policy Count"
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
    label: "Expired Policy Count"
    type: count_distinct
    sql: ${policyref} 
    filters:
     policy.expirationdtinmonth: 'Yes'  

  - measure: inforce_new_policy_count
    view_label: 'Policy Counts'
    label: 'Inforce New Policy Count'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'
     policy.newrenewalcd: 'New'   

  - measure: inforce_policy_count
    view_label: 'Policy Counts'
    label: 'Inforce Policy Count'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'

  - measure: inforce_renewal_policy_count
    view_label: 'Policy Counts'
    label: 'Inforce Renewal Policy Count'
    type: count_distinct
    sql: ${policyref} 
    filters:
     inforcemonthend: 'Yes'
     policy.newrenewalcd: 'Renewal'

  - measure: issued_new_policy_count
    view_label: 'Policy Counts'
    label: 'Issued New Policy Count'
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
     reinstateeffectivedtinmonth: 'Yes'   

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