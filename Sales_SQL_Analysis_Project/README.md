# Customer and Product Insights Report (SQL)

This project constructs **analytical SQL views and queries** to generate insights from a sales database. Common Table Expressions (CTEs), date functions, and window functions are used to assist with data transformation
and segmentation. 

**Key Buisness Questions:**
- How can we identify high-value (VIP) customers based on lifetime sales?
- How frequently and recent are customers purchasing by age group?
- Which product categories contribute most to total revenue
- How do product sales change over time. (comparisions to prior years and average)
- General monthly sales trends and running totals

---

## 📁 Project Structure
```
Sales_SQL_Analysis_Project
├── datasets
│   └── gold.dim_customers         # Customer Profile Data
│   └── gold.dim_products          # Product metadata
│   └── gold.fact_sales            # Transaction data
│   └── gold.report_customers      # Final customer-level view
│   └── gold.report_products       # Final product-level view
│   
├── scripts
│   └── 01_Product_Sales_Analysis  # Queries for product sales and trends
│   └── 02_Customer_Report         # Customer segmentation and metrics
│   └── 03_Product_Report          # Product performance report
│
│
└── README.md                      # Project overview
```

## SQL Techniques & Functions Used

- **Common Table Expressions (CTEs)** – for modular query building
- **Window Functions**:
- **CASE functions**:

---

## Technologies Used

**Azure Data Studio/SSMS** - for SQL quierying and import/exports


