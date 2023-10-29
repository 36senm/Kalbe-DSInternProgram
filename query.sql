
-- average age marital status
select c."Marital Status", round(avg("Age")) as age_marital_avg 
from "Customer" c 
where c."Marital Status" is not null and length(c."Marital Status") > 0
group by "Marital Status"

-- average age gender based
select 
case when "Gender"  = '0' then 'Wanita' 
	 when "Gender"  = '1' then 'Pria' 
	 else 'private'
end as "gender", round(avg(c."Age")) as gender_age_avg
from "Customer" c 
where "Gender" is not null
group by "gender" 

-- store has highest quantity 
select s."StoreName", sum(t."Qty") as total_qty
from "Store" s 
join "Transaction" t on s."StoreID" = t."StoreID" 
group by s."StoreName" order by total_qty desc  
limit 1

-- product has highest total ammount sold

select p."Product Name", sum(t."TotalAmount") as TA_sold
from "Transaction" t 
join "Product" p on p."ProductID" = t."ProductID"
group by p."Product Name"
order by ta_sold desc 
limit 1

