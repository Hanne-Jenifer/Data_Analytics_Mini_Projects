# 🍽️ Swiggy Analysis

This project analyzes Swiggy order, restaurant, food, menu, and user data using Microsoft Power BI.  
The datasets were integrated into a connected data model to analyze sales, restaurant performance, menu pricing, cuisines, and customer segments.

## 🎯 Project Focus

The analysis focuses on five connected areas:

- **Orders & Sales** — transaction volume, sales amount, order dates, users, and restaurants.
- **Restaurants** — restaurant performance, ratings, locations, cost, and cuisines.
- **Food & Menu** — food items, vegetarian classification, menu pricing, and cuisine relationships.
- **Customers** — user demographics and socioeconomic characteristics.
- **Cross-Dataset Analysis** — connecting orders with restaurants and users to examine sales and customer behavior across different segments.

## 📂 Dataset

The project uses five related Excel datasets:

| Dataset | Key Information |
|---|---|
| `Food.xlsx` | Food ID, item name, vegetarian/non-vegetarian classification |
| `Menu.xlsx` | Menu ID, restaurant ID, food ID, cuisine, price |
| `Orders.xlsx` | Order date, sales quantity, sales amount, currency, user ID, restaurant ID |
| `Restaurant.xlsx` | Restaurant ID, name, city, rating, rating count, cost, cuisine, address, menu reference |
| `User.xlsx` | User ID, age, gender, marital status, occupation, income, education, family size |

## 🔎 Analysis

### Orders & Sales
- Analyzed sales amount and quantity across order transactions.
- Examined order activity by date and restaurant.
- Connected transactions with restaurant and user information for segmented analysis.

### Restaurant & Cuisine
- Compared restaurants using ratings, rating counts, location, cost, and cuisine.
- Examined cuisine distribution across the available restaurant and menu data.
- Linked restaurant information with order transactions to support restaurant-level analysis.

### Food & Menu
- Analyzed food items by vegetarian/non-vegetarian classification.
- Examined menu prices across restaurants and cuisines.
- Connected food, menu, restaurant, and cuisine information.

### Customer Segmentation
- Used user attributes such as age, gender, occupation, income, education, and family size to segment the available customer data.
- Connected user information with order transactions to examine sales behavior across customer segments.

## 📊 Power BI Dashboard

The dashboard combines the connected datasets into an interactive reporting layer.

Power BI was used for:

- **Data modeling** — establishing relationships between orders, restaurants, menus, food, and users.
- **KPI analysis** — summarizing key sales and transaction measures.
- **Segmentation** — analyzing available restaurant, cuisine, and customer attributes.
- **Interactive filtering** — enabling users to explore different dimensions of the data.
- **Data visualization** — presenting sales, restaurant, menu, food, and customer analysis in a single dashboard.

### Dashboard Preview

![Swiggy Analysis Power BI Dashboard](https://github.com/sure-trust/HANNE-JENIFER-R-g2-data-analytics/blob/3665af41ed1603c1598abc42bb03dc711c66e8f7/Assignments/Swiggy%20Analysis/Swiggy%20Analysis.png)

## 💡 Key Findings

The current project documentation does not provide the numerical KPI values or detailed dashboard outputs needed to state specific findings such as the highest-performing restaurant, cuisine, customer segment, or sales category without inventing results.

The analytical structure, however, supports comparison of:

- Sales performance across restaurants and customer segments.
- Restaurant ratings, costs, and cuisine characteristics.
- Menu pricing across restaurants and cuisines.
- Customer attributes against available order activity.

> Specific findings should be added here using the actual KPI and visual outputs from the Power BI dashboard.

## 🛠️ Tools & Technologies

- **Microsoft Power BI** — data modeling, measures, segmentation, analysis, and dashboard development.
- **Microsoft Excel** — source datasets and data preparation.

## 🔄 Workflow

**Excel Datasets → Data Cleaning & Preparation → Data Modeling → Relationships & Measures → Segmentation & Analysis → Power BI Dashboard**

## 🏁 Outcome

This project demonstrates the integration of multiple related datasets into a Power BI data model and their use for analyzing sales, restaurants, menus, food, cuisines, and customer segments.

The main strength of the project is the **cross-dataset analysis**, rather than treating each Excel file as an isolated dataset.

## 👤 Author

Hanne Jenifer
