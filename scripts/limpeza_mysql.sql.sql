CREATE DATABASE comportamentos_de_compra;
USE comportamentos_de_compra;
SELECT * FROM comportamentos_de_compra;

START TRANSACTION;
 
-- alterar nome das colunas da tabela
ALTER TABLE comportamentos_de_compra
RENAME COLUMN `Customer ID` TO Customer_ID,
RENAME COLUMN `Purchase Amount (USD)` TO Purchase_Amount_USD,
RENAME COLUMN `Review Rating` TO Review_Rating,
RENAME COLUMN `Subscription Status` TO Subscription_Status,
RENAME COLUMN `Shipping_Tipe` TO Shipping_Type,
RENAME COLUMN `Discount Applied` TO Discount_Applied,
RENAME COLUMN `Promo Code Used` TO Promo_Code_Used,
RENAME COLUMN `Previous Purchases` TO Previous_Purchases,
RENAME COLUMN `Frequency of Purchases` TO Frequency_of_Purchases,
RENAME COLUMN `Payment Method` TO Payment_Method;

 
 -- verificação de dados nulos em cada coluna
SELECT 
    SUM(CASE WHEN Gender IS NULL OR Gender = '' THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN Age IS NULL OR Age <= 0 THEN 1 ELSE 0 END) AS invalid_age,
    SUM(CASE WHEN Item_Purchased IS NULL OR Item_Purchased = '' THEN 1 ELSE 0 END) AS invalid_Item_Purchased,
    SUM(CASE WHEN Category IS NULL OR Category = '' THEN 1 ELSE 0 END) AS invalid_Category,
    SUM(CASE WHEN Purchase_Amount_USD IS NULL OR Purchase_Amount_USD = '' THEN 1 ELSE 0 END) AS invalid_Purchase_Amount,
    SUM(CASE WHEN Location IS NULL OR Location = '' THEN 1 ELSE 0 END) AS invalid_Location,
    SUM(CASE WHEN Size IS NULL OR Size = '' THEN 1 ELSE 0 END) AS invalid_Size,
    SUM(CASE WHEN Color IS NULL OR Color = '' THEN 1 ELSE 0 END) AS invalid_Color,
    SUM(CASE WHEN Season IS NULL OR Season = '' THEN 1 ELSE 0 END) AS invalid_Season,
    SUM(CASE WHEN Review_Rating IS NULL OR Review_Rating <= 0 THEN 1 ELSE 0 END) AS invalid_Review_Rating,
    SUM(CASE WHEN Subscription_Status IS NULL OR Subscription_Status = '' THEN 1 ELSE 0 END) AS invalid_Subscription_Status,
    SUM(CASE WHEN Shipping_Type IS NULL OR Shipping_Type = '' THEN 1 ELSE 0 END) AS invalid_Shipping_Type,
    SUM(CASE WHEN Discount_Applied IS NULL OR Discount_Applied = '' THEN 1 ELSE 0 END) AS invalid_Discount_Applied,
    SUM(CASE WHEN Promo_Code_Used IS NULL OR Promo_Code_Used = '' THEN 1 ELSE 0 END) AS invalid_Promo_Code_Used,
    SUM(CASE WHEN Previous_Purchases IS NULL OR Previous_Purchases <= 0 THEN 1 ELSE 0 END) AS invalid_Previous_Purchases, 
    SUM(CASE WHEN Payment_Method IS NULL OR Payment_Method < 0 THEN 1 ELSE 0 END) AS invalid_Payment_Method,
    SUM(CASE WHEN Frequency_of_Purchases IS NULL OR Frequency_of_Purchases = '' THEN 1 ELSE 0 END) AS invalid_Frequency_of_Purchases
FROM comportamentos_de_compra;

-- descrição das colunas da tabela
DESCRIBE comportamentos_de_compra;

-- altera o nome de uma coluna
ALTER TABLE comportamentos_de_compra
CHANGE COLUMN `Item Purchased` Item_Purchased TEXT;

-- modifica o tipo de uma coluna
ALTER TABLE comportamentos_de_compra
MODIFY COLUMN Item_Purchased TEXT;


-- Desliga o Safe Update Mode temporariamente.= 0, depois = 1 para liga-lo novamente
SET SQL_SAFE_UPDATES = 0;
-- Padronizar valores de gênero
UPDATE comportamentos_de_compra
SET Gender = 'Male'
WHERE Gender IN ('M', 'male');

SET SQL_SAFE_UPDATES = 1;


SET SQL_SAFE_UPDATES = 0;
-- Padronizar valores de gênero
UPDATE comportamentos_de_compra
SET Gender = 'Female'
WHERE Gender IN ('F', 'female');

SET SQL_SAFE_UPDATES = 1;

-- verificar as opções de respostas de cada coluna com o total de cada uma com ordem asc
SELECT Age, COUNT(*) AS total
FROM comportamentos_de_compra
GROUP BY Age
ORDER BY Age ASC;

SELECT * FROM comportamentos_de_compra;

-- verificar as opções de respostas de cada coluna com o total de cada uma
SELECT Frequency_of_Purchases, COUNT(*) AS total
FROM comportamentos_de_compra
GROUP BY Frequency_of_Purchases;

ALTER TABLE shopping_behaviour ADD COLUMN Age_Group VARCHAR(20);

-- criando coluna
ALTER TABLE comportamentos_de_compra
ADD COLUMN Age_Group INT;

-- modificando tipo da coluna age_group para varchar(10)
ALTER TABLE comportamentos_de_compra
MODIFY COLUMN Age_Group VARCHAR(10);

-- adicionando faixas etárias na coluna age_group
UPDATE comportamentos_de_compra
SET Age_Group = CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 30 THEN '26-30'
    WHEN Age BETWEEN 31 AND 35 THEN '31-35'
    WHEN Age BETWEEN 36 AND 40 THEN '36-40'
    WHEN Age BETWEEN 41 AND 45 THEN '41-45'
    WHEN Age BETWEEN 46 AND 50 THEN '46-50'
    WHEN Age BETWEEN 51 AND 55 THEN '51-55'
    WHEN Age BETWEEN 56 AND 60 THEN '56-60'
    WHEN Age BETWEEN 61 AND 65 THEN '61-65'
    ELSE '66+' END;


CREATE OR REPLACE VIEW vw_clientes_limpos AS
SELECT 
    Customer_ID,
    Age,
    Gender,
    Item_Purchased,
    Category,
    Purchase_Amount_USD,
    Location,
    Size,
    Color,
    Season,
    Review_Rating,
    Subscription_Status,
    Shipping_Type,
    Discount_Applied,
    Promo_Code_Used,
    Previous_Purchases,
    Payment_Method,
    Frequency_of_Purchases,
    Age_Group
FROM comportamentos_de_compra;
