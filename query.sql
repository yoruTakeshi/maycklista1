USE ecommerce_22b;

-- 1.

SELECT order_id, order_date, CONCAT(first_name, ' ', last_name) as name, email
FROM Orders JOIN Customers
ON Orders.customer_id = Customers.customer_id
;

-- 2.

SELECT product_name, quantity, customer_id
FROM Products JOIN Order_Items
ON Products.product_id = Order_Items.product_id
JOIN Orders
ON Order_Items.order_id = Orders.order_id
WHERE customer_id = 1
;

-- 3.

SELECT CONCAT(first_name, ' ', last_name) as name, SUM(price*quantity)
FROM Customers JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY name
;

-- 4.

SELECT CONCAT(first_name, ' ', last_name) as name
FROM Customers LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE order_id IS null
;

-- 5.

SELECT product_name, SUM(quantity) as total
FROM Order_Items JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY product_name
ORDER BY total DESC



