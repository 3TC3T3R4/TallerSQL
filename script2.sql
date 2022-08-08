USE TALLERSQL;

#CONSULTA1

SELECT * from sale;
SELECT * FROM client;
SELECT *FROM PRODUCT;


SELECT  pro.name as ProductBuy FROM  sale s
INNER JOIN client cl
ON s.client_id_client = cl.id_client
INNER JOIN product pro
ON s.product_id_product = pro.id_product
WHERE cl.type_id = 'C.C' and cl.id_number = '1017257394';


#CONSULTA 2

SELECT * from product_supplier;
SELECT * FROM SUPPLIER;
SELECT *FROM PRODUCT;

SELECT  s.name as supplierName, pro.name as Product FROM   product_supplier ps
INNER JOIN supplier s
ON ps.supplier_id_supplier = s.id_supplier
INNER JOIN product pro 
ON ps.product_id_product = pro.id_product
WHERE pro.name = 'Wafer'