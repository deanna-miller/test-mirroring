- view: summary_template_experience
  extends: [claim, policy]


  fields:
   - measure: experience.incurred_loss_ratio_mtd
     label: "Incurred Loss Ratio MTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.incurred_loss_mtd}/NULLIF(${policy.earned_premium_mtd},0))
     value_format: '0.00%'
  
   - measure: experience.incurred_loss_ratio_ytd
     label: "Incurred Loss Ratio YTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.incurred_loss_ytd}/NULLIF(${policy.earned_premium_ytd},0))
     value_format: '0.00%'
     
   - measure: experience.paid_to_incurred_ratio_mtd
     label: "Paid to Incurred Ratio MTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.paid_loss_mtd}/NULLIF(${claim.incurred_loss_mtd},0))
     value_format: '0.00%'
     
   - measure: experience.paid_to_incurred_ratio_ytd
     label: "Paid to Incurred Ratio YTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.paid_loss_ytd}/NULLIF(${claim.incurred_loss_ytd},0))
     value_format: '0.00%'
     
   - measure: experience.paid_loss_ratio_mtd
     label: "Paid Loss Ratio MTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.paid_loss_mtd}/NULLIF(${policy.earned_premium_mtd},0))
     value_format: '0.00%'
  
   - measure: experience.paid_loss_ratio_ytd
     label: "Paid Loss Ratio YTD"
     value_format: "#,##0.00"
     type: number
     sql: (${claim.paid_loss_ytd}/NULLIF(${policy.earned_premium_ytd},0))
     value_format: '0.00%'
     
