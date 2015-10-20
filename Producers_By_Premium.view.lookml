- view: producers_by_premium 
  derived_table:
    sql: |
      select 
      producercd as producer
      , sum(ytdwrittenpremiumamt) as premium_ytd
      , row_number() over (order by premium_ytd desc) as rank
      from masked_data.accountingsummarystats
      where 
        {% condition rank_reportperiod_filter %} reportperiod {% endcondition %}  
      group by 1

  fields:

  - filter: rank_reportperiod_filter
    type: date_month

  - dimension: producer 
    primary_key: true
    sql: ${TABLE}.producer

  - dimension: premium
    sql: ${TABLE}.premium_ytd

  - dimension: rank
    type: number
    sql: ${TABLE}.rank