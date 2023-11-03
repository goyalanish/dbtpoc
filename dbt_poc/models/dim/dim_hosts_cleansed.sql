{{ config (schema = 'dim',materialized = 'view' ) }}

WITH src_hosts As (

Select * from {{ ref("src_hosts")}}
)
Select host_id,
NVL(host_name,'Anonymous') host_name,
is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
