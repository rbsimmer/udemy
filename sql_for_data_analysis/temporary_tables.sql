#Rentals per User
drop temporary table if exists rentals_per_customer;
create temporary table rentals_per_customer
SELECT
	r.customer_id as customer_id, 
	count(r.customer_id) as num_rentals,
	sum(p.amount) as customer_revenue
FROM
	rental r,
	payment p
WHERE
	r.rental_id = p.rental_id
GROUP BY
	1
;

#Revenue by Users who rented X number of videos
SELECT
	rpc.num_rentals,
	sum(rpc.customer_revenue) as total_revenue,
	count(rpc.customer_id) as num_customers
FROM
	rentals_per_customer rpc
GROUP BY
	1
;

#BRAINBUSTER
#Revenue by Actor - actor's name, revenue of films they were in

#Revenue per film
drop temporary table if exists revenue_per_film;
create temporary table revenue_per_film
SELECT
	f.film_id as film_id,
	f.rental_rate * count(r.rental_id) as film_revenue
FROM
	film f,
	rental r,
	inventory i
WHERE
	r.inventory_id=i.inventory_id
		and i.film_id=f.film_id
GROUP BY 1
;

#Connect actor to film revenue
SELECT
	a.actor_id, 
	concat(a.first_name, " ", a.last_name) as actor_name,
	sum(rpf.film_revenue) as revenue_per_actor
FROM
	actor a,
	revenue_per_film rpf,
	film_actor fa
WHERE
	a.actor_id=fa.actor_id
		and fa.film_id=rpf.film_id
GROUP BY 1
;