use Retail
select * from Retail_Data;

--Total Revenue & Profit
SELECT 
SUM(Sales) AS Total_Revenue,
SUM(Profit) AS Total_Profit
FROM Retail_Data;

--Top Revenue Products
select Product,
sum(Sales) as Total_Revenue
from Retail_Data
Group By Product
Order By Total_Revenue desc;

--Loss Product List
select product,
sum(Profit) as Profit
from Retail_Data
Group by Product
Having sum(Profit) < 0;

--Region wise Revenue and Profit
select Region,
sum(Sales) as Revenue,
sum(Profit) as Profit
from Retail_Data
Group By Region
order By Revenue desc;

--Category wise Revenue and Profit
SELECT Category,
SUM(Sales) AS Revenue,
SUM(Profit) AS Profit
FROM retail_data
GROUP BY Category;

--Discount Impact on Profit
SELECT Discount,
AVG(Profit) AS Avg_Profit
FROM retail_data
GROUP BY Discount
ORDER BY Discount;

--Top Customers by Revenue
select Customer,
sum(Sales) as Revenue
from Retail_Data
Group by Customer
Order by Revenue desc;

--Average of Order Value
select avg(Sales) as Order_Value
from Retail_Data;


--Quantity Sold by Category
select Category,
sum(Quantity) As Quntity_Sold
from Retail_Data
Group by Category
order by Quntity_Sold desc;

select * from Retail_Data;