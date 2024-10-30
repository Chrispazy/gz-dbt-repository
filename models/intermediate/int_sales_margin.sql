select
    *
    ,purchase_price * quantity AS purchase_cost
    ,ROUND((revenue - purchase_price* quantity),2) AS margin
    ,{{ margin_percent('revenue','purchase_price*quantity')}} AS margin_percent
from {{ref("stg_raw__sales")}}
inner join {{ref("stg_raw__product")}}
USING (products_id)