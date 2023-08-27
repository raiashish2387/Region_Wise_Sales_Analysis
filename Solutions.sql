
## Retrieve the sales revenue for each product, along with the maximum revenue achieved for each product across all sales.

select p.product_id,p.product_name, s.sale_date, s.revenue,
sum(s.revenue) over (partition by s.product_id order by s.sale_date)
from sales as s
join products as p on p.product_id = s.product_id;

##Calculate the average revenue for each product, considering only the three most recent sales for each product.
select p.product_id,p.product_name, s.sale_date, s.revenue,
avg(s.revenue) over (partition by s.product_id order by s.sale_date DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as avg_revenue
from sales as s
join products as p on p.product_id = s.product_id;

 ##Calculate the difference in revenue between each sale and the previous sale for each product, sorted by product and sale date.

select product_id,revenue,sale_date,
revenue - lag(revenue) over(partition by product_id order by sale_date) as rev_diff
from sales;

##Retrieve the sales revenue for each product, along with the cumulative revenue for each product over time.
select product_id,revenue,sale_date,
 sum(revenue) over(partition by product_id order by sale_date) as cum_revenue
from sales;

## Rank the sales regions based on the total revenue generated, and display the top three regions along with their respective total revenue.


select region, total_revenue
from
(select region, sum(revenue) as total_revenue,
rank() over ( order by sum(revenue) desc ) as region_rank
from sales
group by 1) as ranked_reg
WHERE region_rank <= 3;
