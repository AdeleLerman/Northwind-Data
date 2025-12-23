#1c
select Product, 
	sum(CAST(REPLACE(`Unit Price`, '$', '') AS DECIMAL(10, 2)) *Quantity) 
	as revenue
FROM `order details`
group by Product;

#2d
CREATE VIEW `Top 10 customers by total revenue` AS
SELECT concat(`First Name`, ' ', `Last Name`) AS CustomerName, sum(CAST(REPLACE(`Unit Price`, '$', '') AS DECIMAL(10, 2)) *Quantity) as revenue
FROM customers
JOIN orders ON customers.ID=orders.Customer
JOIN `order details` ON orders.`order ID`=`order details`.`Order ID`
GROUP BY CustomerName
ORDER BY revenue DESC
LIMIT 10;

#3b
Select concat(`First Name`, ' ', `Last Name`) AS CustomerName, count(`Order ID`) AS `Total orders`
FROM customers
JOIN orders ON customers.ID=orders.Customer
GROUP BY CustomerName;

#4a 
SELECT concat(`First Name`, ' ', `Last Name`) AS CustomerName, `Order ID`
FROM customers
JOIN orders ON customers.ID=orders.Customer
WHERE  concat(`First Name`, ' ', `Last Name`) LIKE 'Francisco Pérez-Olaeta';

#5A
SELECT orders.`Order ID`, Product
FROM orders
JOIN `order details` ON orders.`order ID`=`order details`.`Order ID`
ORDER BY orders.`Order ID`;

#6 
select Category, sum(CAST(REPLACE(`Unit Price`, '$', '') AS DECIMAL(10, 2)) *Quantity) as  `Total Sales`
from products
JOIN `order details` ON products.`Product Name` = `order details`.`product` 
JOIN `orders` ON `order details`.`Order ID` = orders.`order ID`
group by Category;

