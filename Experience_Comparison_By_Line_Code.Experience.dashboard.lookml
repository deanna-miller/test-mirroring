- dashboard: experience_comparison_by_line
  title: Experience Comparison By Line Code
  layout: grid
  show_applied_filters: true  

  rows:
    - elements: [writtenprembyaccountingyearbyline]
      height: 250
    
    - elements: [earnedpremiumbyaccountingyearbyline]
      height: 250

    - elements: [incurredlossbyaccountingyearbyline]
      height: 250




  elements:


  - name: writtenprembyaccountingyearbyline
    title: Written Premium By Accounting Year By Line Code
    type: table
    model: Experience
    explore: experience
    dimensions: [date.report_period_year,product.linecd]
    pivots: [product.linecd]
    measures: [policy.written_premium_mtd]
    sorts: [product.linecd, date.report_period__year]
    limit: 500
    column_limit: 50
    total: true
    row_total: right


  - name: earnedpremiumbyaccountingyearbyline
    title: Earned Premium By Accounting Year By Line Code
    type: table
    model: Experience
    explore: experience
    dimensions: [date.report_period_year,product.linecd]
    pivots: [product.linecd]
    measures: [policy.earned_premium_mtd]
    sorts: [product.linecd, date.report_period_year]
    limit: 500
    column_limit: 50
    total: true
    row_total: right


  - name: incurredlossbyaccountingyearbyline
    title: Incurred Loss By Accounting Year By Line Code
    type: table
    model: Experience
    explore: experience
    dimensions: [date.report_period_year,product.linecd]
    pivots: [product.linecd]
    measures: [claim.incurred_loss_mtd]
    sorts: [product.productname, date.report_period_year]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
       


  