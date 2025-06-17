/*
==========================Product Report==========================

Purpose: consolidates key product metrics and behaviors

Highlights:
    1) Includes key fields such as product name, category, subcategory, and cost
    2) Segments products by total revenue into tiers (High, Mid, Low Performers)
    3) Aggregates product-level metrics:
        - total orders
        - total sales
        - total quantity sold
        - total customers (unique)
        - lifespan (in months)
    4) Calculates KPIs:
        - recency (months since last sale)
        - average order value (AOV)
        - average monthly revenue
*/

CREATE VIEW gold.report_products AS
WITH base_query AS (
/*-----------------------------------------------------------------
Base Query: Retrieves core columns from tables
*/-----------------------------------------------------------------
SELECT
    f.product_key,
f.order_number,
f.order_date,
f.sales_amount,
f.quantity,
f.customer_key,
p.product_name,
p.category,
p.subcategory,
p.cost
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
),
product_aggregation AS (
/*-----------------------------------------------------------------
Product Aggregations: Summarizes key metrics at the product level
*/-----------------------------------------------------------------
SELECT
product_key,
product_name,
category,
subcategory,
cost,
MAX(order_date) AS last_sale_date,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT customer_key) AS total_customers,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM base_query
GROUP BY
product_key,
product_name,
category,
subcategory,
cost
)

SELECT
product_key,
product_name,
category,
subcategory,
cost,
last_sale_date,
DATEDIFF(month, last_sale_date, GETDATE()) AS recency,
CASE
    WHEN total_sales > 50000 THEN 'High-Performer'
    WHEN total_sales BETWEEN 10000 AND 50000 THEN 'Mid-Performer'
    ELSE 'Low-Performer'
END AS product_segment,
total_orders,
total_sales,
total_quantity,
total_customers,
lifespan,

-- Average Order Value (AOV)
CASE WHEN total_orders = 0 THEN 0
        ELSE total_sales / total_orders
END AS avg_order_value,

-- Average Monthly Revenue
CASE WHEN lifespan = 0 THEN total_sales
        ELSE total_sales / lifespan
END AS avg_monthly_revenue

FROM product_aggregation