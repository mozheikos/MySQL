USE shop;

-- ������� 1

SELECT u.id, u.login AS name, count(*) AS total_orders
FROM 
	USERS AS U
JOIN
	orders AS O
ON 
	u.id = o.user_id
GROUP BY u.id;

-- ������� 2 

SELECT p.id, p.name AS '��������', c.name AS '���������'
FROM 
	PRODUCTS AS P
LEFT JOIN
	CATALOGS AS C
ON 
	c.id = p.catalog_id
ORDER BY c.name;

-- ������� 3

CREATE TABLE flights (
	id serial,
	go_from VARCHAR(20),
	go_to VARCHAR(20)
);

CREATE TABLE cities (
	label varchar(20),
	name VARCHAR(20)
);

INSERT INTO FLIGHTS (GO_FROM, GO_TO) VALUES 
	('moscow','omsk'),
	('novgorod','kazan'),
	('irkutsk','moscow'),
	('omsk','irkutsk'),
	('moscow','kazan');

INSERT INTO CITIES (label, name) VALUES
	('moscow', '������'),
	('irkutsk', '�������'),
	('novgorod', '��������'),
	('kazan', '������'),
	('omsk', '����');
	
SELECT id AS '� �����', c.name AS '������', CITIES.NAME AS '����'
FROM 
	(FLIGHTS F
JOIN 
	CITIES C 
ON c.label = f.go_from)
JOIN
	CITIES 
ON 
	CITIES.label = f.go_to
ORDER BY id;


