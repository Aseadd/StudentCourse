-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: shega
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `courseCode` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creditHours` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Math','MATH 101','Mathematics',3),(2,'Programming','SE101','Programming Language',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrolled_students_student`
--

DROP TABLE IF EXISTS `course_enrolled_students_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrolled_students_student` (
  `courseId` int NOT NULL,
  `studentId` int NOT NULL,
  PRIMARY KEY (`courseId`,`studentId`),
  KEY `IDX_4a8abf62ce3cb67be296de535e` (`courseId`),
  KEY `IDX_09d9ae821c02e304fde4933ae7` (`studentId`),
  CONSTRAINT `FK_09d9ae821c02e304fde4933ae75` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4a8abf62ce3cb67be296de535e2` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrolled_students_student`
--

LOCK TABLES `course_enrolled_students_student` WRITE;
/*!40000 ALTER TABLE `course_enrolled_students_student` DISABLE KEYS */;
INSERT INTO `course_enrolled_students_student` VALUES (1,1),(1,2),(2,1),(2,2);
/*!40000 ALTER TABLE `course_enrolled_students_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_grades_grade`
--

DROP TABLE IF EXISTS `course_grades_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_grades_grade` (
  `courseId` int NOT NULL,
  `gradeId` int NOT NULL,
  PRIMARY KEY (`courseId`,`gradeId`),
  KEY `IDX_b804c88c08d6385b8b986631c6` (`courseId`),
  KEY `IDX_233f0eae74a1e0d8846f2c99ce` (`gradeId`),
  CONSTRAINT `FK_233f0eae74a1e0d8846f2c99cef` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`id`),
  CONSTRAINT `FK_b804c88c08d6385b8b986631c6c` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_grades_grade`
--

LOCK TABLES `course_grades_grade` WRITE;
/*!40000 ALTER TABLE `course_grades_grade` DISABLE KEYS */;
INSERT INTO `course_grades_grade` VALUES (1,1),(1,2),(2,1);
/*!40000 ALTER TABLE `course_grades_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `letterGrade` varchar(255) NOT NULL,
  `studentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_770cab79ce1d111bc05db17cfbd` (`studentId`),
  CONSTRAINT `FK_770cab79ce1d111bc05db17cfbd` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'B',1),(2,'D',1),(3,'B',2),(4,'C',1);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contactDetails` varchar(255) NOT NULL,
  `academicRecord` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John Doe','123-456-7890','Good'),(2,'Eyob','0911121212','Excellent');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses_course`
--

DROP TABLE IF EXISTS `student_courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses_course` (
  `studentId` int NOT NULL,
  `courseId` int NOT NULL,
  PRIMARY KEY (`studentId`,`courseId`),
  KEY `IDX_29e49d9ad51ffb927f488f0802` (`studentId`),
  KEY `IDX_d13666d470035a399961e1d08c` (`courseId`),
  CONSTRAINT `FK_29e49d9ad51ffb927f488f0802e` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_d13666d470035a399961e1d08cb` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses_course`
--

LOCK TABLES `student_courses_course` WRITE;
/*!40000 ALTER TABLE `student_courses_course` DISABLE KEYS */;
INSERT INTO `student_courses_course` VALUES (1,1),(1,2),(2,1),(2,2);
/*!40000 ALTER TABLE `student_courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grades_grade`
--

DROP TABLE IF EXISTS `student_grades_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grades_grade` (
  `studentId` int NOT NULL,
  `gradeId` int NOT NULL,
  PRIMARY KEY (`studentId`,`gradeId`),
  KEY `IDX_db06c9e7cd96eebc9fdf4b70b1` (`studentId`),
  KEY `IDX_da8b1c2154add44e6ae4a1c383` (`gradeId`),
  CONSTRAINT `FK_da8b1c2154add44e6ae4a1c3831` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`id`),
  CONSTRAINT `FK_db06c9e7cd96eebc9fdf4b70b10` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grades_grade`
--

LOCK TABLES `student_grades_grade` WRITE;
/*!40000 ALTER TABLE `student_grades_grade` DISABLE KEYS */;
INSERT INTO `student_grades_grade` VALUES (1,1),(1,2),(1,4),(2,1),(2,4);
/*!40000 ALTER TABLE `student_grades_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-12 23:53:58
