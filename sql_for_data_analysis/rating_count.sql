#Which rating do we have the most films in?
SELECT
	rating, count(film_id)
FROM
	film
GROUP BY
	1
;

#Which rating is most prevelant in each price(use only 1 query)?
SELECT
	rating, rental_rate, count(film_id)
FROM
	film
GROUP BY
	1, 2
;
