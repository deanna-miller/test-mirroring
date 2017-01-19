- explore: summary_experience
  extension: required
  
- explore: experience
 
  joins:
   
   - join: policy_status_template
     sql_on: ${experience.report_period_raw} = ${policy_status_template.report_period_raw} and ${experience.policyref} = ${policy_status_template.policyref} 
     relationship: many_to_one
   - join: claim_status_template
     sql_on: ${experience.report_period_raw} = ${claim_status_template.report_period_raw} and ${experience.claimnumber} = ${claim_status_template.claim_number} and ${experience.claimantcd} = ${claim_status_template.claimantcode} and ${experience.featurecd} = ${claim_status_template.featurecode}
     relationship: many_to_one


