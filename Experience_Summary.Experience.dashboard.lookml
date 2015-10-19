- dashboard: experience_summary
  title: Experience Summary
  layout: grid
  rows:
    - elements: [YTDLossRatioTrend, WrittenPremiumByState, LossPremiumTrend]
      height: 300
    - elements: [ProductExperienceSummary, ProducerExperienceSummary]
      height: 500

#  filters:

  elements:

  - name: YTDLossRatioTrend
    title: YTD Loss Ratio Trend - As of Month
    type: looker_line
    model: Experience
    explore: experience
    dimensions: [date.report_year, date.report_month]
    measures: [experience.incurred_loss_ratio_ytd, experience.paid_loss_ratio_ytd]
    filters:
      date.report_month: '[1, 12]'
      date.report_year: '2014'
    sorts: [date.report_month]
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
    y_axis_min: ['.20']
    legend_position: center

  - name: WrittenPremiumByState
    title: Written Premium By State - Inception to Date
    type: looker_geo_choropleth
    model: Experience
    explore: experience
    dimensions: [policy.statecd]
    measures: [policy.written_premium_ytd]
    sorts: [policy.written_premium_ytd desc]
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
    colors: ['#add8e6', '#0000ff', '#00008b']
    
  - name: LossPremiumTrend
    title: MTD Loss & Premium Trend - As of Month
    type: looker_line
    model: Experience
    explore: experience
    dimensions: [date.report_year, date.report_month]
    measures: [claim.paid_loss_mtd, claim.incurred_loss_mtd, claim.outstanding_reserve,
      policy.earned_premium_mtd, policy.written_premium_mtd]
    filters:
      date.report_month: '[1, 12]'
      date.report_year: '2014'
    sorts: [date.report_month]
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
      date.report_month: '8'
      date.report_year: '2014'
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
      date.report_month: '8'
      date.report_year: '2014'
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

    
    
    
    

