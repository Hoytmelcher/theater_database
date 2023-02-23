CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL
);

INSERT INTO customers(
	first_name
)VALUES(
	'Adam'
),(
	'Davis'
);

CREATE OR REPLACE PROCEDURE insertCustomer(
	fName VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO customers(
		first_name
	)VALUES(
		fName
	);
	COMMIT;
END;
$$

CALL insertCustomer('Balthazar');
SELECT *
FROM customers;

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY, 
	title VARCHAR(45) NOT NULL
);

INSERT INTO movies(
	title 
)VALUES(
	'Midnight'
),(
	'Terrific Twelve'
);

CREATE TABLE theaters(
	theater_id SERIAL PRIMARY KEY,
	theater_location VARCHAR(45) NOT NULL
);

INSERT INTO theaters(
	theater_location 
)VALUES(
	'Boston'
),(
	'Houston'
);

CREATE TABLE screen(
	screen_id SERIAL PRIMARY KEY,
	screen_number INTEGER NOT NULL,
	movie_id integer,
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

INSERT INTO SCREEN(
	screen_number,
	movie_id
)VALUES(
	1,
	1
),(
	2,
	1
);

CREATE TABLE tickets(
	ticket_number SERIAL PRIMARY KEY,
	theater_id integer NOT NULL,
	movie_id integer NOT NULL,
	screen_id integer NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theaters(theater_id),
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY (screen_id) REFERENCES screen(screen_id)
);

INSERT INTO tickets(
	theater_id,
	movie_id,
	screen_id
)VALUES(
	1,
	1,
	1
),(
	2,
	1,
	1
);

CREATE TABLE ticket_purchase(
	ticket_purchase_id SERIAL PRIMARY KEY,
	customer_id integer NOT NULL,
	ticket_number integer NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (ticket_number) REFERENCES tickets(ticket_number)
);


INSERT INTO ticket_purchase(
	customer_id,
	ticket_number
)VALUES(
	1,
	1
),(
	2,
	2
);


CREATE TABLE concession_product(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(45) NOT NULL
);

INSERT INTO concession_product(
	product_name 
)VALUES(
	'popcorn'
),(
	'reeses pieces'
);

CREATE TABLE concession_order(
	order_id SERIAL PRIMARY KEY,
	product_id integer NOT NULL,
	customer_id integer NOT NULL,
	theater_id integer NOT NULL,
	FOREIGN KEY (product_id) REFERENCES concession_product(product_id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

INSERT INTO concession_order(
	product_id,
	customer_id,
	theater_id
)VALUES(
	1,
	2,
	1
),(
	2,
	2,
	1
);

CREATE TABLE concession_purchase(
	purchase_id SERIAL PRIMARY KEY,
	order_id integer NOT NULL,
	FOREIGN KEY (order_id) REFERENCES concession_order(order_id)
);

INSERT INTO concession_purchase(
	order_id
)VALUES(
	1
),(
	2
);







