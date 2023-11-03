
  create or replace   view AIRBNB.DEV_dim.dim_hosts_cleansed
  
   as (
    

WITH  __dbt__cte__src_hosts as (
WITH raw_hosts AS (
    SELECT
        *
    FROM
       AIRBNB.RAW.RAW_HOSTS
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
),src_hosts As (

Select * from __dbt__cte__src_hosts
)
Select host_id,
NVL(host_name,'Anonymous') host_name,
is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
  );

