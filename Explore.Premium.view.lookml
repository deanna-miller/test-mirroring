- explore: premium
  joins: 
   - join: producer_info
     sql_on: ${premium.producercd} = ${producer_info.producercd}  
     relationship: many_to_one
