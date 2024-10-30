{{ config( materialized='table') }}
SELECT 
    date_date
    ,COUNT(orders_id) AS nb_of_transaction
    ,ROUND(SUM(revenue),2) AS tot_revenue
    ,ROUND(SAFE_DIVIDE(SUM(revenue),COUNT(DISTINCT orders_id)),2) AS average_basket
    ,ROUND(SUM(operational_margin),2) AS operational_margin
    ,ROUND(SUM(purchase_cost),2) AS tot_purchase_cost
    ,ROUND(SUM(shipping_fee),2) AS tot__shipping_fee
    ,ROUND(SUM(logcost),2) AS tot_log_cost
    ,SUM(quantity) AS quantity_of_products_sold
FROM {{ref("int_orders_operational")}} AS op
GROUP BY date_date