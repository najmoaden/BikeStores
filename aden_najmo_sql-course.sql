/* Select all brands (TASK - Modify header:Brand )*/
SELECT brand_name AS Brand FROM production.brands;


/* Customers from Bronx and Brooklyn (TASK - Modify headers:
Cust ID, Last name, First name, Email, Street Address, City, State
Order by City and Last name)*/

SELECT * FROM sales.customers;

SELECT 
	customer_id AS "Cust ID",	
	last_name AS "Last name" ,
	first_name AS "First name" ,
	email AS "Email" ,
	street AS "Street Address" ,
	city AS "City"
FROM sales.customers 
WHERE city ='Bronx' OR city ='Brooklyn'
ORDER BY city, last_name;

/* All Products, brand should be readable not id (TASK - Modify headers:
Product name, Brand, Model, Price. Then order by Product name, descending order)*/

SELECT * FROM production.products;
SELECT * FROM production.brands;

SELECT 
	p.product_name AS "Product name",
	b.brand_name AS 'Brand',
	p.model_year AS 'Model',
	p.list_price AS 'Price'
FROM production.products AS p
JOIN production.brands AS b ON p.brand_id=b.brand_id
;
/* Use SQL COUNT() function to get number of customers who are from state NY (TASK - Modify header: NY Customers)*/

SELECT COUNT(*) AS " NY Customer" 
FROM sales.customers WHERE state='NY';

/*All products that Pamela Henry from Bronx NY has ordered.
Brand should be readable not id (TASK - Modify headers: Product name, Brand, Price)*/

SELECT * FROM production.products;
SELECT * FROM production.brands;
SELECT * FROM sales.orders;
SELECT * FROM sales.order_items;

SELECT * FROM sales.orders WHERE customer_id=57;



SELECT 
	p.product_name AS "Product name",
	b.brand_name AS Brand,
	p.list_price AS Price
FROM 
	production.products AS p
		JOIN production.brands AS b
			ON b.brand_id=p.brand_id
		JOIN sales.order_items AS i
			ON i.product_id =p.product_id
		JOIN sales.orders AS o
			ON o.order_id=i.order_id
		JOIN sales.customers AS c 
			ON c.customer_id=o.customer_id
WHERE 
	c.customer_id=57;
