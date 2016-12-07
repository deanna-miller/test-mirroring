 - view: product_template
   extends: summary_template

   fields:
   - dimension: product.annualstatementlinecd
     label: "Annual Statement Line"
     sql: ${TABLE}.annualstatementlinecd

   - dimension: product.linecd
     label: "Line"
     sql: ${TABLE}.linecd

   - dimension: product.productname
     label: "Product Name"
     sql: ${TABLE}.productname
     
   - dimension: product.producttype
     label: "Product Type"
     sql: |
       CASE WHEN ${TABLE}.annualstatementlinecd = '030' THEN 'FO'
            WHEN ${TABLE}.annualstatementlinecd = '040' THEN 'HO'
            WHEN ${TABLE}.annualstatementlinecd = '171' THEN 'UMB'
            WHEN ${TABLE}.annualstatementlinecd IN ('191','192') THEN 'APPLD'
            WHEN ${TABLE}.annualstatementlinecd IN ('193','194') THEN 'CMML'
            WHEN ${TABLE}.annualstatementlinecd = '211' THEN 'APD'
            WHEN ${TABLE}.annualstatementlinecd = '270' THEN 'BM'
            ELSE 'NA' 
       END
