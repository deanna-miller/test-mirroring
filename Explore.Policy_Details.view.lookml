- explore: policy_details
  joins: 
   - join: producer_info
     sql_on: ${policy_details.producercd} = ${producer_info.producercd}  
     relationship: many_to_one
