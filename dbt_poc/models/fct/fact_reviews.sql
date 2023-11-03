--Specify the Incremental Changes via Jinja
{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null

--How to read the incremental data from table
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}