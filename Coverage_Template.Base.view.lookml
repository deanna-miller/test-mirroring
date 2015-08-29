- view: coverage_template
  extends: summary_template
  
  fields:
  
   - dimension: coverage.riskcd
     label: "Risk Code"
     sql: ${TABLE}.riskcd
     
   - dimension: coverage.coveragecd
     label: "Coverage"  
     sql: ${TABLE}.coveragecd

   - dimension: coverage.coverageitemcd
     label: "Coverage Item"
     sql: ${TABLE}.coverageitemcd
    
   - dimension: rateareaname
     label: "Rate Area Name"
     sql: ${TABLE}.rateareaname
