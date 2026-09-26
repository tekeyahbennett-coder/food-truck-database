-- Seed data for the Food Truck Relational Database
-- Run this after schema.sql to populate all five tables with sample data.

-- ============================================
-- FoodTruck
-- ============================================
INSERT INTO FoodTruck (TruckName, CuisineType) VALUES
('Taco Fiesta', 'Mexican'),
('Burger Bliss', 'American'),
('Noodle House', 'Asian'),
('Slice of Heaven', 'Italian');

-- ============================================
-- MenuItems
-- (TruckID references the insert order above: 1=Taco Fiesta, 2=Burger Bliss,
--  3=Noodle House, 4=Slice of Heaven)
-- ============================================
INSERT INTO MenuItems (ItemName, Price, TruckID) VALUES
('Carne Asada Taco', 3.50, 1),
('Al Pastor Taco', 3.50, 1),
('Chicken Quesadilla', 7.00, 1),
('Horchata', 2.50, 1),
('Classic Cheeseburger', 8.50, 2),
('Bacon Double Burger', 10.00, 2),
('Crispy Fries', 3.75, 2),
('Milkshake', 4.50, 2),
('Pad Thai', 9.00, 3),
('Beef Ramen', 10.50, 3),
('Spring Rolls', 5.00, 3),
('Bubble Tea', 4.75, 3),
('Margherita Slice', 4.00, 4),
('Pepperoni Slice', 4.50, 4),
('Garlic Knots', 3.00, 4),
('Italian Soda', 3.25, 4);

-- ============================================
-- Customers
-- ============================================
INSERT INTO Customers (FirstName, LastName) VALUES
('Maria', 'Lopez'),
('James', 'Carter'),
('Aisha', 'Johnson'),
('Kevin', 'Nguyen'),
('Priya', 'Patel'),
('Daniel', 'Kim');

-- ============================================
-- Orders
-- (CustomerID references the insert order above)
-- ============================================
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2026-08-01 12:15:00'),
(2, '2026-08-01 12:40:00'),
(3, '2026-08-02 18:05:00'),
(1, '2026-08-03 13:00:00'),
(4, '2026-08-04 19:20:00'),
(5, '2026-08-05 12:50:00'),
(6, '2026-08-06 20:10:00'),
(2, '2026-08-07 12:30:00');

-- ============================================
-- OrderItems
-- (OrderID and ItemID reference the insert order above)
-- ============================================
INSERT INTO OrderItems (OrderID, ItemID, Quantity) VALUES
-- Order 1 (Maria @ Taco Fiesta)
(1, 1, 3),
(1, 4, 1),
-- Order 2 (James @ Burger Bliss)
(2, 5, 1),
(2, 7, 1),
(2, 8, 1),
-- Order 3 (Aisha @ Noodle House)
(3, 9, 1),
(3, 11, 2),
-- Order 4 (Maria @ Slice of Heaven)
(4, 13, 2),
(4, 15, 1),
-- Order 5 (Kevin @ Noodle House)
(5, 10, 1),
(5, 12, 1),
-- Order 6 (Priya @ Taco Fiesta)
(6, 2, 2),
(6, 3, 1),
-- Order 7 (Daniel @ Burger Bliss)
(7, 6, 1),
(7, 7, 2),
-- Order 8 (James @ Slice of Heaven)
(8, 14, 3),
(8, 16, 1);
