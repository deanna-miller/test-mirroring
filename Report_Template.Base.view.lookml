- view: report_template
  extends: summary_template

  fields:
  - dimension: date.report_period
    sql: ${TABLE}.reportperiod
    hidden: true
    
  - dimension_group: date.report_period
    label: "Report Period"
    type: time
    convert_tz: false
    timeframes: [month, year]
    sql: ${TABLE}.reportperiod
    
# - dimension: date.report_year
#    label: "Report Period Year"
#    type: int
#    sql: ${TABLE}.reportperiod_year
    
#  - dimension: date.report_month
#    label: "Report Period Month"
#    type: int
#    sql: ${TABLE}.reportperiod_month  
    
  - dimension_group: date.accountingdt
    label: "Accounting"
    type: time
    timeframes: [date,month, year]
    sql: ${TABLE}.accountingdt

  - dimension: report.record_type
    label: "Report Type"
    sql: ${TABLE}.record_type


