-- back compat for old kwarg name
  
  begin;
    

        insert into AIRBNB.DEV_fact.fact_reviews ("LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT")
        (
            select "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT"
            from AIRBNB.DEV_fact.fact_reviews__dbt_tmp
        );
    commit;