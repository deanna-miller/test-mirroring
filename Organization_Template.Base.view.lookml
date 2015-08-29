- view: organization_template
  extends: summary_template

  fields:

  - dimension: organization.carriercd
    label: "Carrier"
    sql: ${TABLE}.carriercd

  - dimension: organization.carriergroupcd
    label: "Carrier Group"
    sql: ${TABLE}.carriergroupcd