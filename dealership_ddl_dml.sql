ypObH8qVK15XaDwAVfmnFOGIG9BQMcDu
CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    sales_date DATE,
    car_condition VARCHAR(4),
    car_cost NUMERIC(10,2)
);
CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50)
);
CREATE TABLE parts (
  parts_id SERIAL PRIMARY KEY,
  parts_cost NUMERIC(10,2),
  part_description VARCHAR(100)
);

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  salesperson_name varchar(50),
  email VARCHAR(50)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  mechanic_name VARCHAR(50)
);

CREATE TABLE invoice (
    invoice_id SERIAL PRIMARY KEY,
    Total_cost NUMERIC(10,2),
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    salesperson_id INTEGER,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);




CREATE TABLE service_ticket (
    service_id SERIAL PRIMARY KEY,
    service_type VARCHAR(100),
    service_cost NUMERIC(8,2),
    service_date DATE,
    car_id INT,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    mechanic_id INT,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
    parts_id INT,
    FOREIGN KEY (parts_id) REFERENCES parts(parts_id)

);



INSERT INTO customer (
    customer_name,
    car_id
)
VALUES(
    'Jason DeRulo',
    1),(
    'Samantha Panda',
    2
);
INSERT INTO parts (
    parts_cost,
    part_description
)
VALUES(
    10,
    'Tire'
    ),(
   10,
    'Windshield Wipers'

);


SELECT *
FROM car;
SELECT *
FROM customer;
SELECT *
FROM mechanic;
SELECT *
FROM invoice;
SELECT *
FROM service_ticket;

INSERT INTO service_ticket (
    service_type,
    service_cost,
    service_date,
    car_id
)
VALUES(
    'Oil Change',
    NULL,
    '10-3-2019',
    1
    ),(
    'Tire Change',
    NULL,
    '10-3-2019',
    2
);

INSERT INTO invoice(
    total_cost,
    car_id,
    salesperson_id,
    customer_id
)
VALUES(
    NULL,
    2,
    2,
    2
),(
    NULL,
    1,
    1,
    1
);




-- ADD  SALESPERSONFUNCTION
CREATE OR REPLACE FUNCTION new_salesperson(
    salesperson_name VARCHAR(50),
    email VARCHAR(50)
) 
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO salesperson(salesperson_name, email)
    VALUES(salesperson_name, email);
END
$MAIN$

SELECT new_salesperson('Rory Laurel','rl@email.com')
SELECT new_salesperson'Alex Speed','as@email.com')
SELECT new_salesperson('Arnold Engine','rl@email.com')
SELECT new_salesperson('Jacky John','jj@email.com')
SELECT new_salesperson('Arden Luv','aa@email.com')

SELECT *
FROM salesperson;

-- ADD MECHANIC FUNCTION
CREATE OR REPLACE FUNCTION new_mechanic(
    mechanic_name VARCHAR(50)
) 
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO mechanic(mechanic_name)
    VALUES(mechanic_name);
END
$MAIN$

SELECT new_mechanic('Guy Ferarri')
SELECT new_mechanic('Barefoot Contesla')




-- ADD CAR FUNCTION
CREATE OR REPLACE FUNCTION add_car(
    sales_date DATE,
    car_condition VARCHAR(50),
    car_cost NUMERIC(10,2)
) 
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO car(sales_date,car_condition,car_cost)
    VALUES(sales_date,car_condition,car_cost);
END
$MAIN$