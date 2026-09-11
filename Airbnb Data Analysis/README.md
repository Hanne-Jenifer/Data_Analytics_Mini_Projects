# 🏠 Airbnb Data Analysis — SQL Assignment

## 📌 Overview

This project analyzes Airbnb listing, calendar, and review data using SQL to extract insights related to property diversity, guest ratings, host engagement, booking trends, and pricing patterns.

The assignment focuses on using structured SQL queries to evaluate key areas of Airbnb performance and identify opportunities related to customer needs, host performance, occupancy, and pricing. 

## 🎯 Objectives

The analysis focuses on:

- Property diversity and the most common property types
- Guest ratings and listing quality
- Host engagement and host-level performance
- Listing occupancy during January 2024
- Pricing patterns across property types
- Identifying areas of strong performance and potential underperformance

These objectives are based on the six analytical areas defined in the assignment case study. 

## 🗂️ Dataset

The analysis uses three related tables:

### Listings

Contains property and host information, including:

- Listing ID
- Listing name
- Host ID and host name
- Property type
- Room type
- Accommodation capacity
- Bedrooms, beds, and bathrooms
- Number of reviews
- Review score

### Calendar

Contains listing availability and pricing information, including:

- Listing ID
- Date
- Availability status
- Price
- Minimum nights
- Maximum nights

### Reviews

Contains guest review information, including:

- Listing ID
- Review ID
- Review date
- Reviewer ID
- Reviewer name
- Review comments

The assignment defines the three tables and their relevant fields for the analysis. 

## 🔍 Analysis

### 1. Property Diversity

The analysis evaluates:

- Total number of listings
- Number of unique property types
- Top 5 most common property types and their listing counts

This helps assess the variety of properties available and identify dominant or potentially underserved categories. 

### 2. Guest Ratings

The analysis evaluates:

- Average review score across listings
- Top 10 highest-rated listings
- Number of listings with a review score below 4.0

These queries are designed to identify highly rated properties as well as listings that may require attention. 

### 3. Host Engagement

The analysis evaluates:

- Hosts managing more than 3 listings
- Average review score for each host
- Hosts with at least 2 listings and an average review score below 4.0

This provides a host-level view of listing volume and review performance. 

### 4. Booking Trends

The analysis calculates occupancy rates using calendar availability data for January 2024.

It includes:

- Occupancy rate for each listing
- Top 5 listings by occupancy rate
- Listings that were not booked during January 2024

The SQL calculates occupancy using the proportion of calendar records where availability is marked as `f`. 

### 5. Pricing Patterns

The analysis evaluates pricing by:

- Calculating average nightly price for each property type
- Identifying the top 5 listings by average nightly price
- Finding property types with an average price below $150 per night

The SQL converts the calendar price field into a numeric value by removing `$` and comma characters before calculating averages. 

### 6. Guest Review Insights

The case study also defines a guest review analysis covering:

- Top 10 reviewers by number of reviews submitted
- Average number of reviews per listing
- Listings with no reviews during 2023

These tasks are part of the assignment requirements. 


## 🛠️ SQL Techniques Used

The SQL analysis demonstrates:

- Database and table creation
- Aggregation using `COUNT()` and `AVG()`
- `COUNT(DISTINCT ...)`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- Conditional aggregation using `CASE`
- Date filtering with `BETWEEN`
- Table joins
- Data cleaning with `REPLACE()`
- Data type conversion using `CAST()`
- Result rounding using `ROUND()`

The SQL script creates the `listings`, `calendar`, and `reviews` tables and uses joins, aggregations, conditional logic, and filtering across the analysis questions. 


## 💡 Insights

The analysis is structured to help identify:

- Which property types dominate the Airbnb listing portfolio
- Which listings demonstrate strong or weak guest ratings
- Which hosts manage multiple listings
- Which hosts may require performance attention based on review scores
- Which listings show high or low occupancy during January 2024
- How nightly pricing differs across property types
- Which property categories have average nightly prices below $150
- Patterns in guest review activity

These areas align with the assignment's stated focus on booking trends, host performance, guest feedback, property diversity, and pricing decisions. 

## 🧰 Tools

- SQL
- Airbnb relational dataset
- Listings, Calendar, and Reviews tables

---

## 🏁 Conclusion

This SQL assignment applies analytical SQL techniques to Airbnb data across property listings, calendar availability, pricing, host activity, guest ratings, and reviews.

The analysis provides a structured approach to evaluating listing diversity, guest satisfaction, host engagement, occupancy performance, and pricing patterns without relying on assumptions beyond the available dataset and assignment requirements.

---

## 👤 Author

**Hanne Jenifer**
