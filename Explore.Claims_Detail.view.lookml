- explore: claims_detail
  joins: 
   - join: producer_info
     sql_on: ${claims_detail.producerprovidercd} = ${producer_info.producercd}  
     relationship: many_to_one
   - join: adjuster
     sql_on: ${claims_detail.adjusterprovidercd} = ${adjuster.adjustercd}  
     relationship: many_to_one
  