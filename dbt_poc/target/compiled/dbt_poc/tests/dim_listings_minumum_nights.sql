SELECT
    *
FROM
    AIRBNB.DEV_dim.dim_listings_cleansed
WHERE minimum_nights < 10
LIMIT 10