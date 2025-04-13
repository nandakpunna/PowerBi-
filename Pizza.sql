
select sum(total_price)as Total_revenue
from pizza_sales


select sum(total_price)/ count(DISTINCT Order_id) as Avg_Order_Value
from pizza_sales

select sum(quantity) as pizza_sold
from pizza_sales

select count(distinct Order_id) as Total_orders
from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct Order_id)as decimal(10,2))as decimal(10,2)) AS Avg_Pizza_Per_Order
from pizza_sales
-----Daily Trend
select DATENAME(DW,order_date)as order_Day,count(Distinct order_id) as Total_ord
from pizza_sales
group by DATENAME(DW,order_date) 

----Monthly Trend
select DATENAME(Month,order_date)as Month_Name,count(Distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(Month,order_date) 

---Persentage of sales category
select pizza_category,sum(total_price) as Total_sales,sum(total_price) * 100 / (select sum(total_price)from pizza_sales where month(order_date)= 1) As PCT
from pizza_sales 
where month(order_date)= 1
group by pizza_category


---Persentage of sales by pizza size
select pizza_category,cast(sum(total_price) AS Decimal(10,2)) as Total_sales,cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2)) As PCT
from pizza_sales 
where datepart(quarter,order_date)=1
group by pizza_category
order by PCT DESC

---------Pizza name total sales top 5
select top 5 (pizza_name),cast(SUM(Total_price) as decimal(10,2)) As Total_Revenue
from pizza_sales 
Group by pizza_name
order by Total_Revenue desc

---------Pizza name total sales bottom 5
select top 5 (pizza_name),cast(SUM(Total_price) as decimal(10,2)) As Total_Revenue
from pizza_sales 
Group by pizza_name
order by Total_Revenue asc

--Pizza sales by quantity top 5
select top 5 (pizza_name),cast(SUM(quantity) as decimal(10,2)) As Total_Revenue
from pizza_sales 
Group by pizza_name
order by Total_Revenue desc

--Pizza sales by bottom  5
select top 5 (pizza_name),cast(SUM(quantity) as decimal(10,2)) As Total_Revenue
from pizza_sales 
Group by pizza_name
order by Total_Revenue asc
----Top 5 best seeling pizzas with total orders
select top 5 (pizza_name),count(Distinct order_id) As Total_Orders
from pizza_sales 
Group by pizza_name
order by Total_Orders desc

----bottom 5 best seeling pizzas with total orders
select top 5 (pizza_name),count(Distinct order_id) As Total_Orders
from pizza_sales 
Group by pizza_name
order by Total_Orders asc