create database Pharma_Analysis;
use Pharma_Analysis;

SELECT * FROM pharma_products;

SELECT COUNT(*) AS Total_Products FROM pharma_products;

SELECT product_id, COUNT(*) FROM pharma_products GROUP BY product_id HAVING COUNT(*) > 1;
SELECT COUNT(*) AS Total_Products FROM pharma_products;
SELECT DISTINCT brand_name FROM pharma_products;
SELECT brand_name,COUNT(*) AS Total_Products FROM pharma_products GROUP BY brand_name ORDER BY Total_Products DESC;
SELECT manufacturer, COUNT(*) AS Total_Products FROM pharma_products GROUP BY manufacturer ORDER BY Total_Products DESC;
SELECT country,COUNT(*) AS Total_Products FROM pharma_products GROUP BY country ORDER BY Total_Products DESC;
SELECT ROUND(AVG(price), 2) AS Average_Price FROM pharma_products;
SELECT MAX(price) AS Highest_Price, MIN(price) AS Lowest_Price FROM pharma_products;
SELECT brand_name, ROUND(AVG(final_price), 2) AS Average_Final_Price FROM pharma_products GROUP BY brand_name ORDER BY Average_Final_Price DESC;
SELECT availability_status, COUNT(*) AS Total_Products FROM pharma_products GROUP BY availability_status;
SELECT product_id, brand_name, generic_name, manufacturer, final_price, availability_status FROM pharma_products WHERE availability_status = 'Out of stock';
SELECT brand_name, ROUND(AVG(rating), 2) AS Average_Rating FROM pharma_products GROUP BY brand_name ORDER BY Average_Rating DESC;
SELECT product_id, brand_name, generic_name, rating, num_reviews FROM pharma_products ORDER BY rating DESC, num_reviews DESC LIMIT 10;
SELECT ROUND(SUM(price - final_price), 2) AS Total_Discount FROM pharma_products;
SELECT ROUND(AVG(discount_percent), 2) AS Average_Discount_Percent FROM pharma_products;
SELECT brand_name, ROUND(AVG(discount_percent), 2) AS Average_Discount FROM pharma_products GROUP BY brand_name ORDER BY Average_Discount DESC;
SELECT product_id, brand_name, price, discount_percent, final_price FROM pharma_products WHERE discount_percent > 10;

