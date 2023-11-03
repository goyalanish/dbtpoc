select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT * FROM AIRBNB.DEV_dim.dim_listings_cleansed l
INNER JOIN AIRBNB.DEV_fact.fact_reviews r
USING (listing_id)
WHERE l.created_at >= r.review_date
      
    ) dbt_internal_test