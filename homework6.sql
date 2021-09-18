
USE social_network;

-- ������� 2

-- ����� ID "���������� ������������" = 144. ������ ������ ������������ 144: 
SELECT INITIATOR_USER_ID + TARGET_USER_ID - 144 AS friends FROM FRIENDS_REQUESTS 
	WHERE (INITIATOR_USER_ID = 144 OR TARGET_USER_ID = 144) AND REQUEST_STATUS = 'approved';

/* ������ ������ ������������, �������:
 * 1. ��������� � ������ ������ ������������ 144 (������ approved � friends_requests)
 * 2. ��������� ���������� ���������, ����� ���� ������������� � ������������� � ID = 144 - ������������
*/
SELECT 
	(FROM_USER_ID + TO_USER_ID - 144) AS friend_id,
	(SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) FROM users WHERE id = friend_id) AS friend_name,
	COUNT(*) AS total_messages
FROM MESSAGES 
	WHERE 
		(FROM_USER_ID = 144 AND TO_USER_ID IN (SELECT INITIATOR_USER_ID + TARGET_USER_ID - 144 AS friends FROM FRIENDS_REQUESTS 
		WHERE (INITIATOR_USER_ID = 144 OR TARGET_USER_ID = 144) AND REQUEST_STATUS = 'approved'))
	OR 
		(TO_USER_ID = 144 AND FROM_USER_ID IN (SELECT INITIATOR_USER_ID + TARGET_USER_ID - 144 AS friends FROM FRIENDS_REQUESTS 
		WHERE (INITIATOR_USER_ID = 144 OR TARGET_USER_ID = 144) AND REQUEST_STATUS = 'approved')) 
	GROUP BY friend_id ORDER BY total_messages DESC LIMIT 1;

-- ������� 3

SELECT 
	LIKED_USER_ID AS liked_user,
	(SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) FROM users WHERE ID = liked_user) AS 'User name',
	(SELECT DATEDIFF(now(), BIRTHDAY) DIV 365.25 FROM PROFILES WHERE USER_ID = liked_user) AS age,
	count(*) AS total_likes 
FROM PROFILES_LIKES GROUP BY LIKED_USER_ID ORDER BY age LIMIT 10;


-- ������� 4

SELECT total_likes, gender, 
	(CASE WHEN gender = 'f' THEN 'female'
		WHEN gender = 'm' THEN 'male' 
	END) AS answer
FROM (
	SELECT 
		COUNT(*) AS total_likes ,
		USER_ID id_of_user,
		(SELECT gender FROM PROFILES WHERE USER_ID = id_of_user) AS gender
	FROM likes GROUP BY GENDER ORDER BY TOTAL_LIKES DESC LIMIT 1) AS request; 
	
-- ������� 5
/*��� ����������� ���������� ��������� ������������ ��������� ����������:
 * - ���� ������
 * - ���� ��������� �������� ������
 * - ���� ��������� ���������
 * - ���� ����������� �����������, ��������� ������������ 
 * ��� ������� ������������, � ����� �������� ��� 10 �������, � ������� ��� ���������� ����� ����������.
 * PS ����� ���������� ������� �� � ������� ��� �� ���������� ����� ���������� ������ 4 ���������� � ��������
 * ���������� �������������, �� ����� ��������, �� �������� ��������
 */

SELECT
	id,
	CONCAT(firstname, ' ', lastname) AS user_name,
	((SELECT count(*) FROM FRIENDS_REQUESTS WHERE INITIATOR_USER_ID = id) +
	(SELECT count(*) FROM LIKES WHERE user_id = id) +
	(SELECT count(*) FROM MEDIA WHERE user_id = id) +
	(SELECT count(*) FROM MESSAGES WHERE from_user_id = id) +
	(SELECT count(*) FROM PHOTO_ALBUMS WHERE user_id = id) +
	(SELECT count(*) FROM PROFILES_LIKES WHERE user_id = id)) AS total_activity
FROM users ORDER BY total_activity LIMIT 10;






