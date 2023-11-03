SELECT * FROM AIRBNB.DEV_dim.dim_listings_cleansed l
INNER JOIN AIRBNB.DEV_fact.fact_reviews r
USING (listing_id)
WHERE l.created_at >= r.review_date