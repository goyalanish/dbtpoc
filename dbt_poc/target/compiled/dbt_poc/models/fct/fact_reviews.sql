--Specify the Incremental Changes via Jinja

WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
),src_reviews AS (
  SELECT * FROM __dbt__cte__src_reviews
)
SELECT * FROM src_reviews
WHERE review_text is not null

--How to read the incremental data from table

  AND review_date > (select max(review_date) from AIRBNB.DEV_fact.fact_reviews)
