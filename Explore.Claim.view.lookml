- explore: summary_template_claim
  extension: required
  
- explore: claim
  sql_always_where: record_type = 'Claims'
  joins:
   - join: claim_status
     sql_on: ${date.report_period_raw} = ${claim_status.report_period_raw} and ${claim.claimnumber} = ${claim_status.claim_number} and ${claim.claimantcd} = ${claim_status.claimantcode} and ${claim.featurecd} = ${claim_status.featurecode}
     relationship: many_to_one
   - join: adjuster
     sql_on: ${claim_status.adjuster_code} = ${adjuster.adjustercd}  
     relationship: many_to_one
     