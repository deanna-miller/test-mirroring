- view: coverage_template
  extends: summary_template
  
  fields:
  
   - dimension: coverage.riskcd
     label: "Risk Code"
     sql: ${TABLE}.riskcd
