- dashboard: experience_summary
  title: Experience Summary
  layout: grid
  rows:
    - elements: [YTDLossRatioTrend, IncurredLossRatioByState, LossPremiumTrend]
      height: 400
    - elements: [ProductExperienceSummary, ProducerExperienceSummary]
      height: 500

#  filters:

  elements:

  - name: YTDLossRatioTrend
    title: YTD Loss Ratio Trend   
    type: looker_line
    model: Experience
    explore: experience
    dimensions: [date.report_period_month]
    measures: [experience.incurred_loss_ratio_ytd, experience.paid_loss_ratio_ytd]
    filters:
      date.report_period_month: 14 months
    sorts: [date.report_period_month desc]
    limit: 500
    column_limit: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    x_axis_scale: auto
    show_null_points: true
    show_null_labels: false
    point_style: circle_outline
    y_axis_combined: true
    interpolation: linear
    x_axis_label: Report Period Month
    y_axis_min: ['0']
    legend_position: center

  - name: IncurredLossRatioByState
    title: Incurred loss Ratio By State
    type: looker_geo_choropleth
    model: Experience
    explore: experience
    dimensions: [policy.statecd]
    measures: [experience.incurred_loss_ratio_ytd]
    filters:
      date.report_period_month: 14 months ago
    sorts: [experience.incurred_loss_ratio_ytd desc]
    limit: 500
    column_limit: ''
    show_view_names: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    map: usa
    map_projection: ''
    quantize_colors: false
    loading: false
    empty_color: lightgray
#    colors: ['#ffffb2','#fed976','#feb24c','#fd8d3c','#f03b20','#bd0026']
#    colors: ['#b2182b','#ef8a62','#fddbc7','#f7f7f7','#d1e5f0','#67a9cf','#2166ac']
#    colors: ['#ffffd9','#edf8b1','#c7e9b4','#7fcdbb','#41b6c4','#1d91c0','#225ea8','#253494','#081d58']
#    colors: ['#ffeda0','#fed976','#feb24c','#fd8d3c','#fc4e2a','#e31a1c','#bd0026']
    colors: ['#f2f0f7','#dadaeb','#bcbddc','#9e9ac8','#807dba','#6a51a3','#4a1486']
    
  - name: LossPremiumTrend
    title: MTD Loss & Premium Trend  
    type: looker_line
    model: Experience
    explore: experience
    dimensions: [date.report_period_month]
    measures: [claim.paid_loss_mtd, claim.incurred_loss_mtd, claim.outstanding_reserve,
      policy.earned_premium_mtd, policy.written_premium_mtd]
    filters:
       date.report_period_month: 14 months
    sorts: [date.report_period_month desc]
    limit: 500
    column_limit: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    x_axis_scale: auto
    show_null_points: true
    show_null_labels: false
    point_style: circle
    y_axis_combined: true
    interpolation: linear
    x_axis_label: Report Period Month
    legend_position: center
    
  - name: ProductExperienceSummary
    title: Product Experience Summary By Line - Annual Statement Line - YTD
    type: table
    model: Experience
    explore: experience
    dimensions: [product.linecd, product.annualstatementlinecd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd,
      policy.written_premium_ytd]
    filters:
      date.report_period_month: 14 months ago
    sorts: [experience.incurred_loss_ratio_ytd desc]
    limit: 500
    column_limit: ''

  - name: ProducerExperienceSummary
    title: Producer Experience Summary - Earned Premium > 1 Million - YTD
    type: looker_scatter
    model: Experience
    explore: experience
    dimensions: [producer.producercd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd,
      policy.written_premium_ytd]
    filters:
      date.report_period_month: 14 months ago
      policy.earned_premium_ytd: '>=1000000'
    sorts: [policy.earned_premium_ytd desc]
    limit: 5000
    column_limit: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    show_null_points: true
    show_null_labels: false
    y_axis_orientation: [right]
    point_style: circle
    hidden_series: [claim.incurred_loss_ytd, policy.earned_premium_ytd, policy.written_premium_ytd]
    legend_position: center

    
    
    
    

