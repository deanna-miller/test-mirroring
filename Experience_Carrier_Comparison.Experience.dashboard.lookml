- dashboard: experience_Carrier_Comparison
  title: Experience Carrier Comparison
  layout: grid
  show_applied_filters: true  


  rows:
    - elements: [add_a_unique_name_1457624956748]
      height: 350
    
    - elements: [add_a_unique_name_1457625165554]
      height: 500




#  filters:

  elements:
 
  - name: add_a_unique_name_1457624956748
    title: Carrier Experience Comparison By Line
    type: table
    model: Experience
    explore: experience
    dimensions: [organization.carriercd, product.linecd]
    pivots: [organization.carriercd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd,
      policy.written_premium_ytd]
    filters:
      date.report_period_month: this month
    sorts: [policy.earned_premium_ytd desc 1, organization.carriercd]
    limit: 500
    column_limit: 50
    total: true

  - name: add_a_unique_name_1457625165554
    title: Carrier Experience Comparison By Line & Annual Statement Line
    type: table
    model: Experience
    explore: experience
    dimensions: [organization.carriercd, product.linecd, product.annualstatementlinecd]
    pivots: [organization.carriercd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd,
      policy.written_premium_ytd]
    filters:
      date.report_period_month: this month
    sorts: [policy.earned_premium_ytd desc 1, organization.carriercd]
    limit: 500
    column_limit: 50
    total: true

    
