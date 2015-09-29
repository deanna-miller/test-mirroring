- connection: warehouse

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: account_transactions

- explore: claim_reinsurance_transactions


- explore: claim_transactions
  joins: 
   - join: producer_info
     sql_on: ${claim_transactions.producerprovidercd} = ${producer_info.producercd}  
     relationship: many_to_one
   - join: adjuster_info
     sql_on: ${claim_transactions.adjusterprovidercd} = ${adjuster_info.adjustercd}  
     relationship: many_to_one

- explore: payable_transactions

- explore: policy_reinsurance_transactions

- explore: policy_transactions
  joins: 
   - join: producer_info
     sql_on: ${policy_transactions.producercd} = ${producer_info.producercd}  
     relationship: many_to_one

