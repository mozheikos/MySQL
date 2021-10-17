-- 1. Все врачи выбранной клиники со стажем и рейтингом

SELECT 
	d.id,
	d.name,
	d.age, 
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS 'Рейтинг',
	c.title 
FROM 
	DOCTORS D
JOIN
	CLINICS C 
ON 
	c.id = d.clinic_id
WHERE c.title = 'Интан';

-- 2. Отзыв о выбранном враче

SELECT 
	d.name AS 'Доктор',
	d.age AS 'Стаж',
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS 'Рейтинг',
	c.title AS 'Клиника',
	df.name AS 'Посетитель',
	df.body AS 'Отзыв'
FROM 
	DOCTORS D 
JOIN
	DOCTOR_FEEDBACK DF ON df.doctor_id = d.id
JOIN
	CLINICS C ON c.id = d.clinic_id
WHERE
	d.name = 'Brayan Fahey';

-- 3. Все клиники, оказывающие выбранную услугу с рейтингом и ценой на услугу

SELECT 
	c.title AS 'Клиника',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS 'Рейтинг',
	s.title AS 'Услуга', 
	cs.price AS 'Цена от, руб.',
	c.address AS 'Адрес',
	c.phone_number AS 'Телефон',
	c.closest_metro AS 'Ближайшее метро'
FROM 
	(CLINIC_SERVICES CS 
JOIN
	CLINICS C 
ON c.id = cs.clinic_id)
JOIN 
	SERVICES S 
ON 
	s.id = cs.service_id
WHERE s.id = 2
ORDER BY 2 DESC;


-- 4. Отзывы о выбранной клинике

SELECT 
	c.title AS 'Клиника',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS 'Рейтинг',
	cf.name AS 'Посетитель',
	cf.created_at AS 'Дата',
	cf.body AS 'Отзыв'
FROM 
	CLINICS C 
JOIN
	CLINIC_FEEDBACK CF 
ON
	cf.clinic_id = c.id
WHERE 
	c.id = 1;

-- 5. Информация о выбранной клинике

explain SELECT
	c.title AS 'Название',
	c.since AS 'Дата основания',
	c.address AS 'Адрес',
	c.phone_number AS 'Телефон',
	c.closest_metro AS 'Ближайшее метро'
FROM
	CLINICS C 
WHERE
	c.id = 3;

-- 6. Прайс-лист выбранной клиники

SELECT 
	c.title AS 'Клиника',
	s.title AS 'Услуга',
	cs.price AS 'Цена от, руб'
FROM
	CLINIC_SERVICES CS 
JOIN
	SERVICES S ON s.id = cs.service_id
JOIN 
	CLINICS C ON c.id = cs.clinic_id
WHERE
	c.id = 1;

-- 7. Все врачи со стажем, рейтингом, местом работы

CREATE VIEW view_doctors AS SELECT 
	d.name AS 'Врач',
	year(curdate()) - d.age AS 'Стаж',
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS 'Rating',
	c.title AS 'Клиника'
FROM
	DOCTORS D 
	JOIN CLINICS C ON D.CLINIC_ID = C.ID
WHERE (year(curdate()) - d.age) > 10 ORDER BY Rating DESC;

-- 8. Все клиники с рейтингом, адресом и телефоном

CREATE VIEW view_clinicss AS SELECT 
	title AS 'Название',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS 'Rating',
	address AS 'Адрес',
	phone_number AS 'Телефон',
	closest_metro AS 'Ближайшее метро'
FROM 
	CLINICS C
ORDER BY Rating DESC;

SELECT * FROM VIEW_CLINICSS VC WHERE RATING > 3.5;

-- 9. Заказы

create view user_orders as select 
	c.title as 'Клиника',
	d.name as 'Врач',
	s.title as 'Процедура',
	u.name as 'Клиент',
	o.service_date as 'Дата',
	o.cost as 'Цена от, руб'
from orders o 
	join clinics c on o.clinic_id = c.id
	join doctors d on o.doctor_id = d.id 
	join services s on o.service_id = s.id 
	join users u on o.user_id = u.id;


