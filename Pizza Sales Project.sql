SELECT SUM(total_price) as Total_Revenue
FROM[dbo].[pizza_sales]


SELECT SUM(total_price) / COUNT (DISTINCT order_id) as Avg_Order_Value
FROM[dbo].[pizza_sales]

SELECT SUM(quantity) as Total_Sales
FROM[dbo].[pizza_sales]

SELECT COUNT (DISTINCT order_id) as Total_Orders
FROM[dbo].[pizza_sales]

SELECT CAST (SUM(quantity) AS DECIMAL(10,2)) / 
CAST (COUNT(DISTINCT order_id) AS DECIMAL(10,2)) as Avg_Orders
FROM[dbo].[pizza_sales]

--Daily Trend
SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM[dbo].[pizza_sales]
GROUP BY DATENAME(DW,order_date)
--Hourly Trend
SELECT DATEPART(Hour,order_time) as order_hours, COUNT(DISTINCT order_id) AS Total_orders
FROM[dbo].[pizza_sales]
GROUP BY DATEPART(Hour,order_time) 
ORDER BY DATEPART(Hour,order_time)


SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC