-- Sample queries for the Food Truck Relational Database
-- Run these after schema.sql and seed_data.sql have been executed.

-- ============================================
-- 1. Full menu, grouped by truck
-- ============================================
SELECT
    ft.TruckName,
    ft.CuisineType,
    mi.ItemName,
    mi.Price
FROM MenuItems mi
JOIN FoodTruck ft ON mi.TruckID = ft.TruckID
ORDER BY ft.TruckName, mi.ItemName;

-- ============================================
-- 2. Full order detail: customer, truck, item, quantity, and line total
-- ============================================
SELECT
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS Customer,
    ft.TruckName,
    mi.ItemName,
    oi.Quantity,
    mi.Price,
    oi.Quantity * mi.Price AS LineTotal,
    o.OrderDate
FROM OrderItems oi
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN MenuItems mi ON oi.ItemID = mi.ItemID
JOIN FoodTruck ft ON mi.TruckID = ft.TruckID
ORDER BY o.OrderID;

-- ============================================
-- 3. Total revenue per truck
-- ============================================
SELECT
    ft.TruckName,
    SUM(oi.Quantity * mi.Price) AS TotalRevenue
FROM OrderItems oi
JOIN MenuItems mi ON oi.ItemID = mi.ItemID
JOIN FoodTruck ft ON mi.TruckID = ft.TruckID
GROUP BY ft.TruckName
ORDER BY TotalRevenue DESC;

-- ============================================
-- 4. Best-selling menu items by total quantity ordered
-- ============================================
SELECT
    mi.ItemName,
    ft.TruckName,
    SUM(oi.Quantity) AS TotalQuantitySold
FROM OrderItems oi
JOIN MenuItems mi ON oi.ItemID = mi.ItemID
JOIN FoodTruck ft ON mi.TruckID = ft.TruckID
GROUP BY mi.ItemName, ft.TruckName
ORDER BY TotalQuantitySold DESC;

-- ============================================
-- 5. Top-spending customers
-- ============================================
SELECT
    c.FirstName + ' ' + c.LastName AS Customer,
    SUM(oi.Quantity * mi.Price) AS TotalSpent,
    COUNT(DISTINCT o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN MenuItems mi ON oi.ItemID = mi.ItemID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- ============================================
-- 6. Orders placed within a specific date range
-- ============================================
SELECT
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS Customer,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate BETWEEN '2026-08-01' AND '2026-08-04'
ORDER BY o.OrderDate;

-- ============================================
-- 7. Average order value per truck
-- ============================================
SELECT
    ft.TruckName,
    AVG(order_totals.OrderTotal) AS AvgOrderValue
FROM (
    SELECT
        o.OrderID,
        mi.TruckID,
        SUM(oi.Quantity * mi.Price) AS OrderTotal
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN MenuItems mi ON oi.ItemID = mi.ItemID
    GROUP BY o.OrderID, mi.TruckID
) AS order_totals
JOIN FoodTruck ft ON order_totals.TruckID = ft.TruckID
GROUP BY ft.TruckName
ORDER BY AvgOrderValue DESC;
