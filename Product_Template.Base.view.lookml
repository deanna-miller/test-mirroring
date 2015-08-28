 - view: product_template
   extends: summary_template

   fields:
   - dimension: product.annualstatementlinecd
     label: "Annual Statement Line"
     sql: ${TABLE}.annualstatementlinecd

   - dimension: product.carriercd
     label: "Carrier"
     sql: ${TABLE}.carriercd

   - dimension: product.carriergroupcd
     label: "Carrier Group"
     sql: ${TABLE}.carriergroupcd

   - dimension: product.coveragecd
     label: "Coverage"  
     sql: ${TABLE}.coveragecd

   - dimension: product.coverageitemcd
     label: "Coverage Item"
     sql: ${TABLE}.coverageitemcd

   - dimension: product.linecd
     label: "Line"
     sql: ${TABLE}.linecd

   - dimension: product.productname
     label: "Product Name"
     sql: ${TABLE}.productname
