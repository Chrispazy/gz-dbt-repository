select
    orders_id,
    date_date,
    round(
        (margin + shipping_fee - logcost - cast(ship_cost as float64)), 2
    ) as operational_margin,
    quantity,
    revenue,
    purchase_cost
from {{ ref("int_orders_margin") }} as m
inner join {{ ref("stg_raw__ship") }} as ship using (orders_id)
