-- 1. ��� ����� ��������� ������� �� ������ � ���������

SELECT 
	d.id,
	d.name,
	d.age, 
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS '�������',
	c.title 
FROM 
	DOCTORS D
JOIN
	CLINICS C 
ON 
	c.id = d.clinic_id
WHERE c.title = '�����';

-- 2. ����� � ��������� �����

SELECT 
	d.name AS '������',
	d.age AS '����',
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS '�������',
	c.title AS '�������',
	df.name AS '����������',
	df.body AS '�����'
FROM 
	DOCTORS D 
JOIN
	DOCTOR_FEEDBACK DF ON df.doctor_id = d.id
JOIN
	CLINICS C ON c.id = d.clinic_id
WHERE
	d.name = 'Brayan Fahey';

-- 3. ��� �������, ����������� ��������� ������ � ��������� � ����� �� ������

SELECT 
	c.title AS '�������',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS '�������',
	s.title AS '������', 
	cs.price AS '���� ��, ���.',
	c.address AS '�����',
	c.phone_number AS '�������',
	c.closest_metro AS '��������� �����'
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


-- 4. ������ � ��������� �������

SELECT 
	c.title AS '�������',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS '�������',
	cf.name AS '����������',
	cf.created_at AS '����',
	cf.body AS '�����'
FROM 
	CLINICS C 
JOIN
	CLINIC_FEEDBACK CF 
ON
	cf.clinic_id = c.id
WHERE 
	c.id = 1;

-- 5. ���������� � ��������� �������

explain SELECT
	c.title AS '��������',
	c.since AS '���� ���������',
	c.address AS '�����',
	c.phone_number AS '�������',
	c.closest_metro AS '��������� �����'
FROM
	CLINICS C 
WHERE
	c.id = 3;

-- 6. �����-���� ��������� �������

SELECT 
	c.title AS '�������',
	s.title AS '������',
	cs.price AS '���� ��, ���'
FROM
	CLINIC_SERVICES CS 
JOIN
	SERVICES S ON s.id = cs.service_id
JOIN 
	CLINICS C ON c.id = cs.clinic_id
WHERE
	c.id = 1;

-- 7. ��� ����� �� ������, ���������, ������ ������

CREATE VIEW view_doctors AS SELECT 
	d.name AS '����',
	year(curdate()) - d.age AS '����',
	(SELECT round(avg(value), 1) FROM doctor_RATING WHERE doctor_ID = d.id) AS 'Rating',
	c.title AS '�������'
FROM
	DOCTORS D 
	JOIN CLINICS C ON D.CLINIC_ID = C.ID
WHERE (year(curdate()) - d.age) > 10 ORDER BY Rating DESC;

-- 8. ��� ������� � ���������, ������� � ���������

CREATE VIEW view_clinicss AS SELECT 
	title AS '��������',
	(SELECT round(avg(value), 1) FROM CLINIC_RATING WHERE CLINIC_ID = c.id) AS 'Rating',
	address AS '�����',
	phone_number AS '�������',
	closest_metro AS '��������� �����'
FROM 
	CLINICS C
ORDER BY Rating DESC;

SELECT * FROM VIEW_CLINICSS VC WHERE RATING > 3.5;

-- 9. ������

create view user_orders as select 
	c.title as '�������',
	d.name as '����',
	s.title as '���������',
	u.name as '������',
	o.service_date as '����',
	o.cost as '���� ��, ���'
from orders o 
	join clinics c on o.clinic_id = c.id
	join doctors d on o.doctor_id = d.id 
	join services s on o.service_id = s.id 
	join users u on o.user_id = u.id;


