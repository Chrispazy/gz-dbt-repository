select
    *
from {{ref("stg_raw__sales")}}
inner join {{ref("stg_raw__product")}}
USING (products_id)