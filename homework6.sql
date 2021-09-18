
USE social_network;

-- «адание 2

-- пусть ID "некоторого пользовател€" = 144. —писок друзей пользовател€ 144: 
SELECT INITIATOR_USER_ID + TARGET_USER_ID - 144 AS friends FROM FRIENDS_REQUESTS 
	WHERE (INITIATOR_USER_ID = 144 OR TARGET_USER_ID = 144) AND REQUEST_STATUS = 'approved';

/* —крипт поиска пользовател€, который:
 * 1. находитс€ в списке друзей пользовател€ 144 (статус approved в friends_requests)
 * 2. суммарное количество сообщений, между этим пользователем и пользователем с ID = 144 - максимальное
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

-- «адание 3

SELECT 
	LIKED_USER_ID AS liked_user,
	(SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) FROM users WHERE ID = liked_user) AS 'User name',
	(SELECT DATEDIFF(now(), BIRTHDAY) DIV 365.25 FROM PROFILES WHERE USER_ID = liked_user) AS age,
	count(*) AS total_likes 
FROM PROFILES_LIKES GROUP BY LIKED_USER_ID ORDER BY age LIMIT 10;


-- «адание 4

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
	
-- «адание 5
/*дл€ определени€ активности предлагаю использовать суммарное количество:
 * - всех лайков
 * - всех исход€щих запросов дружбы
 * - всех исход€щих сообщений
 * - всех добавленных медиафайлов, созданных фотоальбомов 
 * дл€ каждого пользовател€, а затем выыбрать тех 10 человек, у которых это количество будет наименьшим.
 * PS ¬виду небольшого размера Ѕƒ и рандома при ее заполнении сумма активности равна€ 4 получилась у большого
 * количества пользователей, не очень нагл€дно, но очквидно работает
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






