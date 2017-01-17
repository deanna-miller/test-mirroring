- view: report_template
  extends: summary_template

  fields:
  
  - dimension_group: date.accountingdt
    label: "Accounting"
    type: time
    timeframes: [date,month, year, raw]
    sql: ${TABLE}.accountingdt
    
  - dimension: date.report_period
    sql: ${TABLE}.reportperiod
    hidden: true
    
  - dimension_group: date.report_period
    label: "Report Period"
    type: time
    convert_tz: false
    timeframes: [month, year, raw]
    sql: ${TABLE}.reportperiod
    
# - dimension: date.report_year
#    label: "Report Period Year"
#    type: number
#    sql: ${TABLE}.reportperiod_year
    
#  - dimension: date.report_month
#    label: "Report Period Month"
#    type: number
#    sql: ${TABLE}.reportperiod_month  

  - dimension: report.record_type
    label: "Report Type"
    sql: ${TABLE}.record_type