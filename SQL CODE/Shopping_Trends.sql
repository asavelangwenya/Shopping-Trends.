SELECT  TOP 5 *
FROM [C:asavela].dbo.shopping_trends_with_processdate
;

-- CUSTOMER SEGMENTATION BY GENDER
Select Gender,
	   Count(*) As Gender_Count
FROM  [C:asavela].dbo.shopping_trends_with_processdate
Group by Gender;

-- MOST PURCHASED ITEM
SELECT Item_Purchased,
	   COUNT(*) AS Total_Number_of_Items_Purchased
FROM  [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Item_Purchased
ORDER BY COUNT(*) DESC

-- CHECKING THE MOST PUCRHASED CATEGORY
SELECT Category,
	   Count(*) AS Total_Number_Of_Items
FROM [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Category
ORDER BY Count(*) DESC;

-- TOTAL PURCHASE AMOUNT PER CATEGORY
SELECT Category,Location,
       SUM(Purchase_Amount_USD) AS Total_Purchase_Amount
FROM [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Category,Location
ORDER BY SUM(Purchase_Amount_USD) DESC;

-- GROUPING BY AGE TO SEE THE AGE GROUP OF OUR MOST LOYAL CUSTOMERS
WITH Age as (
SELECT 
	CASE
		WHEN Age BETWEEN 18 AND 30 THEN 'Youth' 
		WHEN Age BETWEEN 31 AND 40 THEN 'Adult' 
		WHEN Age BETWEEN 41 AND 50 THEN 'Senior' 
	ELSE 'Elder'
END AS Age_Grouping
FROM [C:asavela].dbo.shopping_trends_with_processdate
)
SELECT 	Age_Grouping,COUNT(*) AS Customers_by_age
FROM Age
GROUP BY Age_Grouping
ORDER BY COUNT(*) DESC

-- THE MOST CONSISTENT PRODUCT SIZE
SELECT Size, COUNT(*) As Total_Number_of_Products_Sold
FROM [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Size
ORDER BY COUNT(*) DESC

-- REVENUE BY LOCATION
SELECT Location,SUM(Purchase_Amount_USD) AS Total_Purchases_Per_Location
FROM [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Location
ORDER BY SUM(Purchase_Amount_USD) DESC

-- ITEM PURCHASES BY SEASON
SELECT Item_Purchased,Season,COUNT(*) Total_Purchases_by_season
FROM [C:asavela].dbo.shopping_trends_with_processdate
GROUP BY Item_Purchased,Season
ORDER BY COUNT(*) DESC

-- TIME/DATE ANALYSIS
SELECT Shipping_Type,CAST(processdate AS DATE) AS Date,CAST(processdate AS TIME) AS Time
FROM [C:asavela].dbo.shopping_trends_with_processdate



