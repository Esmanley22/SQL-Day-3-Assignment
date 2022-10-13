--1
select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

--2
select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by amount asc;


--3
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount
	having amount > 175
	order by amount desc
)
group by store_id, first_name, last_name;

--4
select customer.first_name, customer.last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Nepal';


--5
select staff_id, first_name, last_name
from staff
where staff_id in (
	select staff_id 
	from payment 
	group by staff_id, amount
	order by amount
)
group by staff_id, first_name, last_name;


--6
select rating, count(rating)
from film
group by rating;

--7
select *
from customer
where customer_id in (
	select customer_id
	from payment
	group by amount, customer_id
	having amount > 6.99
	order by amount asc
);

--8

select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount
	having amount <= 0
	order by amount desc
)
group by store_id, first_name, last_name;
