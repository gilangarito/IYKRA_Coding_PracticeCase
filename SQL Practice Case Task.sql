/*
Answer number 1
*/
select count(film_id)
from film
where fulltext @@ to_tsquery('astronaut') 

/*
Answer number 2
*/
select count(film_id)
from film
where rating = 'R' and replacement_cost between 5 and 15

/*
Answer number 3 
*/
select staff_id, count(payment_id) as "Payments Count", sum(amount) as "Total amount(in $)" 
from payment
group by staff_id 

/*
Answer number 4 
*/
select rating , cast(avg(replacement_cost) as decimal(20,2)) as "Average replacement cost (in $)"
from film
group by rating 

/*
Answer number 5 
*/
select concat(c.first_name, ' ', c.last_name) "Full Name", c.email , sum(p.amount) as "Sum Amount" 
from customer c inner join payment p 
on c.customer_id = p.customer_id 
group by c.customer_id 
order by sum(p.amount) desc
limit 5

/*
Answer number 6 
*/
select i.store_id, f.title, count(i.film_id) 
from inventory i inner join film f on i.film_id = f.film_id 
group by i.store_id, f.title 
order by i.store_id asc , f.title

/*
Answer number 7 
*/
select concat(c.first_name, ' ', c.last_name) "Full Name", c.email, count(p.payment_id) as "Total Payment"
from customer c inner join payment p on c.customer_id = p.customer_id 
group by c.customer_id 
having count(p.payment_id) >= 40
order by count(p.payment_id) desc