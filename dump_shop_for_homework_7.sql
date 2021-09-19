-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Видеокарты'),(3,'Мат. платы'),(4,'Мониторы');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `label` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('moscow','Москва'),('irkutsk','Иркутск'),('novgorod','Новгород'),('kazan','Казань'),('omsk','Омск');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `discount` float DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,0),(2,2,2,0),(3,3,3,0),(4,4,4,0),(5,5,5,0),(6,6,6,0),(7,7,7,1),(8,8,8,1),(9,9,9,0),(10,10,10,1),(11,11,11,0),(12,12,12,0),(13,13,13,0),(14,14,14,1),(15,15,15,1),(16,16,16,0),(17,17,17,1),(18,18,18,1),(19,19,19,0),(20,20,20,0);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `go_from` varchar(20) DEFAULT NULL,
  `go_to` varchar(20) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'moscow','omsk'),(2,'novgorod','kazan'),(3,'irkutsk','moscow'),(4,'omsk','irkutsk'),(5,'moscow','kazan');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_products`
--

DROP TABLE IF EXISTS `ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `total` int DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (27,2),(59,2),(55,3),(14,4),(42,4),(54,4),(12,7),(71,7),(31,9),(77,9),(78,9),(46,11),(97,11),(39,12),(58,12),(69,12),(80,12),(8,13),(29,13),(20,14),(21,14),(66,15),(6,16),(41,18),(87,18),(9,19),(25,19),(70,19),(74,19),(11,21),(47,21),(75,26),(51,31),(28,34),(50,34),(63,34),(100,34),(82,35),(37,36),(52,36),(23,37),(93,37),(22,38),(45,39),(85,39),(88,43),(96,44),(17,46),(43,50),(99,50),(44,51),(53,52),(91,52),(5,53),(73,53),(81,53),(10,54),(94,54),(57,56),(72,56),(84,56),(89,57),(48,58),(65,58),(15,60),(49,60),(76,60),(4,62),(64,65),(67,65),(98,65),(38,66),(95,66),(79,70),(40,72),(34,73),(68,74),(16,75),(18,75),(33,75),(86,79),(7,81),(32,84),(92,85),(1,87),(36,87),(2,89),(24,90),(60,92),(61,92),(19,93),(83,93),(62,94),(90,94),(26,95),(35,96),(56,97),(13,98),(3,99),(30,100);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(8,2) NOT NULL,
  `catalog_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'rerum','Esse reprehenderit ad laboriosam rerum libero. Ducimus sequi quis impedit. A sit sunt eum dolor similique soluta accusamus. Voluptatem nihil eos eum iure aut.',999999.99,1),(2,'iusto','Tempora aut culpa tenetur consequatur et incidunt. Error adipisci cum placeat eius ut corporis. Molestias quisquam consequuntur quibusdam.',122.80,2),(3,'ducimus','Et voluptatem sint excepturi hic non repellat quidem dolor. Doloremque ad ipsa impedit dolorum libero. Sunt aut voluptate voluptatem dolore quia exercitationem id quis.',999999.99,3),(4,'et','Molestias eaque reprehenderit non et. Nesciunt ut occaecati earum soluta. Aut impedit aut molestias quis et dignissimos aliquam.',60270.00,4),(5,'sunt','Perferendis vel facere est nostrum. Ut sit commodi qui atque unde iure omnis. Ex temporibus velit excepturi sed aut atque delectus qui. Quidem sit eum dolorum occaecati voluptate aliquid et.',999999.99,1),(6,'eveniet','Non dolorum et consequatur maiores. Qui aperiam voluptas saepe dignissimos quia esse culpa. Quo reiciendis laudantium minus qui quam est. Est et veritatis velit voluptatem ut eum.',2.59,2),(7,'beatae','Rerum aut temporibus repellendus eligendi sequi. Ab eligendi earum sunt dicta. Autem ratione occaecati sed consequuntur itaque commodi unde eos.',445812.80,3),(8,'incidunt','Veniam provident officia ut consequuntur fugit et. Ad enim illo nemo ut. Consequuntur natus vel soluta aspernatur natus similique sit. Nostrum voluptatum consequatur eaque ipsam ut.',426.61,4),(9,'soluta','Debitis et quidem sed et at est ratione. Pariatur sunt eum et exercitationem ipsum. Aut ad dolorem distinctio impedit in numquam. Saepe ducimus voluptatem quod blanditiis id totam officiis consequatur.',43.14,1),(10,'laudantium','Eveniet vitae odio eum. Est ab qui cum reiciendis nulla incidunt deleniti at. Repellat sint repellat animi voluptatem totam veritatis sit qui.',27532.62,2),(11,'aut','Numquam aut doloremque sint tenetur deserunt et commodi. Non numquam numquam molestias totam amet. At laudantium officia id exercitationem. Esse sit illum rem aut. Non aut sint amet et quisquam aperiam.',606.44,3),(12,'quibusdam','Ut eos quia ullam aut. Voluptatem eum fugit quidem ullam iure. Nihil aut cumque voluptas laboriosam autem aliquam consequatur. Nulla aut voluptatem nesciunt enim illum vel. Tempora dignissimos error tempore sint id enim aut.',0.00,4),(13,'itaque','Dolorum ipsa nobis repellat ab quae. Est quibusdam rerum repellendus eos. Nisi ut quia et nisi et ipsam. Laborum voluptas vitae dolores consectetur quae qui.',0.80,1),(14,'facilis','Est facilis magni qui eaque soluta aut et. Qui delectus reprehenderit et perferendis itaque esse neque sunt. Dicta impedit similique omnis qui recusandae.',2.17,2),(15,'ut','Veritatis dolores aut mollitia. Officiis aut voluptatibus numquam sequi vel laudantium vitae dolor. Rem quaerat quas cumque est velit quam.',2.75,3),(16,'enim','Ullam cupiditate modi quo. Est est perferendis nam eius. Culpa necessitatibus ut beatae dolore.',999999.99,4),(17,'reiciendis','Vitae voluptatum iste rerum sed culpa et. Qui qui consequatur molestiae porro debitis natus voluptates. Nemo asperiores sequi quae quia. Necessitatibus maxime ullam magni doloribus dolore aliquam modi.',999999.99,1),(18,'impedit','Tempore corrupti est amet. Consectetur repellat sit dolorum deserunt. Iste alias eum aut culpa ducimus. Dolorem libero libero magnam accusantium.',4341.62,2),(19,'ipsa','Quisquam accusamus qui in dolor. Quis sint vel voluptatem tenetur. Maiores quae quia incidunt aut velit cum. Impedit alias et soluta quod.',77.81,3),(20,'voluptatem','Enim et a omnis maxime. Incidunt suscipit ut minus incidunt quod ab cumque molestiae. Eveniet illum rem et itaque aut eveniet cum. Dignissimos distinctio beatae vitae totam dolorem in. Nobis neque sed non qui ea.',6587.72,4),(21,'minus','Sunt voluptate dolore nihil sunt hic. Ut iusto delectus ipsa est quia. Corporis iure voluptatibus provident cum corrupti et laboriosam. Explicabo facilis ea facere ullam dolorem temporibus delectus.',999999.99,1),(22,'est','Molestiae culpa et vel et enim sed. Aut vel eos molestiae neque. Consequatur qui ipsum quam vel pariatur consequatur. Dolores perspiciatis veniam quas impedit sit officiis nam.',0.00,2),(23,'culpa','Dolores possimus ea sit non in. Blanditiis doloremque nesciunt est aut optio. Vitae eius iure rem omnis. Ea minima dolor atque sequi ut.',7662.32,3),(24,'quaerat','Ratione ea quasi vel fuga omnis vitae qui aspernatur. Ex laboriosam ut asperiores in. Dicta voluptate id earum occaecati repellendus quam.',0.38,4),(25,'eaque','Voluptatem aspernatur cumque minus. Rerum consequuntur laudantium et sit et voluptates.',183.00,1),(26,'animi','Aspernatur sit architecto vel dolore sint aut. Blanditiis inventore nihil labore et qui inventore nemo. Eos reprehenderit magni omnis id beatae ipsam eum saepe.',41147.72,2),(27,'tenetur','Perferendis non excepturi ea voluptatum. Quia illo cupiditate sint laborum. Laborum dolorum dolorem earum nulla cumque.',295.40,3),(28,'accusantium','Atque qui architecto quis eaque delectus odio. Assumenda corporis iste aperiam. Qui iste eum sed rerum. Eius quaerat quis facilis deserunt earum aut repellendus.',0.15,4),(29,'quis','Molestiae natus non possimus culpa culpa. Odio officia et error blanditiis perferendis ut ipsam. Deserunt fugit assumenda repellat aliquam. Sit eius ipsum qui aliquid.',871692.36,1),(30,'blanditiis','Id earum sed pariatur non officiis. Doloribus tenetur sit quia ut qui. Quam et voluptatem officia magnam fugiat qui assumenda.',5627.30,2),(31,'vel','Similique illo atque nihil nemo nesciunt perspiciatis eveniet. Sint est similique possimus molestiae voluptatem qui. Ut numquam et illo possimus. Aut eos assumenda laboriosam.',496840.00,3),(32,'ea','Praesentium odio hic accusamus molestiae porro delectus. Voluptatem repellat natus quia quia. Et aut et ipsa quae architecto. Deleniti velit aut deleniti vel.',0.86,4),(33,'asperiores','Sit architecto vero accusamus tempore assumenda facere. Ipsum dolor libero deleniti sapiente porro et architecto debitis. Qui modi nobis aut ad voluptates eius. Esse fuga et est adipisci officia. Vel in consequatur alias sunt laudantium.',47.00,1),(34,'quas','Enim velit qui rerum blanditiis possimus. Earum culpa molestiae et dignissimos. Dolorem ipsum sed dolore.',397573.28,2),(35,'sed','Ea quidem sed ab eligendi voluptatem. Quidem neque maiores ad. Dicta aut quis cumque illo numquam tempora dolores alias.',266514.08,3),(36,'sit','Molestiae culpa consequuntur nemo eveniet totam nemo. Et non recusandae repellendus inventore corporis. Accusamus quos dolor unde consequatur quidem. Minus quidem cumque pariatur cumque quisquam.',2801.89,4),(37,'non','Dolore aliquam in officiis. Id dignissimos praesentium natus consequatur molestiae id dignissimos. Libero velit aperiam eveniet in eos placeat perferendis placeat.',999999.99,1),(38,'dolor','Facere voluptatem neque placeat. Aut dolor vero rem illo. Cum quidem quo aliquam eum. Voluptas illum autem maiores minus perferendis fugiat et assumenda.',324415.10,2),(39,'voluptas','Aliquam quaerat laborum necessitatibus iure exercitationem sit dolor. Veniam quo dicta quas dolorem. Consequatur velit totam repellat amet. Esse perferendis unde ut deserunt pariatur non qui. Ex laboriosam omnis rem ipsam.',999999.99,3),(40,'vero','Impedit qui dolor adipisci est dolore. Error consequatur dolorum maxime ut dolor ullam. Commodi nesciunt quasi voluptatem rerum aut sunt.',0.00,4),(41,'nihil','Eum quo architecto qui iusto excepturi. Occaecati dolor ipsam esse sed dolor. Rem eligendi minima eaque magni qui.',29357.60,1),(42,'facere','Eos velit et ut vero at est natus. Blanditiis velit aliquid nesciunt deserunt voluptates quo ut modi. Quibusdam est dolores laboriosam nam. Debitis voluptas numquam fugiat.',999999.99,2),(43,'fugit','Impedit culpa recusandae minus dolores facere. Velit labore rerum pariatur aut. Quisquam molestiae a accusantium nostrum qui quam mollitia. Ab dolor id pariatur quos eligendi.',999999.99,3),(44,'ratione','Id fuga sed in numquam. Cumque itaque sunt nesciunt provident rerum esse eum qui. Quisquam sed adipisci esse. Assumenda omnis inventore eveniet voluptatem quod omnis fugit consectetur.',3.53,4),(45,'pariatur','Saepe blanditiis et corporis delectus cumque quia. Quia et et rerum in. Voluptatem aut autem perferendis sint possimus eligendi consequatur itaque. Aut soluta repellendus aut esse.',0.00,1),(46,'eum','Nostrum nihil omnis atque quo consequatur. Nulla repellendus et a consequatur similique laboriosam sit. Vel sunt ut fuga et.',0.00,2),(47,'vitae','Voluptatibus est quis possimus eos vel. Enim hic voluptas natus id facilis sapiente aut dolores. Debitis molestiae eaque incidunt suscipit. Sit cumque porro velit non voluptatem enim. Perspiciatis eos sapiente soluta.',0.00,3),(48,'suscipit','Magnam culpa temporibus ab ipsam incidunt qui exercitationem. Nostrum doloremque nostrum sed adipisci ut deleniti fuga. Quia vitae repellendus doloremque voluptas.',0.00,4),(49,'tempore','Placeat officia commodi itaque labore consequatur voluptatibus. Enim ipsa eum ut modi. Voluptas est alias eos aut nostrum architecto. Magni natus rem ut.',37.39,1),(50,'consequatur','Aut nulla tempora ex qui fuga nulla. Ipsum ea doloribus ut inventore asperiores nostrum tempore. Consequatur ex iusto sed odit neque consequuntur eius suscipit.',114085.21,2),(51,'laborum','Dolorem quibusdam nihil magni vero perferendis corrupti. Non saepe perferendis et quia. Temporibus inventore et voluptatibus sit.',999999.99,3),(52,'similique','Commodi recusandae aut asperiores eum. Labore facilis et velit qui ea ut ut. Eaque vel reprehenderit nihil laboriosam consequuntur iusto. Quia aut magnam porro quisquam.',607.66,4),(53,'cupiditate','Totam doloribus voluptatem beatae laudantium quia. Voluptatem atque consequatur deleniti corrupti atque. Vel vel laboriosam quisquam in odio voluptatem sunt. Dolorem consequatur ex deserunt numquam.',404833.77,1),(54,'recusandae','Eveniet doloremque eum libero veniam sit. Ea minima a id mollitia. Voluptas magnam nihil debitis itaque autem perspiciatis. Qui sapiente unde ratione repellendus architecto et odio.',14.92,2),(55,'qui','Quo in sapiente architecto animi. Quos et molestiae molestias unde rerum illo. Et quia accusamus ipsam quia laudantium aspernatur. Nulla quos dolorem maxime nemo consequatur quidem qui. Quis et sit et ipsum atque recusandae odit.',0.00,3),(56,'id','Iste perferendis praesentium facere facere sint. Quidem sint ullam tempora id perspiciatis quas. Quia est aut voluptatem tempore natus sed quidem. Autem iusto sunt quo deserunt esse.',300322.32,4),(57,'minima','Itaque nulla et commodi. Temporibus quasi laborum doloremque ut. Error magnam culpa adipisci.',170948.68,1),(58,'officiis','Autem fugit dolor voluptas esse eius. Aut esse possimus exercitationem sunt. Mollitia architecto consequatur temporibus eum.',151.00,2),(59,'magnam','Quam ut dolorem magni. Consectetur et cum veritatis. Quasi ea magni autem tenetur maiores.',119821.08,3),(60,'fuga','Est commodi ipsam necessitatibus amet est omnis blanditiis. Blanditiis dolor vero qui ut. Voluptas maiores ut maxime quidem rerum eius amet. Assumenda ut eum dolores nam et fugiat.',420.87,4),(61,'doloremque','Soluta voluptatum nisi totam modi minus est numquam. Provident tenetur reiciendis qui voluptatum earum. Iste cum blanditiis eius quidem consectetur aut.',0.00,1),(62,'velit','Distinctio nihil ipsum ipsa dolor omnis ut consequatur. Quo pariatur molestias neque fuga ex id aperiam sunt. Non quod quis molestiae eligendi.',1853.30,2),(63,'at','Repellat porro aut culpa vero. Et autem eligendi illo error temporibus vel consequatur.',203.75,3),(64,'harum','Sit voluptatibus esse eos aperiam eos optio. Placeat rerum et sed adipisci. Dolore molestiae saepe voluptatem.',999999.99,4),(65,'aspernatur','Provident delectus et quam dolor consequatur dolorum. Libero aspernatur voluptas atque nam tempore eum consequatur. Et sit laborum delectus omnis itaque eaque.',999999.99,1),(66,'corporis','Sint voluptates enim incidunt a ab necessitatibus tempora. Minima ratione iure magni ipsa voluptate aut. Natus velit neque quidem nam minima amet voluptas dolore. Impedit rerum accusamus debitis nam.',5002.06,2),(67,'commodi','Est perferendis et aperiam sunt non quos. Nam voluptatum voluptas nisi ullam excepturi magnam. Ex repudiandae quas omnis eum veniam officia. Ut eius vero dolor minus esse.',13890.00,3),(68,'earum','Sequi facilis similique amet explicabo. Libero et dolorem quia quia accusantium. Eos sequi et distinctio veniam aut. Nihil adipisci in illo vel labore minus.',2.60,4),(69,'natus','Sit quos ut ut ipsum. Voluptas qui cum magni qui tempore neque. Necessitatibus et est vel excepturi voluptate.',17545.00,1),(70,'eos','Natus aut sint deserunt sunt molestiae veritatis. Qui error ea illum beatae iste. Saepe expedita aut tenetur totam fuga. Et dolorem dolorem consequatur amet unde.',18163.60,2),(71,'nobis','Inventore eum suscipit possimus eum sunt voluptas dolore. Sint excepturi neque earum voluptate enim tenetur. Maiores impedit odio et molestiae.',0.00,3),(72,'tempora','Voluptatem doloribus facere ratione sint. Et sequi quia iure porro est eveniet et. Molestiae ex eveniet suscipit quos consequatur ab. Dolorem ut sit et est quod qui aperiam id.',29264.37,4),(73,'error','Velit molestiae mollitia impedit repellendus velit iure voluptas. Nesciunt officia pariatur magnam autem ut. Unde aspernatur aliquid sit nemo rerum nam. Et quam consequatur nihil necessitatibus a saepe et.',680813.59,1),(74,'magni','Maxime eos velit quo saepe enim. Unde placeat accusantium sed qui tenetur est. Nisi magni dignissimos quis sed.',26038.40,2),(75,'quo','Labore dolore illum a unde est sed repellendus. Quidem est esse in. Optio est culpa occaecati dolorem sapiente necessitatibus. Vel voluptates cumque doloribus voluptates voluptatem. Molestiae ut culpa sequi sit beatae maxime voluptatibus alias.',147.17,3),(76,'eius','Placeat reiciendis et deserunt fuga. Sed beatae rem ab voluptas. Non quia voluptatem eaque rerum beatae molestiae.',7802.45,4),(77,'nulla','Qui enim et quia. Sed non asperiores magni est. Ab dolor odio et consequatur.',0.60,1),(78,'quidem','Id alias esse quas et odio eos quia. Dolorem aut voluptatem sint corrupti voluptate consequatur. Tempora autem deleniti aut.',0.00,2),(79,'aperiam','Tempora est vel accusantium ut autem. Commodi labore et consectetur nesciunt quasi rem. Cumque et atque necessitatibus et ut.',22301.74,3),(80,'amet','Modi accusantium qui id excepturi qui. Est culpa dolor iure ullam. Nesciunt corrupti a rerum consectetur.',12059.30,4),(81,'temporibus','Omnis vel qui nulla. At rerum amet consequatur eius. Ipsam optio deserunt laudantium quia.',4.00,1),(82,'numquam','Delectus aperiam quibusdam eaque dolores dolorum eos sit. Repudiandae itaque recusandae delectus tempore esse et. Quod labore iste odit. Quos neque atque sequi aut non nostrum.',999999.99,2),(83,'ad','Numquam a dolor ut et. Voluptatem culpa occaecati sint. Cupiditate praesentium vero deserunt nihil quae. Repellat harum sint quas enim doloribus consequatur sunt voluptatum.',999999.99,3),(84,'in','Odio explicabo possimus qui. Ducimus est ex expedita vero minima numquam. Exercitationem animi cum sunt aspernatur error et.',4.70,4),(85,'molestiae','Tempora aut non consequatur aut quo. Quo reiciendis non voluptate voluptatem exercitationem ea. Commodi laborum sunt voluptatem accusamus delectus eaque corporis ducimus. Id iusto ut aut labore voluptatem.',1.46,1),(86,'mollitia','Ut atque voluptatem nisi facere qui saepe. Enim quia placeat sunt explicabo facilis. Eos nisi aut praesentium quia. Est qui quia aliquam qui ut neque. Commodi voluptas dolorum neque inventore nisi quos.',999999.99,2),(87,'omnis','Quos eveniet et voluptatem eaque ea quasi praesentium. Velit tenetur sit quos fugit voluptate doloribus. Nesciunt quia omnis nemo corporis rerum aspernatur.',999999.99,3),(88,'excepturi','Ipsa explicabo facere et ea aut consequatur nam. Non facilis sed saepe nisi quaerat fugiat vitae. Iste aut similique sequi sint rerum.',17681.00,4),(89,'voluptate','Provident autem amet ad. Et sit perspiciatis et alias. Tempore odit eum sed culpa quas. Excepturi pariatur totam repellendus nam quasi nisi vel.',28.88,1),(90,'perspiciatis','Error numquam nostrum voluptatum et. Vitae vel totam inventore occaecati. Vel eaque et qui vero voluptatem molestiae eos numquam. Quia ipsum inventore excepturi minus reprehenderit et tenetur.',799.11,2),(91,'odit','Non et est et perspiciatis dicta. Dolore quia sed nulla nihil et dicta. Dolorem natus nihil quia similique culpa aspernatur. Eos dolorem ut quos laboriosam accusamus quo non.',1551.37,3),(92,'veritatis','Vel omnis quasi minus aut ut. Saepe fugit natus occaecati enim. Dolorum quia minus aut fuga eaque rerum. Et est id voluptas quas ea rem sit. Omnis iste molestiae amet tempore accusamus ut adipisci.',999999.99,4),(93,'illo','Perspiciatis velit hic culpa quia illum nemo tempora aut. Odio nostrum et rerum accusamus. Nam eos consequuntur in esse eligendi culpa.',337070.40,1),(94,'distinctio','Repellendus a aut hic et doloremque. Doloremque quas nemo nostrum id. Ipsa impedit saepe aspernatur maxime alias.',3955.02,2),(95,'corrupti','Provident laborum earum temporibus provident autem itaque quo. Quibusdam hic magni eaque ab libero sint qui adipisci. Facere fugit nobis rerum et molestiae. Tempore molestiae molestiae molestiae atque.',920948.97,3),(96,'aliquam','Amet dolorem ut aut incidunt ex in et. Numquam ratione consectetur sint maiores. Accusamus ratione nesciunt id sapiente temporibus veritatis dolor.',144477.35,4),(97,'optio','Dolor ea optio iste eaque occaecati velit. Necessitatibus quas officiis eos et amet laborum quibusdam. Adipisci rerum earum modi ut.',9.00,1),(98,'adipisci','Dolorem eligendi deleniti quo eaque nihil voluptate aut. Mollitia molestiae illum totam. Sint id alias odit consequatur illum aut ut.',62364.00,2),(99,'maxime','Ut provident sapiente maiores distinctio. Accusantium molestiae harum rerum quis voluptatem. Laudantium voluptate ratione rerum.',999999.99,3),(100,'dolore','Nihil autem non autem dolores. Dolore quam et corporis cumque ipsa. Repudiandae sit quam soluta eum asperiores occaecati.',1248.62,4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `value` int unsigned DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `storehouses_products_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `storehouses_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,16),(2,2,2,7),(3,3,3,17),(4,1,4,9),(5,2,5,10),(6,3,6,16),(7,1,7,7),(8,2,8,4),(9,3,9,15),(10,1,10,1),(11,2,11,20),(12,3,12,8),(13,1,13,6),(14,2,14,5),(15,3,15,10),(16,1,16,2),(17,2,17,12),(18,3,18,2),(19,1,19,4),(20,2,20,17),(21,3,21,19),(22,1,22,10),(23,2,23,3),(24,3,24,6),(25,1,25,13),(26,2,26,6),(27,3,27,10),(28,1,28,19),(29,2,29,19),(30,3,30,17),(31,1,31,12),(32,2,32,5),(33,3,33,20),(34,1,34,9),(35,2,35,6),(36,3,36,14),(37,1,37,15),(38,2,38,4),(39,3,39,11),(40,1,40,2),(41,2,41,11),(42,3,42,6),(43,1,43,19),(44,2,44,4),(45,3,45,16),(46,1,46,15),(47,2,47,17),(48,3,48,18),(49,1,49,2),(50,2,50,18),(51,3,51,20),(52,1,52,19),(53,2,53,14),(54,3,54,2),(55,1,55,11),(56,2,56,18),(57,3,57,12),(58,1,58,12),(59,2,59,4),(60,3,60,18),(61,1,61,11),(62,2,62,4),(63,3,63,12),(64,1,64,9),(65,2,65,19),(66,3,66,2),(67,1,67,20),(68,2,68,11),(69,3,69,4),(70,1,70,9),(71,2,71,18),(72,3,72,20),(73,1,73,15),(74,2,74,20),(75,3,75,3),(76,1,76,7),(77,2,77,8),(78,3,78,4),(79,1,79,15),(80,2,80,2),(81,3,81,17),(82,1,82,11),(83,2,83,4),(84,3,84,18),(85,1,85,19),(86,2,86,1),(87,3,87,4),(88,1,88,13),(89,2,89,11),(90,3,90,20),(91,1,91,9),(92,2,92,5),(93,3,93,10),(94,1,94,6),(95,2,95,17),(96,3,96,7),(97,1,97,10),(98,2,98,18),(99,3,99,18),(100,1,100,20),(101,2,1,18),(102,3,2,4),(103,1,3,7),(104,2,4,5),(105,3,5,2),(106,1,6,7),(107,2,7,8),(108,3,8,4),(109,1,9,10),(110,2,10,18),(111,3,11,9),(112,1,12,6),(113,2,13,14),(114,3,14,15),(115,1,15,11),(116,2,16,15),(117,3,17,4),(118,1,18,20),(119,2,19,19),(120,3,20,15),(121,1,21,12),(122,2,22,4),(123,3,23,6),(124,1,24,12),(125,2,25,4),(126,3,26,18),(127,1,27,16),(128,2,28,17),(129,3,29,2),(130,1,30,19),(131,2,31,11),(132,3,32,11),(133,1,33,20),(134,2,34,12),(135,3,35,18),(136,1,36,13),(137,2,37,12),(138,3,38,9),(139,1,39,7),(140,2,40,18),(141,3,41,18),(142,1,42,13),(143,2,43,12),(144,3,44,20),(145,1,45,5),(146,2,46,14),(147,3,47,15),(148,1,48,18),(149,2,49,11),(150,3,50,6),(151,1,51,11),(152,2,52,11),(153,3,53,8),(154,1,54,20),(155,2,55,3),(156,3,56,6),(157,1,57,17),(158,2,58,10),(159,3,59,3),(160,1,60,15),(161,2,61,12),(162,3,62,7),(163,1,63,17),(164,2,64,11),(165,3,65,6),(166,1,66,10),(167,2,67,9),(168,3,68,5),(169,1,69,13),(170,2,70,14),(171,3,71,9),(172,1,72,14),(173,2,73,10),(174,3,74,5),(175,1,75,18),(176,2,76,3),(177,3,77,2),(178,1,78,9),(179,2,79,9),(180,3,80,7),(181,1,81,12),(182,2,82,12),(183,3,83,11),(184,1,84,11),(185,2,85,18),(186,3,86,18),(187,1,87,18),(188,2,88,15),(189,3,89,4),(190,1,90,4),(191,2,91,10),(192,3,92,7),(193,1,93,16),(194,2,94,17),(195,3,95,1),(196,1,96,20),(197,2,97,18),(198,3,98,7),(199,1,99,17),(200,2,100,15),(201,3,1,6),(202,1,2,6),(203,2,3,19),(204,3,4,6),(205,1,5,1),(206,2,6,11),(207,3,7,13),(208,1,8,13),(209,2,9,6),(210,3,10,17),(211,1,11,10),(212,2,12,10),(213,3,13,11),(214,1,14,13),(215,2,15,6),(216,3,16,11),(217,1,17,11),(218,2,18,20),(219,3,19,16),(220,1,20,8),(221,2,21,16),(222,3,22,9),(223,1,23,8),(224,2,24,17),(225,3,25,19),(226,1,26,15),(227,2,27,8),(228,3,28,15),(229,1,29,8),(230,2,30,6),(231,3,31,1),(232,1,32,14),(233,2,33,18),(234,3,34,6),(235,1,35,20),(236,2,36,5),(237,3,37,14),(238,1,38,19),(239,2,39,17),(240,3,40,1),(241,1,41,3),(242,2,42,14),(243,3,43,19),(244,1,44,8),(245,2,45,5),(246,3,46,3),(247,1,47,11),(248,2,48,3),(249,3,49,2),(250,1,50,20),(251,2,51,8),(252,3,52,15),(253,1,53,4),(254,2,54,12),(255,3,55,4),(256,1,56,8),(257,2,57,4),(258,3,58,13),(259,1,59,17),(260,2,60,10),(261,3,61,1),(262,1,62,18),(263,2,63,2),(264,3,64,19),(265,1,65,14),(266,2,66,18),(267,3,67,16),(268,1,68,20),(269,2,69,5),(270,3,70,3),(271,1,71,12),(272,2,72,7),(273,3,73,3),(274,1,74,4),(275,2,75,15),(276,3,76,18),(277,1,77,2),(278,2,78,13),(279,3,79,7),(280,1,80,10),(281,2,81,6),(282,3,82,4),(283,1,83,3),(284,2,84,14),(285,3,85,14),(286,1,86,4),(287,2,87,20),(288,3,88,12),(289,1,89,15),(290,2,90,7),(291,3,91,18),(292,1,92,18),(293,2,93,6),(294,3,94,15),(295,1,95,20),(296,2,96,7),(297,3,97,3),(298,1,98,3),(299,2,99,8),(300,3,100,7);
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Основной'),(2,'Магазин'),(3,'Дополнительный');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dolores','80149231','1987-10-02','2000-08-05 09:19:20','1984-06-30 02:50:20'),(2,'et','68134129','1995-04-29','1980-08-22 15:43:08','2019-04-21 19:20:19'),(3,'fuga','70105377','2007-03-06','1974-09-15 00:00:36','2019-03-08 03:25:11'),(4,'nobis','59756620','1991-06-03','2019-05-05 01:11:32','1992-05-02 14:38:17'),(5,'eos','79045308','2006-09-13','2001-02-28 18:16:31','2006-09-09 17:34:12'),(6,'rem','05015467','1987-03-12','1985-12-17 06:09:56','1993-12-19 22:12:33'),(7,'officia','14241703','1986-12-16','1970-12-15 22:35:57','1985-12-20 04:07:54'),(8,'ullam','14691591','2018-01-31','1970-10-13 07:35:50','2008-06-10 09:54:48'),(9,'asperiores','64820941','1976-03-31','1996-06-02 03:48:50','2021-01-20 16:48:44'),(10,'corrupti','48090612','1984-01-11','2021-06-05 05:58:37','1987-10-15 18:56:07'),(11,'rerum','82912048','1994-03-20','1984-06-01 16:37:45','1980-02-23 11:01:38'),(12,'fugiat','71952383','2007-04-04','1986-03-30 19:13:29','2016-06-24 15:54:38'),(13,'occaecati','34299562','2008-12-15','2007-03-23 09:49:34','2005-08-19 10:18:48'),(14,'qui','42067047','2008-08-19','1998-04-16 02:55:54','1983-04-20 05:53:29'),(15,'deserunt','25763980','1987-12-23','2011-07-26 23:09:25','1981-10-13 23:37:27'),(16,'pariatur','66372295','1980-06-06','1989-09-10 11:57:36','2018-06-17 04:41:28'),(17,'ut','72727539','1979-11-13','1978-04-11 05:52:53','2006-10-06 14:19:14'),(18,'dicta','07596810','1971-08-07','1987-08-01 23:38:10','1988-07-06 22:00:52'),(19,'ex','18671315','1992-11-08','1995-12-15 21:05:31','2013-08-28 00:38:18'),(20,'quod','97209539','2005-04-16','1976-07-23 05:48:53','2001-02-21 17:00:06'),(21,'ipsum','09613003','1984-04-11','2004-07-27 09:13:04','1971-01-07 01:59:39'),(22,'voluptatem','09534131','1987-09-01','1997-08-14 03:53:26','1984-01-28 05:02:55'),(23,'ea','38593741','1976-01-13','2005-05-26 12:47:29','2006-06-03 03:40:41'),(24,'minima','85188716','1987-08-03','2014-03-26 14:22:24','1983-12-03 15:25:10'),(25,'laborum','64790077','2021-08-22','2002-10-03 06:38:11','1971-11-01 04:03:23'),(26,'at','76100376','2013-08-10','2008-11-14 15:28:55','1997-09-07 18:27:57'),(27,'accusantium','82156183','1971-06-27','1996-05-18 19:51:25','2001-11-19 11:52:38'),(28,'aperiam','60063762','1992-05-08','2018-12-10 16:49:25','1976-12-12 07:55:11'),(29,'iure','72012765','1990-11-14','2019-08-14 21:57:59','1986-03-11 22:26:29'),(30,'praesentium','98671755','1995-06-03','2020-11-14 11:14:12','2018-09-18 19:12:43'),(31,'dolore','46747983','1986-12-26','2001-04-12 20:35:34','1983-09-27 22:16:13'),(32,'consequuntur','56692945','1970-08-20','1985-05-29 18:01:12','1991-01-22 13:49:41'),(33,'eius','98343577','2010-02-10','1979-05-25 04:34:41','1979-10-05 08:44:11'),(34,'aspernatur','33192048','2004-11-18','1977-05-26 10:13:06','2021-09-18 01:07:52'),(35,'suscipit','46110794','1998-11-17','1975-04-28 13:21:49','1970-05-12 22:05:38'),(36,'eligendi','09522459','1987-09-19','2003-01-29 23:51:57','1999-05-20 09:07:30'),(37,'perspiciatis','11854333','2002-06-30','2007-04-11 20:14:19','1984-04-05 05:52:05'),(38,'nam','34216408','1977-11-01','1984-03-06 14:00:44','2011-02-24 20:11:19'),(39,'est','05136131','1984-01-10','1983-05-30 16:17:10','1989-01-21 05:19:32'),(40,'voluptates','76609121','2012-12-03','1975-01-29 18:14:29','1980-11-27 20:54:29'),(41,'delectus','61621107','1987-07-22','2011-12-24 21:31:52','1983-03-11 01:19:07'),(42,'non','56331073','1985-08-27','2014-04-03 00:11:00','1992-04-06 08:37:16'),(43,'sed','74046225','1997-05-25','1982-03-16 19:13:27','2002-08-14 11:15:28'),(44,'placeat','58257807','1989-10-20','2015-09-26 05:59:45','1999-10-13 03:42:51'),(45,'nihil','57998190','1976-01-05','2000-08-20 06:56:32','1981-04-27 03:06:12'),(46,'tenetur','94133042','1975-06-29','2002-01-24 02:37:16','1978-12-18 16:25:00'),(47,'repellendus','41572412','1995-01-02','2011-01-27 23:21:24','1997-03-05 02:23:35'),(48,'minus','30378711','2013-12-09','1986-03-13 15:24:53','1986-05-26 03:55:03'),(49,'repudiandae','20929961','2020-05-04','1979-12-31 12:16:25','1988-05-16 15:35:50'),(50,'tempora','20447298','1982-02-22','1994-05-29 08:15:01','2019-11-13 13:33:31'),(51,'ab','75809294','2020-10-08','1987-04-30 15:11:24','2009-02-09 08:14:13'),(52,'sit','14379628','1984-12-20','1990-04-26 13:33:15','1987-03-04 04:14:38'),(53,'ipsa','02675893','2005-08-08','1975-12-04 08:08:43','2015-08-08 00:40:43'),(54,'reiciendis','95897400','1988-08-26','2005-08-22 02:26:57','1988-12-13 01:01:32'),(55,'sunt','69147524','2013-08-18','2013-05-29 02:15:17','1993-04-05 19:21:08'),(56,'impedit','37092153','2021-06-29','1982-09-24 22:31:47','1989-09-14 17:50:56'),(57,'quos','42432708','2008-01-25','1986-12-31 05:32:43','1998-12-27 16:46:24'),(58,'aut','15620194','1991-11-23','1983-03-01 22:54:55','2014-11-11 22:20:30'),(59,'consequatur','52617829','1970-04-07','2010-05-05 09:59:51','1990-12-03 16:47:25'),(60,'voluptas','39590688','1977-05-17','2004-11-07 13:16:17','1993-10-13 10:15:48'),(61,'id','57885131','2003-08-25','1987-07-19 23:26:44','1983-06-05 15:00:40'),(62,'libero','49277982','1999-12-19','2006-05-19 21:43:06','1972-08-01 01:08:50'),(63,'numquam','43096152','1984-06-05','1987-03-21 20:14:47','1993-11-06 19:33:50'),(64,'explicabo','49500981','1990-03-02','1993-09-29 12:52:22','2020-12-12 15:59:24'),(65,'mollitia','76055133','1997-01-21','2005-01-17 05:13:34','1977-05-04 05:12:29'),(66,'odit','25310450','2017-07-04','2008-12-15 17:44:53','1990-02-10 20:25:30'),(67,'earum','72686621','1980-08-03','2007-10-23 22:32:01','2020-02-25 07:04:40'),(68,'voluptatum','48937641','2015-07-29','1978-08-14 11:03:19','1977-02-02 07:49:16'),(69,'dolor','29517084','1972-03-22','1976-09-15 10:10:44','1996-12-21 11:03:23'),(70,'veniam','27355282','1989-02-25','1970-06-12 20:55:38','1972-09-08 13:37:48'),(71,'similique','32625998','2004-12-11','1979-12-24 19:22:43','1982-12-17 00:43:43'),(72,'error','54051669','1982-02-12','1977-08-21 20:37:05','1977-03-04 09:26:31'),(73,'possimus','53531452','1975-06-03','1997-05-28 09:42:51','1970-04-18 23:19:52'),(74,'velit','59340478','1975-09-25','1987-01-09 20:32:30','1995-08-16 12:20:04'),(75,'eum','32048971','2017-08-17','1985-07-15 05:36:47','1972-08-19 03:31:12'),(76,'doloremque','31055758','2008-07-04','1975-12-03 05:13:13','1999-11-10 13:40:08'),(77,'magni','92392618','2008-09-20','1971-02-15 04:14:10','1981-06-22 10:25:33'),(78,'quia','34201862','2001-03-05','1977-09-04 02:55:46','2006-06-05 08:47:33'),(79,'aliquid','26153261','1986-06-03','1977-05-12 13:46:41','2002-03-21 13:27:02'),(80,'laudantium','66394136','2007-08-16','2018-12-12 10:11:47','2015-12-17 19:10:08'),(81,'maxime','01042672','1994-11-02','1975-08-05 16:59:15','1970-07-28 05:59:13'),(82,'iusto','41923252','2012-01-22','1979-12-31 13:32:42','1998-08-08 19:30:29'),(83,'distinctio','32998948','2000-07-18','2019-06-06 12:20:02','2002-02-06 15:20:32'),(84,'nesciunt','35830009','2019-05-25','1981-06-09 14:20:44','1988-08-16 16:29:58'),(85,'in','76266119','1970-02-05','1996-01-09 14:33:02','1983-11-06 21:16:14'),(86,'quibusdam','28965725','1990-07-10','2012-01-17 04:39:59','1985-12-15 15:49:57'),(87,'quidem','44328382','2015-09-12','1994-04-05 08:13:09','1990-11-06 00:18:09'),(88,'molestias','51061883','2019-06-03','1996-12-26 13:05:34','2011-03-07 13:30:05'),(89,'nemo','54437319','2006-08-16','2013-11-03 15:55:46','2010-05-20 18:42:13'),(90,'expedita','68563950','2013-12-10','2020-10-18 17:06:02','2021-03-27 08:28:54'),(91,'totam','58998410','2018-11-24','1984-10-04 17:53:18','2017-09-15 12:20:50'),(92,'consectetur','25443042','1971-08-18','2018-07-03 04:05:22','2013-09-11 23:59:00'),(93,'facilis','33625850','1971-11-16','2017-01-06 06:10:56','2013-01-07 14:09:36'),(94,'quis','87717228','1995-11-27','1991-01-18 02:23:04','2021-02-06 14:47:11'),(95,'optio','87606690','2006-08-05','1993-07-22 18:02:06','1990-05-26 11:28:42'),(96,'soluta','33306834','1985-07-20','1992-02-16 12:29:27','1986-07-23 10:31:56'),(97,'maiores','30601062','1985-09-11','1975-12-21 21:22:49','2017-03-14 02:22:32'),(98,'beatae','24818810','1979-08-23','2018-10-06 03:42:56','2002-05-31 05:49:15'),(99,'molestiae','09057951','1972-05-03','2013-02-08 14:59:30','1994-10-30 11:35:21'),(100,'enim','76221132','2010-07-26','1997-06-14 09:42:28','2005-09-26 11:55:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-19 18:28:19
