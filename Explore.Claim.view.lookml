- explore: summary_template_claim
  extension: required
  
- explore: claim
  sql_always_where: record_type = 'Claims'
  joins:
   - join: claim_status_template
     sql_on: ${claim.reportpd} = ${claim_status_template.reportpd} and ${claim.claimnumber} = ${claim_status_template.claim_number} and ${claim.claimantcd} = ${claim_status_template.claimantcode} and ${claim.featurecd} = ${claim_status_template.featurecode}
     relationship: many_to_one
   - join: adjuster
     sql_on: ${claim_status_template.adjuster_code} = ${adjuster.adjustercd}  
     relationship: many_to_one
     
