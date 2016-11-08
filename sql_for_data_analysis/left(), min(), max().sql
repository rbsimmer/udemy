#left(), min(), max()

#how many rentals we had each month
SELECT
	left(r.rental_date, 7), count(r.rental_id)
FROM
	rental r
GROUP BY
	1
ORDER BY
	2 desc
;

#When was the last and first rental date of a film
SELECT
	f.title as "Film Title", 
	max(r.rental_date) as "Last Rental Date", 
	min(r.rental_date) as "First Rental Date"
FROM
	rental r,
	inventory i,
	film f
WHERE
	r.inventory_id = i.inventory_id
		and i.film_id = f.film_id
GROUP BY
	f.film_id
;

#every customer's last rental date
SELECT
	concat(c.first_name, " ", c.last_name) as name,
	c.email as email, 
	max(r.rental_date) as last_rental_date
FROM
	rental r,
	customer c
WHERE
	r.customer_id = c.customer_id
GROUP BY
	c.customer_id
;

#revenue by each month
SELECT
	left(p.payment_date, 7) as "Month", 
	sum(p.amount) as "Monthly Revenue"
FROM
	payment p
GROUP BY
	1
;