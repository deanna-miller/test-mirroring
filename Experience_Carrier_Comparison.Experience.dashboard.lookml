- dashboard: experience_Carrier_Comparison
  title: Experience Carrier Comparison
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_308
    title: ABC Experience By Line and Annual Statement Line - YTD
    type: looker_column
    model: Experience
    explore: experience
    dimensions: [product.linecd, product.annualstatementlinecd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd]
    filters:
      date.report_month: '12'
      date.report_year: '2014'
      organization.carriercd: '"ABC"'
      experience.incurred_loss_ratio_ytd: NOT NULL
    sorts: [policy.earned_premium_ytd desc 1]
    limit: 500
    column_limit: ''
    total: true
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
    show_null_labels: false
    show_null_points: true
    point_style: none
    interpolation: linear
    y_axis_orientation: [right]
    legend_position: center
    ordering: none
    
  - name: add_a_unique_name_165
    title: XYZ Experience By Line and Annual Statement Line - YTD
    type: looker_column
    model: Experience
    explore: experience
    dimensions: [product.linecd, product.annualstatementlinecd]
    measures: [experience.incurred_loss_ratio_ytd, claim.incurred_loss_ytd, policy.earned_premium_ytd]
    filters:
      date.report_month: '12'
      date.report_year: '2014'
      organization.carriercd: '"XYZ"'
      experience.incurred_loss_ratio_ytd: NOT NULL
    sorts: [policy.earned_premium_ytd desc 1]
    limit: 500
    column_limit: ''
    total: true
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
    show_null_labels: false
    show_null_points: true
    point_style: none
    interpolation: linear
    y_axis_orientation: [right]
    legend_position: center
    ordering: none