-- Join lecture temporary tables

#All customers from the customer table and their phone number
drop temporary table if exists active_users;
create temporary table active_users
SELECT
	c.*,
	a.phone
FROM
	customer c
		INNER JOIN address a ON c.address_id=a.address_id
WHERE
	c.active=1
GROUP BY 1
;

/*
At least 30 rentals
*/
drop temporary table if exists reward_users;
create temporary table reward_users
SELECT
	r.customer_id,
	count(r.rental_id) as num_rentals,
	max(r.rental_date)
FROM
	rental r
GROUP BY 1
HAVING num_rentals >= 30
;

/*
Rewards users who are also active users 
*/
SELECT
	a.customer_id,
	a.email,
	a.first_name
FROM
	active_users a
		INNER JOIN reward_users r ON a.customer_id=r.customer_id	
GROUP BY 1
;

/*
ALL Reward users
*/
SELECT
	a.customer_id,
	a.email,
	a.phone
FROM
	reward_users r
		JOIN customer c ON r.customer_id=c.customer_id	
GROUP BY 1
;  	