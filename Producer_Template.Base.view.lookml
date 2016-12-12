- view: producer_template
  extends: summary_template
  
  fields:
  
  - dimension: producer.producercd
    type: string
    sql: nvl(${TABLE}.producercd,${TABLE}.producerprovidercd)
