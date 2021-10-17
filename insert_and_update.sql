USE dantist_aggregator;

INSERT INTO SERVICES (title) 
VALUES 
	('лечение кариеса'),
	('имплантация'), 
	('протезирование'), ('удаление'),
	('синус-лифтинг');
	
INSERT INTO clinics (title, since, ADDRESS, PHONE_NUMBER, CLOSEST_METRO)
VALUES
	('Интан', 1998, 'Вознесенский проспект, 25', '+7(812)429-56-96', 'Садовая/Сенная/Спасская');

INSERT INTO CLINIC_SERVICES (clinic_id, SERVICE_ID, PRICE)
VALUES
	(1,1,3520),
	(1,2,9900),
	(1,3,11250),
	(1,4,2290),
	(1,5,6600);

UPDATE CLINICS 
SET 
	title = 'Хорошая стоматология', 
	address =  'Учебный переулок, д.2', 
	PHONE_NUMBER = '+7(812)448-53-97',
	closest_metro = 'Гражданский Проспект'
WHERE id = 2;

UPDATE CLINICS 
SET
	title = 'ДЕГА',
	address =  'Рабочий переулок, д.3', 
	PHONE_NUMBER = '+7(812)748-08-08',
	closest_metro = 'Адмиралтейская'
WHERE id = 3;

UPDATE CLINICS 
SET 
	title = 'Вера в нас',
	address =  'шоссе Революции, д.88', 
	PHONE_NUMBER = '+7(812)445-81-25',
	closest_metro = 'Ладожская'
WHERE id = 4;

UPDATE CLINICS 
SET 
	title = 'Стоматология комфорта',
	address =  'ул. Сикейроса, д.11к1', 
	PHONE_NUMBER = '+7(812)407-26-41',
	closest_metro = 'Озерки'
WHERE id = 5;

UPDATE CLINICS
SET
	title = 'Славная улыбка',
	address =  'пр. Медиков, д.10к1', 
	PHONE_NUMBER = '+7(812)679-08-30',
	closest_metro = 'Петроградская'
WHERE id = 6;

UPDATE CLINICS 
SET 
	title = 'Улыбка',
	address =  'пр. Стачек, д.72', 
	PHONE_NUMBER = '+7(812)702-01-70',
	closest_metro = 'Кировский завод'
WHERE id = 7;

UPDATE CLINICS 
SET 
	title = 'Дентал Хаус',
	address =  'наб. Черной речки, д.51', 
	PHONE_NUMBER = '+7(812)647-77-77',
	closest_metro = 'Черная речка'
WHERE id = 8;

UPDATE CLINICS 
SET 
	title = 'Смайл',
	address =  'ул. Марата, д.29', 
	PHONE_NUMBER = '+7(812)712-37-95',
	closest_metro = 'Владимирская/Достоевская'
WHERE id = 9;

UPDATE CLINICS 
SET 
	title = 'Стоматология Special One',
	address =  'Морской проспект, д.29', 
	PHONE_NUMBER = '+7(812)222-23-45',
	closest_metro = 'Крестовский остров'
WHERE id = 10;

UPDATE CLINICS 
SET
	title = 'МедЛайн',
	address =  'ул. Белышева, д.5/6', 
	PHONE_NUMBER = '+7(812)501-21-73',
	closest_metro = 'Проспект Большевиков'
WHERE id = 11;

UPDATE CLINICS
SET
	title = 'Дентал Офис',
	address =  'Парголово, ул. Архитектора Белова, д.5к1', 
	PHONE_NUMBER = '+7(812)985-05-03',
	closest_metro = 'Проспект Просвещения'
WHERE id = 12;

UPDATE CLINICS 
SET 
	title = 'Клиника стоматологии №1',
	address =  'Ломоносов, ул. Еленинская, д.24 (пом. 7Н)', 
	PHONE_NUMBER = '+7(812)467-45-33',
	closest_metro = 'Проспект Ветеранов'
WHERE id = 13;

UPDATE CLINICS 
SET 
	title = 'Балт Мед',
	address =  'Выборгское шоссе, д.40', 
	PHONE_NUMBER = '+7(812)670-03-03',
	closest_metro = 'Озерки'
WHERE id = 14;

UPDATE CLINICS 
SET 
	title = 'СМТ',
	address =  'Московский проспект, д.22', 
	PHONE_NUMBER = '+7(812)777-97-77',
	closest_metro = 'Технологический институт'
WHERE id = 15;

UPDATE CLINICS 
SET 
	title = 'Первая семейная клиника',
	address =  'Коломяжский проспект, д.36/2', 
	PHONE_NUMBER = '+7(812)300-53-00',
	closest_metro = 'Пионерская'
WHERE id = 16;

UPDATE CLINICS 
SET 
	title = 'Семь докторов',
	address =  'ул. 10-я Советская, д.4-6', 
	PHONE_NUMBER = '+7(812)407-20-63',
	closest_metro = 'Площадь Восстания'
WHERE id = 17;

UPDATE CLINICS
SET
	title = 'Органик Нева',
	address =  'пр. Просвещения, д.53к1', 
	PHONE_NUMBER = '+7(812)385-63-85',
	closest_metro = 'Проспект Просвещения'
WHERE id = 18;

UPDATE CLINICS
SET
	title = 'My Ort',
	address =  'ул. Есенина, д.1к1', 
	PHONE_NUMBER = '+7(812)454-45-50',
	closest_metro = 'Озерки'
WHERE id = 19;

UPDATE CLINICS 
SET 
	title = 'Мой Зубной',
	address =  'пр. Стачек, д.92к3', 
	PHONE_NUMBER = '+7(812)429-70-60',
	closest_metro = 'Автово'
WHERE id = 20;
