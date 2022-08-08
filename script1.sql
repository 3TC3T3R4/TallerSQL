#CREAMOS LA BASE DE DATOS
CREATE DATABASE TALLERSQL;
 
#SELECIONAMOS LA BASE DE DATOS 
USE tallersql;

#CREACION DE TABLAS 
CREATE TABLE IF NOT EXISTS Supplier(
id_supplier INT,
id_number VARCHAR(15) NOT NULL,
name VARCHAR(15) NOT NULL,
PRIMARY KEY(id_supplier)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Product(
id_product INT,
name VARCHAR(15),
batch INT,
quantity INT,
PRIMARY KEY(id_product)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Seller(
id_seller INT NOT NULL,
id_number INT NOT NULL,
name varchar(15),
PRIMARY KEY(id_seller)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Client(
id_client INT NOT NULL,
id_number INT NOT NULL,
type_id varchar(10),
name varchar(15),
PRIMARY KEY(id_client)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Product_Supplier(
id_product_supplier INT NOT NULL,
supplier_id_supplier INT NOT NULL,
product_id_product INT NOT NULL,
PRIMARY KEY(id_product_supplier),
CONSTRAINT fksupplier_id_supplier
FOREIGN KEY(supplier_id_supplier)
REFERENCES Supplier(id_supplier),
CONSTRAINT fkproduct_id_product
FOREIGN KEY(product_id_product)
REFERENCES Product(id_product)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Sale(
id_seller_product_client INT NOT NULL,
seller_id_seller INT NOT NULL,
product_id_product INT,
client_id_client INT NOT NULL,
way_to_pay VARCHAR(20),
date_sale DATETIME,
PRIMARY KEY (id_seller_product_client),
CONSTRAINT fkseller_id_seller
FOREIGN KEY(seller_id_seller)
REFERENCES Seller(id_seller),
CONSTRAINT fkproduct_id_product2
FOREIGN KEY(product_id_product)
REFERENCES Product(id_product),
CONSTRAINT fkclient_id_client
FOREIGN KEY(client_id_client)
REFERENCES Client(id_client)
)ENGINE=INNODB; 
#INSERTACION DE DATOS EN LAS TABLAS
INSERT INTO Product (id_product,name,batch,quantity)VALUES
(001,'galleta oreo',100,4),
(002,'galleta milo',110,6),
(003,'goma feroz',111,1),
(004,'piaza chocolate',200,3),
(005,'gansito',220,2);
INSERT INTO Supplier (id_supplier,id_number,name)VALUES
(11,1017261348,'Miguel bimbo'),
(22,1017261349,'Adrea bimbo'),
(33,1017261350,'Estevan ramo'),
(44,1017261351,'Santiago nestle'),
(55,1017261352,'Melany noel');
INSERT INTO Product_supplier(id_product_supplier,supplier_id_supplier,product_id_product)VALUES
(00111,11,2),
(00222,44,1),
(00333,22,4),
(00444,55,3),
(00555,33,2);
INSERT INTO Seller(id_seller,id_number,name)VALUES
(999,1017236167,'Mario Campuzano');
INSERT INTO Client (id_client,id_number,type_id,name)VALUES
(0101,1017257394,'C.C','Estevan'),
(0202,1017257943,'C.C','Santiago'),
(0303,1017257375,'C.C','Julina'),
(0404,1017257377,'C.C','Alejandra'),
(0505,1017257384,'C.C','Sofia'),
(0606,1017257324,'C.C','Fabiana');
INSERT INTO SALE(id_seller_product_client,seller_id_seller,product_id_product,client_id_client,way_to_pay,date_sale)VALUES
(9991101,999,1,101,'cash','2021-02-15'),
(9992202,999,2,202,'credit card','2021-06-24'),
(9993303,999,3,303,'cash','2022-05-17'),
(9994404,999,4,404,'cash','2022-05-31'),
(9994505,999,5,505,'credit card','2021-06-22'),
(9995606,999,1,606,'credit card','2022-02-11');


#BORRADO FISICO
DELETE FROM SALE WHERE product_id_product = 5;

DELETE FROM SALE WHERE id_seller_product_client = 9995606;

#BORRADO LOGICO
SELECT * FROM Sale WHERE  YEAR (date_sale) = '2022';
UPDATE Sale set date_sale = '2020-05-31'
WHERE id_seller_product_client = 9994404;
SELECT * FROM Sale WHERE  YEAR (date_sale) = '2022';

SELECT * FROM Sale WHERE way_to_pay = 'cash';
UPDATE Sale set  way_to_pay = 'check'
WHERE id_seller_product_client = 9993303;
SELECT * FROM Sale WHERE way_to_pay = 'cash';

#MODIFICACIONES

UPDATE Product SET name = 'Mrbrown' where id_product = 1; 
UPDATE product_supplier set supplier_id_supplier = 11 WHERE  id_product_supplier = 222;


UPDATE Product SET name = 'wafer' where id_product = 3; 
UPDATE product_supplier set supplier_id_supplier = 44 WHERE  id_product_supplier = 444;


UPDATE Product SET name = 'chocoramo' where id_product = 4; 
UPDATE product_supplier set supplier_id_supplier = 55 WHERE  id_product_supplier = 333;






















