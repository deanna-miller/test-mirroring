- explore: summary_template_policy
  extension: required
  
- explore: policy
  sql_always_where: record_type = 'Policy'
  joins:
   - join: policy_status
     sql_on: ${date.report_period_raw} = ${policy_status.report_period_raw} and ${policy.policyref} = ${policy_status.policyref} 
     relationship: many_to_one


