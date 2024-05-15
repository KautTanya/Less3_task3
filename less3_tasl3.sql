---Спочатку додаю необхідні дані до бази

ALTER TABLE users
ADD COLUMN country VARCHAR(50);

ALTER TABLE workers
ADD COLUMN country VARCHAR(50);

UPDATE workers SET country = 'USA' WHERE worker_id < 4;
UPDATE workers SET country = 'Ukraine' WHERE worker_id >= 4 AND worker_id <= 9;
UPDATE workers SET country = 'Poland' WHERE worker_id > 9;

UPDATE users SET country = 'Poland' WHERE users_id >= 7;
UPDATE users SET country = 'Italy' WHERE users_id < 7 AND users_id > 4;
UPDATE users SET country = 'Ukraine' WHERE users_id <= 4;

UPDATE users SET users_name = 'Петро Іванов' WHERE users_id = 2;
UPDATE users SET users_name = 'Марія Петренко' WHERE users_id = 5;



--- Необхідні запити



--Створіть SQL-запит, який виводить повний список імен усіх користувачів та працівників. Використайте UNION.

SELECT users.users_name
FROM users
UNION
SELECT workers.workers_name
FROM workers;

--Створіть SQL-запит, який об'єднує список усіх країн, з яких є користувачі, та країн, де працюють працівники. Використайте UNION.

SELECT users.country
FROM users
UNION
SELECT workers.country
FROM workers;

--Створіть SQL-запит, який виводить імена, які є і серед користувачів, і серед працівників. Використайте INTERSECT.

SELECT users.users_name
FROM users
INTERSECT
SELECT workers.workers_name
FROM workers;

--Створіть SQL-запит, який виводить країни, з яких є як користувачі, так і працівники. Використайте INTERSECT.

SELECT users.country
FROM users
INTERSECT
SELECT workers.country
FROM workers;

--Створіть SQL-запит, який виводить імена користувачів, які не використовуються працівниками. Використайте EXCEPT. Це означає, що ви маєте показати тільки ті імена користувачів, які не зустрічаються серед імен працівників.

SELECT users.users_name
FROM users
EXCEPT
SELECT workers.workers_name
FROM workers;

--Створіть SQL-запит, який виводить країни, з яких є користувачі, але не працівники. Використайте EXCEPT.

SELECT users.country
FROM users
EXCEPT
SELECT workers.country
FROM workers;
