-- ======================================================
-- LEVEL 1 : DATA EXPLORATION
-- ======================================================

-- Q1. Total number of records
SELECT COUNT(*) AS Total_Orders
FROM Superstore;

-- Q2. Display first 10 records
SELECT *
FROM Superstore
LIMIT 10;

-- Q3. Number of unique customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM Superstore;

-- Q4. Number of unique products
SELECT COUNT(DISTINCT `Product Name`) AS Total_Products
FROM Superstore;

-- Q5. Number of categories
SELECT COUNT(DISTINCT Category) AS Categories
FROM Superstore;

-- Q6. Number of sub-categories
SELECT COUNT(DISTINCT `Sub-Category`) AS SubCategories
FROM Superstore;

-- Q7. Number of regions
SELECT COUNT(DISTINCT Region) AS Regions
FROM Superstore;

-- Q8. Date range of the dataset
SELECT
MIN(`Order Date`) AS First_Order,
MAX(`Order Date`) AS Last_Order
FROM Superstore;

-- ======================================================
-- LEVEL 2 : SALES ANALYSIS
-- ======================================================

-- Q9. Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore;

-- Q10. Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore;

-- Q11. Average Sales per Order
SELECT ROUND(AVG(Sales),2) AS Average_Sales
FROM Superstore;

-- Q12. Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM Superstore;

-- Q13. Sales by Category
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q14. Sales by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- Q15. Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ======================================================
-- LEVEL 3 : CUSTOMER ANALYSIS
-- ======================================================

-- Q16. Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q17. Top 10 Customers by Profit
SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Q18. Number of Customers in Each Segment
SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Customers
FROM Superstore
GROUP BY Segment
ORDER BY Customers DESC;

-- Q19. Sales by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Q20. Profit by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- Q21. Top 10 Cities by Sales
SELECT
    City,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q22. Top 10 States by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- ======================================================
-- LEVEL 4 : PRODUCT ANALYSIS
-- ======================================================

-- Q23. Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q24. Top 10 Products by Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Q25. Top 10 Products by Quantity Sold
SELECT
    `Product Name`,
    SUM(Quantity) AS Quantity_Sold
FROM Superstore
GROUP BY `Product Name`
ORDER BY Quantity_Sold DESC
LIMIT 10;

-- Q26. Sales by Category
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q27. Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q28. Sales by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- Q29. Profit by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

-- Q30. Average Sales Per Product
SELECT
    `Product Name`,
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM Superstore
GROUP BY `Product Name`
ORDER BY Avg_Sales DESC
LIMIT 10;

-- ======================================================
-- LEVEL 5 : REGIONAL ANALYSIS
-- ======================================================

-- Q31. Sales by State
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY State
ORDER BY Total_Sales DESC;

-- Q32. Profit by State
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY State
ORDER BY Total_Profit DESC;

-- Q33. Top 10 Cities by Profit
SELECT
    City,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 10;

-- Q34. Lowest 10 States by Profit
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;

-- Q35. Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ======================================================
-- LEVEL 6 : PROFIT & DISCOUNT ANALYSIS
-- ======================================================

-- Q36. Average Profit by Category
SELECT
    Category,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM Superstore
GROUP BY Category
ORDER BY Average_Profit DESC;

-- Q37. Average Discount by Category
SELECT
    Category,
    ROUND(AVG(Discount),2) AS Average_Discount
FROM Superstore
GROUP BY Category
ORDER BY Average_Discount DESC;

-- Q38. Products Making a Loss
SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY `Product Name`
HAVING Total_Profit < 0
ORDER BY Total_Profit;

-- Q39. States Making a Loss
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY State
HAVING Total_Profit < 0
ORDER BY Total_Profit;

-- Q40. High Discount Orders
SELECT
    `Order ID`,
    `Customer Name`,
    Sales,
    Discount
FROM Superstore
WHERE Discount > 0.30
ORDER BY Discount DESC;

-- Q41. Profit Category
SELECT
    `Product Name`,
    Profit,
    CASE
        WHEN Profit > 100 THEN 'High Profit'
        WHEN Profit BETWEEN 20 AND 100 THEN 'Medium Profit'
        ELSE 'Low Profit'
    END AS Profit_Category
FROM Superstore;

-- ======================================================
-- LEVEL 7 : ADVANCED SQL
-- ======================================================

-- Q42. Top 5 Highest Sales Orders
SELECT *
FROM Superstore
ORDER BY Sales DESC
LIMIT 5;

-- Q43. Products Selling Above Average
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Product Name`
HAVING Total_Sales >
(
    SELECT AVG(Sales)
    FROM Superstore
)
ORDER BY Total_Sales DESC;

-- Q44. Customers Spending Above Average
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY `Customer Name`
HAVING Total_Sales >
(
    SELECT AVG(Sales)
    FROM Superstore
)
ORDER BY Total_Sales DESC;

-- Q45. Number of Orders per Customer
SELECT
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM Superstore
GROUP BY `Customer Name`
ORDER BY Total_Orders DESC;

-- Q46. Sales Performance
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    CASE
        WHEN SUM(Sales) > 700000 THEN 'Excellent'
        WHEN SUM(Sales) > 400000 THEN 'Good'
        ELSE 'Average'
    END AS Performance
FROM Superstore
GROUP BY Category;

-- ======================================================
-- LEVEL 8 : ADVANCED ANALYTICS
-- ======================================================

-- Q47. Rank Products by Total Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM Superstore
GROUP BY `Product Name`;

-- Q48. Top Customer in Each Region
WITH CustomerSales AS
(
SELECT
    Region,
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Region, `Customer Name`
)

SELECT *,
RANK() OVER(PARTITION BY Region ORDER BY Total_Sales DESC) AS Customer_Rank
FROM CustomerSales;

-- Q49. Running Total of Sales by Order Date
SELECT
    `Order Date`,
    ROUND(SUM(Sales),2) AS Daily_Sales,
    ROUND(
        SUM(SUM(Sales)) OVER(ORDER BY `Order Date`),
        2
    ) AS Running_Total
FROM Superstore
GROUP BY `Order Date`;

-- Q50. Top 3 Products in Each Category
WITH ProductSales AS
(
SELECT
    Category,
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM Superstore
GROUP BY Category, `Product Name`
)

SELECT *
FROM
(
SELECT *,
RANK() OVER(PARTITION BY Category ORDER BY Total_Sales DESC) AS Product_Rank
FROM ProductSales
) RankedProducts
WHERE Product_Rank <=3;

