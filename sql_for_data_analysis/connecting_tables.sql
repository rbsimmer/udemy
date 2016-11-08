#list by film name, category, and language
SELECT
	f.title, c.name, l.name
FROM
	film f, language l, film_category fc, category c
WHERE
	f.film_id = fc.film_id
	and c.category_id = fc.category_id
	and f.language_id = l.language_id
;