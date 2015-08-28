- view: report_template
  extends: summary_template

  fields:
  - dimension: date.report_period
    sql: ${TABLE}.reportperiod
    hidden: true
    
#   - dimension_group: date.report_period
#     type: time
#     convert_tz: false
#     timeframes: [month, year, month_num]
#     sql: ${TABLE}.reportperiod
    
  - dimension: date.report_year
    label: "Report Period Year"
    type: int
    sql: ${TABLE}.reportperiod_year
    
  - dimension: date.report_month
    label: "Report Period Month"
    type: int
    sql: ${TABLE}.reportperiod_month  


