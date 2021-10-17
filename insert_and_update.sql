USE dantist_aggregator;

INSERT INTO SERVICES (title) 
VALUES 
	('������� �������'),
	('�����������'), 
	('��������������'), ('��������'),
	('�����-�������');
	
INSERT INTO clinics (title, since, ADDRESS, PHONE_NUMBER, CLOSEST_METRO)
VALUES
	('�����', 1998, '������������ ��������, 25', '+7(812)429-56-96', '�������/������/��������');

INSERT INTO CLINIC_SERVICES (clinic_id, SERVICE_ID, PRICE)
VALUES
	(1,1,3520),
	(1,2,9900),
	(1,3,11250),
	(1,4,2290),
	(1,5,6600);

UPDATE CLINICS 
SET 
	title = '������� ������������', 
	address =  '������� ��������, �.2', 
	PHONE_NUMBER = '+7(812)448-53-97',
	closest_metro = '����������� ��������'
WHERE id = 2;

UPDATE CLINICS 
SET
	title = '����',
	address =  '������� ��������, �.3', 
	PHONE_NUMBER = '+7(812)748-08-08',
	closest_metro = '��������������'
WHERE id = 3;

UPDATE CLINICS 
SET 
	title = '���� � ���',
	address =  '����� ���������, �.88', 
	PHONE_NUMBER = '+7(812)445-81-25',
	closest_metro = '���������'
WHERE id = 4;

UPDATE CLINICS 
SET 
	title = '������������ ��������',
	address =  '��. ���������, �.11�1', 
	PHONE_NUMBER = '+7(812)407-26-41',
	closest_metro = '������'
WHERE id = 5;

UPDATE CLINICS
SET
	title = '������� ������',
	address =  '��. �������, �.10�1', 
	PHONE_NUMBER = '+7(812)679-08-30',
	closest_metro = '�������������'
WHERE id = 6;

UPDATE CLINICS 
SET 
	title = '������',
	address =  '��. ������, �.72', 
	PHONE_NUMBER = '+7(812)702-01-70',
	closest_metro = '��������� �����'
WHERE id = 7;

UPDATE CLINICS 
SET 
	title = '������ ����',
	address =  '���. ������ �����, �.51', 
	PHONE_NUMBER = '+7(812)647-77-77',
	closest_metro = '������ �����'
WHERE id = 8;

UPDATE CLINICS 
SET 
	title = '�����',
	address =  '��. ������, �.29', 
	PHONE_NUMBER = '+7(812)712-37-95',
	closest_metro = '������������/�����������'
WHERE id = 9;

UPDATE CLINICS 
SET 
	title = '������������ Special One',
	address =  '������� ��������, �.29', 
	PHONE_NUMBER = '+7(812)222-23-45',
	closest_metro = '����������� ������'
WHERE id = 10;

UPDATE CLINICS 
SET
	title = '�������',
	address =  '��. ��������, �.5/6', 
	PHONE_NUMBER = '+7(812)501-21-73',
	closest_metro = '�������� �����������'
WHERE id = 11;

UPDATE CLINICS
SET
	title = '������ ����',
	address =  '���������, ��. ����������� ������, �.5�1', 
	PHONE_NUMBER = '+7(812)985-05-03',
	closest_metro = '�������� �����������'
WHERE id = 12;

UPDATE CLINICS 
SET 
	title = '������� ������������ �1',
	address =  '���������, ��. ����������, �.24 (���. 7�)', 
	PHONE_NUMBER = '+7(812)467-45-33',
	closest_metro = '�������� ���������'
WHERE id = 13;

UPDATE CLINICS 
SET 
	title = '���� ���',
	address =  '���������� �����, �.40', 
	PHONE_NUMBER = '+7(812)670-03-03',
	closest_metro = '������'
WHERE id = 14;

UPDATE CLINICS 
SET 
	title = '���',
	address =  '���������� ��������, �.22', 
	PHONE_NUMBER = '+7(812)777-97-77',
	closest_metro = '��������������� ��������'
WHERE id = 15;

UPDATE CLINICS 
SET 
	title = '������ �������� �������',
	address =  '����������� ��������, �.36/2', 
	PHONE_NUMBER = '+7(812)300-53-00',
	closest_metro = '����������'
WHERE id = 16;

UPDATE CLINICS 
SET 
	title = '���� ��������',
	address =  '��. 10-� ���������, �.4-6', 
	PHONE_NUMBER = '+7(812)407-20-63',
	closest_metro = '������� ���������'
WHERE id = 17;

UPDATE CLINICS
SET
	title = '������� ����',
	address =  '��. �����������, �.53�1', 
	PHONE_NUMBER = '+7(812)385-63-85',
	closest_metro = '�������� �����������'
WHERE id = 18;

UPDATE CLINICS
SET
	title = 'My Ort',
	address =  '��. �������, �.1�1', 
	PHONE_NUMBER = '+7(812)454-45-50',
	closest_metro = '������'
WHERE id = 19;

UPDATE CLINICS 
SET 
	title = '��� ������',
	address =  '��. ������, �.92�3', 
	PHONE_NUMBER = '+7(812)429-70-60',
	closest_metro = '������'
WHERE id = 20;
