- explore: claims_detail
  joins: 
   - join: producer_info
     sql_on: ${claim_transactions.producerprovidercd} = ${producer_info.producercd}  
     relationship: many_to_one
   - join: adjuster
     sql_on: ${claim_transactions.adjusterprovidercd} = ${adjuster.adjustercd}  
     relationship: many_to_one

