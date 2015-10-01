- connection: warehouse

- include: "Account_Transactions.view.lookml"       
- include: "Claim_Reinsurance_Transactions.view.lookml"       
- include: "Payable_Transactions.view.lookml"        
- include: "Policy_Reinsurance_Transactions.view.lookml"       
- include: "Policy_Transactions.view.lookml"       
- include: "Claim_Transactions.view.lookml"        
- include: "Producer_Info.view.lookml"       
- include: "Adjuster_Info.view.lookml"        
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

