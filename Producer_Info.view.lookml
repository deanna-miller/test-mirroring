- view: producer_info
  derived_table:
    sql: |

      Select 
        sourcecd as producercd,
        commercialname as producername,
        bestaddr1 as address1,
        bestaddr2 as address2,
        bestcity as city,
        bestpostalcode as postalcode,
        beststateprovcd as state
      From source_data.allcontacts
      Where  sourcetypecd  = 'Producer' and cmmcontainer = 'Provider'

  fields:
  - dimension: producercd
    label: "Producer Code"
    sql: ${TABLE}.producercd 
 
  - dimension: producername
    label: "Producer Name"
    sql: ${TABLE}.producername
      
  - dimension: address1
    label: "Address1"
    sql: ${TABLE}.address1
      
  - dimension: address2
    label: "Address2"
    sql: ${TABLE}.address2
       
  - dimension: postalcode
    label: "Postal Code"
    sql: ${TABLE}.postalcode 
      
  - dimension: state
    label: "State"
    sql: ${TABLE}.state


# # Specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.producer_info
#
# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         users.id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.date) as most_recent_purchase_date
#       FROM orders
#       GROUP BY user.id

# #     Define your dimensions and measures here, like this:
#     - dimension: profit
#       type: number
#       sql: ${TABLE}.profit
#
#     - measure: total_profit
#       type: sum
#       sql: ${profit}

