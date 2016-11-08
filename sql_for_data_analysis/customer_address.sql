#customer id, name(first and last), mailing address
SELECT
	customer.customer_id, customer.first_name, customer.last_name, address.address
FROM
	customer, address
WHERE
	customer.address_id = address.address_id
;