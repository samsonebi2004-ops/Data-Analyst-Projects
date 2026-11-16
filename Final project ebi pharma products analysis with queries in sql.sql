create database PHARMA_ANALYSIS1;
use PHARMA_ANALYSIS1;

CREATE TABLE pharma_products1 (product_id varchar(50) PRIMARY KEY, brand_name VARCHAR(50), generic_name VARCHAR(50), manufacturer VARCHAR(100), dosage_form VARCHAR(50), strength VARCHAR(20), pack_size INT, price DECIMAL(10,2), discount_percent INT, final_price DECIMAL(10,2), is_prescription_required VARCHAR(10), drug_type VARCHAR(30), therapeutic_class VARCHAR(50), storage_condition VARCHAR(30), shelf_life_months INT, country VARCHAR(50), availability_status VARCHAR(30), rating DECIMAL(3,2), num_reviews INT, contains_ai_generated_label VARCHAR(10));

INSERT INTO pharma_products1 (product_id, brand_name, generic_name, manufacturer, dosage_form, strength, pack_size, price, discount_percent, final_price, is_prescription_required, drug_type, therapeutic_class, storage_condition, shelf_life_months, country, availability_status, rating, num_reviews, contains_ai_generated_label) VALUES 
('P00001','HealPlus','Atorvastatin','Global Remedies','Syrup','250mg',15,1788.16,20,1430.53,'Yes','OTC','Antihypertensive','Refrigerated',17,'UK','In stock',2.6,274,'No'),
('P00002','Medix','Paracetamol','ABC Pharma','Syrup','100mg',10,1640.42,20,1312.34,'Yes','OTC','Antacid','Refrigerated',14,'USA','Out of stock',5.0,33,'No'),
('P00003','HealPlus','Paracetamol','Global Remedies','Ointment','250mg',15,1016.76,20,813.41,'No','Prescription','Antibiotic','Room Temp',21,'India','In stock',3.2,404,'Yes'),
('P00004','Medix','Paracetamol','Global Remedies','Tablet','50mg',20,1323.78,0,1323.78,'Yes','OTC','Antacid','Room Temp',13,'Bangladesh','In stock',2.7,116,'Yes'),
('P00005','LifeCare','Metformin','Medicare Ltd','Ointment','50mg',20,652.83,20,522.26,'Yes','Prescription','Antidiabetic','Refrigerated',20,'USA','In stock',3.2,471,'Yes'),
('P00006','BioTrust','Atorvastatin','Nova Life','Tablet','100mg',30,1339.89,20,1071.91,'No','Prescription','Antidiabetic','Room Temp',13,'India','Limited',3.6,337,'Yes'),
('P00007','BioTrust','Paracetamol','Nova Life','Syrup','50mg',20,885.90,5,841.61,'Yes','Prescription','Antacid','Room Temp',14,'Bangladesh','In stock',2.6,407,'No'),
('P00008','HealPlus','Atorvastatin','ABC Pharma','Capsule','50mg',15,722.94,10,650.65,'Yes','OTC','Antidiabetic','Room Temp',16,'Bangladesh','Limited',4.1,133,'No'),
('P00009','Medix','Omeprazole','Nova Life','Tablet','100mg',10,315.02,20,252.02,'No','OTC','Analgesic','Refrigerated',18,'UK','Limited',4.1,282,'Yes'),
('P00010','Medix','Metformin','Medicare Ltd','Ointment','50mg',10,1366.12,5,1297.81,'Yes','Prescription','Antidiabetic','Refrigerated',33,'USA','Out of stock',3.6,118,'Yes');

select * from pharma_products1;

SELECT COUNT(*) AS Total_Products FROM pharma_products1;
SELECT DISTINCT brand_name FROM pharma_products1;
SELECT brand_name, COUNT(*) AS Total_Products FROM pharma_products1 GROUP BY brand_name ORDER BY Total_Products DESC;
SELECT manufacturer, COUNT(*) AS Total_Products FROM pharma_products1 GROUP BY manufacturer ORDER BY Total_Products DESC;
SELECT country, COUNT(*) AS Total_Products FROM pharma_products1 GROUP BY country ORDER BY Total_Products DESC;
SELECT ROUND(AVG(price),2) AS Average_Price FROM pharma_products1;
SELECT MAX(price) AS Highest_Price, MIN(price) AS Lowest_Price FROM pharma_products1;
SELECT brand_name, ROUND(AVG(final_price),2) AS Average_Final_Price FROM pharma_products1 GROUP BY brand_name ORDER BY Average_Final_Price DESC;
SELECT availability_status, COUNT(*) AS Total_Products FROM pharma_products1 GROUP BY availability_status;
SELECT product_id, brand_name, generic_name, manufacturer, final_price, availability_status FROM pharma_products1 WHERE availability_status = 'Out of stock';
SELECT brand_name, ROUND(AVG(rating),2) AS Average_Rating FROM pharma_products1 GROUP BY brand_name ORDER BY Average_Rating DESC;
SELECT product_id, brand_name, generic_name, rating, num_reviews FROM pharma_products1 ORDER BY rating DESC, num_reviews DESC LIMIT 10;
SELECT ROUND(SUM(price - final_price),2) AS Total_Discount FROM pharma_products1;
SELECT ROUND(AVG(discount_percent),2) AS Average_Discount_Percent FROM pharma_products1;
SELECT brand_name, ROUND(AVG(discount_percent),2) AS Average_Discount FROM pharma_products1 GROUP BY brand_name ORDER BY Average_Discount DESC;
SELECT product_id, brand_name, price, discount_percent, final_price FROM pharma_products1 WHERE discount_percent > 10;




