# 📊 Kolkata Restaurant — Business Insights

## 1. Executive Summary

This document summarizes the business findings generated from the restaurant's 10-table operational dataset and the final Power BI executive dashboard. The analysis focuses on sales, orders, customers, menu performance, payments, inventory and purchasing.

## 2. Actual Dataset Snapshot

- **Customers:** 500
- **Employees:** 30
- **Menu Categories:** 8
- **Menu Items:** 120
- **Orders:** 4,000
- **Order Detail Records:** 12,023
- **Payments:** 4,000
- **Suppliers:** 20
- **Inventory Items:** 80
- **Purchase Orders:** 600

## 3. Sales & Revenue Performance

- Total order revenue in the source data is **₹6,332,118.00**.
- The dataset contains **4,000 orders**.
- Average order value is approximately **₹1,583.03**.
- The most frequent order type is **Takeaway**, representing 1,344 orders.
- Estimated gross contribution from menu-level selling price less recorded menu cost is **₹2,984,874.00**, with an estimated margin of **47.14%**.

## 4. Menu Performance

- The highest-volume menu item is **Pizza 98**, with approximately **257 units sold**.
- The highest-revenue menu category in the source data is **Fast Food**, generating approximately **₹1,569,125.00** in order-detail revenue.
- The Top 10 Selling Items visual should be used to identify products that deserve continued stock availability and promotional attention.

## 5. Customer Analysis

- The customer table contains **500 customers**.
- Customer registration dates can be used to monitor acquisition trends over time.
- Customer growth should be compared with revenue and order trends to determine whether growth is translating into commercial activity.

## 6. Payment Analysis

- Recorded payment value totals approximately **₹6,332,118.00**.
- The most frequently recorded payment mode is **UPI**, with 1,034 payment records.
- Payment-mode distribution can help management understand customer payment preferences and support reconciliation controls.

## 7. Inventory & Purchasing

- **6 inventory item(s)** are currently at or below their configured reorder level.
- The purchasing dataset contains **600 purchase-order records** with recorded purchase value of approximately **₹3,765,152.00**.
- Low-stock ingredients should be reviewed before the next purchasing cycle to reduce the risk of stock-outs.
- Supplier relationships in the database provide a direct route from inventory requirements to purchasing decisions.

## 8. Management Recommendations

1. Monitor monthly revenue and investigate significant changes in performance.
2. Protect availability of high-volume and high-revenue menu items.
3. Compare order-type performance to understand dine-in, takeaway and delivery demand.
4. Review low-stock ingredients regularly and create purchase orders before stock-outs occur.
5. Track customer growth alongside orders and revenue to measure the quality of customer acquisition.
6. Review payment-mode trends and reconcile payment totals with order revenue.

## 9. Dashboard Story

The final one-page Power BI dashboard connects the business story from **Revenue → Orders → Customers → Menu Performance → Order Type → Inventory**. Interactive filters allow management to explore the same metrics across different dates and business dimensions.

## 10. Important Validation Note

The values in this document were calculated from the uploaded CSV files. Before publishing the portfolio version, reconcile any differences between these source-file calculations and the final Power BI DAX measures, especially where the dashboard uses relationships, filters or a different profit definition.

**Project:** Kolkata Restaurant Data Management & Analytics  
**Tools:** MySQL • SQL • Power BI • DAX • Excel/CSV
