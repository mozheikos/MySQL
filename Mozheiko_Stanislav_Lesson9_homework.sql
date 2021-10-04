-- ������� 1 (����������). ������ ��������� �� ����������, ��� ��� � ���� shop �� ������� users ��������� 2 ������� �����, � � ��� ��� ����� ON DELETE cascade,
-- ������ ��� ���������� ������ �����������

START TRANSACTION;
USE sample;
INSERT INTO users (id, name) SELECT id, login FROM shop.USERS U WHERE id = 1;

COMMIT;

-- ������� 2 (����������)

CREATE VIEW product_list AS 
	SELECT p.name AS name, c.name AS category FROM
	products P 
	JOIN
	catalogs C 
	ON p.catalog_id = c.id;
	
SELECT * FROM PRODUCT_LIST PL;

-- ������� 3 (����������)

CREATE TABLE datas (
	created_at varchar(15)
);

INSERT INTO datas VALUES ('2018-08-01');
INSERT INTO datas VALUES ('2018-08-04');
INSERT INTO datas VALUES ('2018-08-16');
INSERT INTO datas VALUES ('2018-08-17');

SET @d = DAYOFYEAR('2018-07-31'); 

SELECT makedate(2018, @d:= @d + 1) AS day_in_august,
(CASE WHEN makedate(2018, @d) IN (SELECT * FROM DATAS) THEN 1
ELSE 0 END) AS flag 
FROM 
users u limit 31;

-- ������� 4 (����������)

use social_network;

DROP VIEW IF EXISTS 

CREATE VIEW view_1 AS select id, created_at from messages order by CREATED_AT desc limit 5;

delete from messages where id not in (SELECT id FROM view_1);

-- ������� 1 (���������)

DROP FUNCTION IF EXISTS hello;
delimiter //
CREATE FUNCTION hello()
RETURNS varchar(200) DETERMINISTIC
BEGIN
	DECLARE now_time TIME DEFAULT NULL;
	DECLARE message VARCHAR(200);
	SET now_time = CURTIME(); 
	IF now_time > time_format('6:00', '%H %m') AND now_time <= time_format('12:00', '%H %m') THEN SET message = '������ ����';
	ELSEIF now_time > time_format('12:00', '%H %m') AND now_time <= time_format('18:00', '%H %m') THEN SET message = '������ ����';
	ELSEIF now_time > time_format('18:00', '%H %m') AND now_time <= time_format('23:59', '%H %m') THEN SET message = '������ �����';
	ELSE SET message = '������ ����';
	END IF;
	return message;
END//
delimiter ;

SELECT hello();

-- ������� 2 (���������)

delimiter //
DROP TRIGGER IF EXISTS trigger_1// 
CREATE TRIGGER trigger_1 BEFORE INSERT ON products
	FOR EACH ROW 
	BEGIN 
		IF NEW.name IS NULL AND NEW.description IS NULL THEN
			SIGNAL SQLSTATE '45000' SET message_text = '� ���� name/description ���������� ������ �� ������� ��������';
		END IF;
END//
delimiter ;

INSERT INTO PRODUCTS (name, DESCRIPTION, PRICE, CATALOG_ID) VALUES
	(NULL, NULL, 1000, 1);
INSERT INTO PRODUCTS (name, DESCRIPTION, PRICE, CATALOG_ID) VALUES
	('new product', NULL, 1000, 1);

SELECT * FROM PRODUCTS P ;

-- ������� 3 (���������)

delimiter //
DROP FUNCTION IF EXISTS fibonacci//
CREATE FUNCTION fibonacci (num int)
RETURNS int deterministic
BEGIN
	DECLARE f, f_1, f_2, i INT;
	SET f_1 = 0;
	SET f_2 = 0;
	SET f = 0;
	SET i = 0;
	WHILE i <= num DO
		SET f = f_1 + f_2;
		IF i = 1 THEN SET f = 1;
		END IF;
		SET f_1 = f_2;
		SET f_2 = f;
		SET i = i + 1;
	END WHILE;
RETURN f;
END //
delimiter ;

SELECT fibonacci(10);

-- ������� 1 (�����������������)

CREATE USER shop_read identified BY '123';
CREATE USER shop_all identified BY '123';


GRANT SELECT ON shop.* TO shop_read;
GRANT ALL ON shop.* TO shop_all;

-- ������� 2 (�����������������) ����� �� ������� �������� ������ ������� accounts ������������� �������� shop.users, ���������� ������ �������

CREATE VIEW users_view AS SELECT id, login FROM USERS U; 

CREATE USER users_read identified BY '111';
GRANT SELECT ON shop.USERS_VIEW TO users_read;


























