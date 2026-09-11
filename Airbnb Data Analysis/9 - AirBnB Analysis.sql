-- Create the Airbnb database
CREATE DATABASE airbnb;

-- Select the Airbnb database
USE airbnb;

-- Create the listings table
CREATE TABLE listings (
    id BIGINT,
    listing_url TEXT,
    name TEXT,
    description TEXT,
    host_id BIGINT,
    host_name TEXT,
    host_since DATE,
    host_location TEXT,
    host_response_time TEXT,
    host_response_rate TEXT,
    host_acceptance_rate TEXT,
    host_is_superhost CHAR(1),
    host_listings_count INT,
    host_total_listings_count INT,
    host_verifications TEXT,
    property_type TEXT,
    room_type TEXT,
    accommodates INT,
    bathrooms DECIMAL(4,1),
    bathrooms_text TEXT,
    bedrooms DECIMAL(4,1),
    beds DECIMAL(4,1),
    number_of_reviews INT,
    review_scores_rating DECIMAL(4,2)
);

-- Create the calendar table
CREATE TABLE calendar (
    listing_id BIGINT,
    date DATE,
    available CHAR(1),
    price TEXT,
    minimum_nights INT,
    maximum_nights INT
);

-- Create the reviews table
CREATE TABLE reviews (
    listing_id BIGINT,
    id BIGINT,
    date DATE,
    reviewer_id BIGINT,
    reviewer_name TEXT,
    comments TEXT
);

-- Verify the tables
SHOW TABLES;


-- Check the number of rows in all tables
SELECT 'listings' AS table_name, COUNT(*) AS row_count
FROM listings

UNION ALL

SELECT 'calendar' AS table_name, COUNT(*) AS row_count
FROM calendar

UNION ALL

SELECT 'reviews' AS table_name, COUNT(*) AS row_count
FROM reviews;

-- ============================================================
-- QUESTION 1: PROPERTY DIVERSITY
-- ============================================================

-- Q1.1: Calculate the total number of listings and unique property types
SELECT
    COUNT(*) AS total_listings,
    COUNT(DISTINCT property_type) AS unique_property_types
FROM listings;

-- Q1.2: Identify the top 5 most common property types and their counts
SELECT
    property_type,
    COUNT(*) AS listing_count
FROM listings
WHERE property_type IS NOT NULL
GROUP BY property_type
ORDER BY listing_count DESC
LIMIT 5;


-- ============================================================
-- QUESTION 2: GUEST RATINGS
-- ============================================================

-- Q2.1: Calculate the average review score across all listings
SELECT
    ROUND(AVG(review_scores_rating), 2) AS average_review_score
FROM listings
WHERE review_scores_rating IS NOT NULL;

-- Q2.2: List the top 10 listings with the highest review scores
SELECT
    id AS listing_id,
    name,
    review_scores_rating
FROM listings
WHERE review_scores_rating IS NOT NULL
ORDER BY review_scores_rating DESC
LIMIT 10;

-- Q2.3: Count the number of listings with an average review score below 4.0
SELECT
    COUNT(*) AS listings_below_4
FROM listings
WHERE review_scores_rating < 4.0;


-- ============================================================
-- QUESTION 3: HOST ENGAGEMENT
-- ============================================================

-- Q3.1: Identify hosts managing more than 3 listings
SELECT
    host_id,
    host_name,
    COUNT(*) AS listing_count
FROM listings
WHERE host_id IS NOT NULL
GROUP BY host_id, host_name
HAVING COUNT(*) > 3
ORDER BY listing_count DESC;

-- Q3.2: Calculate the average review score for each host across their listings
SELECT
    host_id,
    host_name,
    COUNT(*) AS listing_count,
    ROUND(AVG(review_scores_rating), 2) AS average_review_score
FROM listings
WHERE host_id IS NOT NULL
GROUP BY host_id, host_name
ORDER BY average_review_score DESC;

-- Q3.3: List hosts with at least 2 listings and an average review score below 4.0
SELECT
    host_id,
    host_name,
    COUNT(*) AS listing_count,
    ROUND(AVG(review_scores_rating), 2) AS average_review_score
FROM listings
WHERE host_id IS NOT NULL
  AND review_scores_rating IS NOT NULL
GROUP BY host_id, host_name
HAVING COUNT(*) >= 2
   AND AVG(review_scores_rating) < 4.0
ORDER BY average_review_score ASC;


-- ============================================================
-- QUESTION 4: BOOKING TRENDS
-- ============================================================

-- Q4.1: Calculate the occupancy rate for each listing for January 2024
SELECT
    listing_id,
    ROUND(
        SUM(CASE WHEN available = 'f' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS occupancy_rate
FROM calendar
WHERE date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY listing_id
ORDER BY occupancy_rate DESC;

-- Q4.2: Identify the top 5 listings with the highest occupancy rates in January 2024
SELECT
    listing_id,
    ROUND(
        SUM(CASE WHEN available = 'f' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS occupancy_rate
FROM calendar
WHERE date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY listing_id
ORDER BY occupancy_rate DESC
LIMIT 5;

-- Q4.3: List all listings that were not booked at all in January 2024
SELECT
    listing_id
FROM calendar
WHERE date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY listing_id
HAVING SUM(CASE WHEN available = 'f' THEN 1 ELSE 0 END) = 0;


-- ============================================================
-- QUESTION 5: PRICING PATTERNS ACROSS PROPERTY TYPES
-- ============================================================

-- Q5.1: Calculate the average price per night for each property type
SELECT
    l.property_type,
    ROUND(
        AVG(
            CAST(
                REPLACE(REPLACE(c.price, '$', ''), ',', '')
                AS DECIMAL(10,2)
            )
        ),
        2
    ) AS average_price_per_night
FROM listings l
JOIN calendar c
    ON l.id = c.listing_id
WHERE c.price IS NOT NULL
  AND l.property_type IS NOT NULL
GROUP BY l.property_type
ORDER BY average_price_per_night DESC;

-- Q5.2: Identify the top 5 listings with the highest average price per night
SELECT
    c.listing_id,
    l.name,
    l.property_type,
    ROUND(
        AVG(
            CAST(
                REPLACE(REPLACE(c.price, '$', ''), ',', '')
                AS DECIMAL(10,2)
            )
        ),
        2
    ) AS average_price_per_night
FROM calendar c
JOIN listings l
    ON c.listing_id = l.id
WHERE c.price IS NOT NULL
GROUP BY c.listing_id, l.name, l.property_type
ORDER BY average_price_per_night DESC
LIMIT 5;

-- Q5.3: Find property types with an average price below $150 per night
SELECT
    l.property_type,
    ROUND(
        AVG(
            CAST(
                REPLACE(REPLACE(c.price, '$', ''), ',', '')
                AS DECIMAL(10,2)
            )
        ),
        2
    ) AS average_price_per_night
FROM listings l
JOIN calendar c
    ON l.id = c.listing_id
WHERE c.price IS NOT NULL
  AND l.property_type IS NOT NULL
GROUP BY l.property_type
HAVING AVG(
    CAST(
        REPLACE(REPLACE(c.price, '$', ''), ',', '')
        AS DECIMAL(10,2)
    )
) < 150
ORDER BY average_price_per_night ASC;