- explore: summary_template_policy
  extension: required
  
- explore: policy
  sql_always_where: record_type = 'Policy'
  joins:
   - join: policy_status_template
     sql_on: ${policy.reportpd} = ${policy_status_template.reportpd} and ${policy.policyref} = ${policy_status_template.policyref} 
     relationship: many_to_one

