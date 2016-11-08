# WHERE example
SELECT
	ac.customer_id,
	ac.fav_color,
	rc.num_purchases
FROM
	active_customer ac,
	reward_customer rc
WHERE
	ac.customer_id = rc.customer_id
;

# JOIN example
SELECT
	ac.customer_id,
	ac.fav_color,
	rc.num_purchases
FROM
	active_customer ac 
		JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

# Left JOIN
# places NULL in right table entries without entries
SELECT
	ac.customer_id,
	ac.fav_color,
	rc.num_purchases
FROM
	active_customer ac 
		LEFT JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

# Right JOIN
# places NULL in left table entries without entries
SELECT
	ac.customer_id,
	ac.fav_color,
	rc.num_purchases
FROM
	active_customer ac 
		RIGHT JOIN reward_customer rc ON ac.customer_id = rc.customer_id
;

# JOIN example 
# Query all active customers and return all columns from the customer table and their phone number
SELECT
	c.*,  		# returns all columns in customer table
	a.phone
FROM
	customer c 
		JOIN address a ON c.address_id = a.address_id
WHERE
	c.active = 1
;

/*
	At least 30 rentals
	customer_id, number of rentals, and last rental date
*/
create temporary table rewardUsers
SELECT
	r.customer_id,
	count(r.rental_id) as num_rentals,
	max(rental_date)
FROM
	rental r 
GROUP BY 1
HAVING num_rentals >= 30
;
