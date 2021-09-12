USE shop;

-- ������������ ������� �� ���� ����������, ����������, ���������� � �����������
-- ������� 1

UPDATE TABLE users SET created_at = now(), updated_at = now();

-- ������� 2 

UPDATE users SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
	UPDATED_AT = STR_TO_DATE(UPDATED_AT, '%d.%m.%Y %h:%i');

-- ������� 3

SELECT * FROM STOREHOUSES_PRODUCTS ORDER BY value = 0, value;

-- ������� 4

SELECT * FROM users WHERE DATE_FORMAT(birthday, '%M') IN ('may', 'august');

-- ������� 5

SELECT * FROM CATALOGS WHERE id IN (5,1,2) ORDER BY id != 5, ID;

-- ������������ ������� ���� ���������� �������
-- ������� 1

SELECT ROUND(AVG(DATEDIFF(now(), birthday) DIV 365.25), 0) AS '������� �������, ���' FROM USERS;

-- ������� 2

SELECT DAYNAME(DATE_FORMAT(BIRTHDAY, '2021-%m-%d')) AS Week_day, COUNT(*) AS 'Borned users' FROM users GROUP BY Week_day;

-- ������� 3

SELECT exp(sum(ln(id))) AS res FROM users WHERE id < 6;