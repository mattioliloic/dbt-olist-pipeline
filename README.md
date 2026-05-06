# Olist E-commerce Analytics Pipeline

![Snowflake](https://img.shields.io/badge/-Snowflake-29B5E8?style=flat&logo=snowflake&logoColor=white) 
![dbt](https://img.shields.io/badge/-dbt-FF694B?style=flat&logo=dbt&logoColor=white)
![Looker Studio](https://img.shields.io/badge/-Looker_Studio-4285F4?style=flat&logo=google&logoColor=white)

## Context & Objective
This project transforms raw e-commerce data from the Brazilian marketplace **Olist** into an interactive, automated regional sales dashboard. 
The primary goal is to provide the sales and executive teams with a reliable, macro-to-micro view of revenue distribution across Brazilian states and cities.

---

## Technical Architecture (Modern Data Stack)
The pipeline is designed with a focus on automation, scalability, and software engineering best practices applied to data.

1. **Data Warehouse:** Snowflake (Storage and Compute)
2. **Data Transformation:** dbt (Data Build Tool)
3. **Data Visualization:** Looker Studio

---

##  Data Modeling (Kimball Methodology)
The dbt project is structured into distinct layers to ensure a clean separation of concerns:

* **`staging/`**: Source data extraction, basic cleansing, syntax standardization, and initial casting.
* **`marts/`**: Business logic application using dimensional modeling (Star Schema).
  * **`dimensions/`**: Contextual entities (`dim_customers`, `dim_products`, `dim_sellers`).
  * **`facts/`**: Measurable events (`fct_orders`).
* **`reports/`**: Final, highly denormalized tables tailored for specific BI use cases (e.g., `regional_sales`), ensuring a single grain and optimized query performance for Looker Studio.

---

##  Key Engineering Features

As an Analytics Engineering project, ensuring data reliability and keeping the codebase DRY (Don't Repeat Yourself) were top priorities:

### 1. Robust Data Quality & Testing 
Data integrity is enforced at pipeline execution before any dashboard refresh.
* **Generic Tests:** Ensuring primary keys uniqueness and preventing null values in critical fields (`not_null`, `unique`).
* **Singular Business Tests:** Custom SQL assertions to catch logical anomalies (e.g., `assert_order_price_is_positive`, `assert_shipping_date_makes_sense`).

### 2. Historical Tracking (Snapshots) 
Implementation of **Slowly Changing Dimensions (SCD Type 2)** via dbt snapshots (`orders_snapshot`). 
* If a critical attribute changes (e.g., an order status moving from *'pending'* to *'shipped'*), the historical state is preserved in Snowflake. 
This guarantees full traceability of the data lifecycle without overwriting past truths.

### 3. Custom Macros (DRY) 
Reusable SQL snippets to standardize complex or repetitive logic across multiple models.
* `convert_currency`: Standardizes financial metrics.
* `get_delivery_status`: Centralizes the business logic for calculating delivery delays.

### 4. Geospatial Precision 
To ensure 100% accuracy in mapping tools, geographic data is programmatically formatted directly within the dbt models, eliminating BI-side guesswork.

---

## The Final Deliverable

The output is a Looker Studio dashboard designed with an "information funnel" approach:
1. **Macro:** Global KPI scorecards and state-level bar charts.
2. **Micro:** Detailed drill-down tables for city-level revenue.
3. **Geospatial:** An interactive bubble map visually distributing wealth across the Brazilian territory.

![Dashboard](images/dashboard.png)

---

## How to run this project

Clone the repository and run the following dbt commands:

```bash
# Test the connection to the data warehouse
dbt debug

# Run the transformations (Staging -> Marts -> Reports)
dbt run

# Run all data quality tests
dbt test

# Generate and view the data dictionary
dbt docs generate
dbt docs serve