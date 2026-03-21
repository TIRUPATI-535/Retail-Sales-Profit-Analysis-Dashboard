use project;
select * from retail_data;

select count(*) from retail_data;

-- Total Revenue & Profit
select Sales ,Profit ,
sum(Sales) over(order by Sales)  AS Total_Revenue,
sum(Profit) over(order by Profit)  AS Total_Profit
from retail_data;

-- Top Revenue Products
select Product,
 sum(Sales) as Total_Revenue 
 from retail_data
 Group By Product 
 Order By Total_Revenue desc;
 
 -- Product wist Profit 
with Product_Profit as (
  select Product,
  sum(Profit) over (partition by Product order by Profit desc) as Profit
  from retail_data
)
select * from Product_Profit;

-- Loss Product List
select product,
sum(Profit) as Profit
from retail_data
Group by Product
Having sum(Profit) < 0;

-- Region wise Revenue and Profit
select Region,
sum(Sales) over(partition by Region order by Sales) as Revenue,
sum(Profit) over(partition by Region order by Profit)as Profit
from retail_data;

-- Category wise Revenue and Profit
SELECT Category,
SUM(Sales) AS Revenue,
SUM(Profit) AS Profit
FROM retail_data
GROUP BY Category;

-- Sales Trend 
SELECT Date,
       SUM(Sales) AS Daily_Sales,
       LAG(SUM(Sales)) OVER(ORDER BY Date) AS Previous_Day_Sales
FROM retail_data
GROUP BY Date;

-- Top Customers by Revenue
select Customer,
sum(Sales) as Revenue
from retail_data
Group by Customer
Order by Revenue desc;

-- Average of Order Value
select avg (Sales) as Order_Value
from retail_data;

-- Category wise Quantity
select Category,
sum(Quantity) As Quntity_Sold
from retail_data
Group by Category
order by Quntity_Sold desc;

select * from retail_data;