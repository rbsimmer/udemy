#Number of rentals in Comedy, Sports, and Family
SELECT
	c.name as category,
	count(r.rental_id) as num_rentals
FROM
	rental r,
	inventory i,
	film f,
	film_category fc,
	category c
WHERE
	r.inventory_id = i.inventory_id,
	and i.film_id = f.film_id
	and f.film_id = fc.film_id
	and fc.category_id = c.category_id
	and c.name in ("Comedy", "Sports", "Family")
GROUP BY 
	1
;

#comparison operators (<, >, >=, <=, =, <>, !=)
#user's who have rented at least 3 times
SELECT
	r.customer_id as customer,
	count(r.rental_id) as num_rentals
FROM
	rental r
GROUP BY 1
HAVING count(r.rental_id) >= 3
;

/*how much revenue has one single store made over 
PG-13 and R-Rated films*/
SELECT
	i.store_id as store,
	f.rating as movie_rating,
	sum(p.amount) as store_revenue
FROM
	film f, 
	rental r, 
	inventory i,
	payment p
WHERE
	p.rental_id = r.rental_id
		AND f.film_id=i.film_id
		AND i.inventory_id=r.inventory_id
		AND i.store_id = 1
		AND f.rating in ('R', 'PG-13')
		AND r.rental_date between '2005-06-08' AND '2005=07-19'
GROUP BY
	1, 2
ORDER BY
	3 desc
;
