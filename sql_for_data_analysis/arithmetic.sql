#revenue per video title
SELECT
	f.title as "Film Title", 
	count(r.rental_id) as "# Rentals", 
	f.rental_rate as "Price", 
	count(r.rental_id) * f.rental_rate as Revenue
FROM
	film f, rental r, inventory i
WHERE
	f.film_id=i.film_id
		AND i.inventory_id=r.inventory_id
GROUP BY
	1
ORDER BY
	4 desc
;

# SUM
# what customer has paid us the most money
SELECT
	p.customer_id,
	c.first_name,
	c.last_name, 
	sum(p.amount) as "Total Payments"
FROM
	payment p,
	customer c
WHERE
	p.customer_id = c.customer_id
GROUP BY
	1
ORDER BY
	4 desc
;

#What store has historically brought in the most revenue
SELECT	
	i.store_id as "Store ID",
	sum(p.amount) as Revenue
FROM
	payment p, 
	rental r, 
	inventory i
WHERE
	p.rental_id=r.rental_id
		AND r.inventory_id=i.inventory_id
GROUP BY
	1
ORDER BY
	2 desc
;