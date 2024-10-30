SELECT 
  CONCAT(EXTRACT(MONTH from date_date),"-",EXTRACT(YEAR FROM date_date)) AS datemonth
  ,ROUND(SUM(ads_margin),2) AS ads_margin
  ,ROUND(SUM(average_basket),2) AS average_basket
  ,ROUND(SUM(operational_margin),2) AS operational_margin
  ,SUM(ads_cost) AS ads_cost
  ,SUM(ads_impression) AS ads_impression
  ,SUM(ads_clicks) AS ads_clicks
  ,SUM(quantity) AS quantity
  ,ROUND(SUM(revenue),2) AS revenue
  ,ROUND(SUM(purchase_cost),2) AS purchase_cost
  ,ROUND(SUM(revenue - purchase_cost),2) AS margin
  ,ROUND(SUM(shipping_fee),2) AS shipping_fee
  ,ROUND(SUM(logcost),2) AS logcost
  ,SUM(shipping_fee +(revenue - purchase_cost) - logcost - operational_margin) AS ship_cost
FROM {{ref("finance_campaigns_day")}}
GROUP BY datemonth
ORDER BY datemonth DESC