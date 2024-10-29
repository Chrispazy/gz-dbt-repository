select
    date_date
    ,orders_id
    ,s.products_id
    ,purchase_price * quantity AS purchase_cost
    ,ROUND((revenue - purchase_price* quantity),2) AS margin
from {{ref("stg_raw__sales")}} AS s
inner join {{ref("stg_raw__product")}} AS p
USING (products_id)