- connection: warehouse

- include: "*.Policy.view.lookml"       # include policy views in this project
- include: "*.Base.view.lookml"       # include base views in this project
#- include: "*Explore_Policy.view.lookml"       # include base views in this project

- explore: policy_reinsurance_summary
- explore: policy_level_summary
