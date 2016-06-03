- dashboard: ytd_loss_composition_by_product
  title: YTD Loss Composition By Product 
  layout: grid
  show_applied_filters: true  

  rows:
    - elements: [incurredlossbypolicyyearbyproduct]
      height: 275
    
    - elements: [incurredlossbyaccidentyearbyproduct]
      height: 275

    - elements: [paidlosstriangle,incurredlosstriangle]
      height: 300

  filters:
  - name: reportperiodmonth
    title: 'Report Period Month'
    type: date_filter 
    explore: experience
    field: date.report_period_month
    default_value: 'this month'
    
  - name: product
    title: 'Product Name'
    type: field_filter 
    explore: experience
    field: product.productname
    default_value: ' '
    

    

  elements:


  - name: incurredlossbypolicyyearbyproduct
    listen:
      reportperiodmonth: date.report_period_month
    title: Incurred Loss By Policy Year By Product
    type: table
    model: Experience
    explore: experience
    dimensions: [policy.policyyear,product.productname]
    pivots: [product.productname]
    measures: [claim.incurred_loss_ytd]
    sorts: [product.productname, policy.policyyear]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
  
  
  - name: incurredlossbyaccidentyearbyproduct
    listen:
      reportperiodmonth: date.report_period_month
    title: Incurred Loss By Accident Year By Product
    type: table
    model: Experience
    explore: experience
    dimensions: [claim.lossyear, product.productname]
    pivots: [product.productname]
    measures: [claim.incurred_loss_ytd]
    filters:
      claim.lossyear: -NULL
    sorts: [claim.lossyear, product.productname]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    
  - name: paidlosstriangle
    listen:
      product: product.productname
    title: Paid Loss By Accident Year By Accounting Year
    type: table
    model: Experience
    explore: experience
    dimensions: [claim.lossyear, date.report_period_year]
    pivots: [date.report_period_year]
    measures: [claim.paid_loss_mtd]
    filters:
      claim.lossyear: -NULL
    sorts: [date.report_period_year, claim.lossyear]
    limit: 500
    column_limit: ' '
    total: true
    show_view_names: false
    show_row_numbers: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    
  - name: incurredlosstriangle
    listen:
      product: product.productname
    title: Incurred Loss By Accident Year By Accounting Year
    type: table
    model: Experience
    explore: experience
    dimensions: [claim.lossyear, date.report_period_year]
    pivots: [date.report_period_year]
    measures: [claim.incurred_loss_mtd]
    filters:
      claim.lossyear: -NULL
    sorts: [date.report_period_year, claim.lossyear]
    limit: 500
    column_limit: ' '
    total: true
    show_view_names: false
    show_row_numbers: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false   
    


