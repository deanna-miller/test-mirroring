- connection: warehouse

- scoping: true           # for backward compatibility
- include: "*.Claim.view.lookml"       # include claim views in this project
- include: "*.Base.view.lookml"       # include base views in this project
- include: "Adjuster.view.lookml"  
 
#- include: "*Explore_Claim.view.lookml"       # include base views in this project

#- include: "*.dashboard.lookml"  # include all dashboards in this project


- explore: claim_reinsurance_summary  
  description: 'Model view provides dimensions and measures which enable month end reporting of granular reinsurance claim activity, i.e. by treaty, reinsurace coverage, reserve etc.. Only ceded claims are recorded.'
 
- explore: claim_level_summary 
  description: 'Model view provides dimensions and measures which enable month end reporting of claim level activity. Provides breadown between direct, ceded and net amounts. Use Claim Summary to drill below claim level for direct losses .'
     

