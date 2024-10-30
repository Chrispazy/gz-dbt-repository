SELECT 
    date_date
    ,operational_margin - ads_cost AS ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,ads_impression
    ,ads_clicks
    ,quantity_of_products_sold AS quantity
    ,tot_revenue AS revenue
    ,tot_purchase_cost AS purchase_cost
    ,tot_revenue - ads_cost AS margin
    ,tot__shipping_fee AS shipping_fee
    ,tot_log_cost AS logcost
    ,ROUND(tot__shipping_fee + (tot_revenue-ads_cost) -tot_log_cost - operational_margin,2) AS ship_cost
FROM {{ref("int_campaigns_day")}} AS c
INNER JOIN {{ref("finance_days")}} AS f
USING(date_date)
ORDER BY date_date DESC