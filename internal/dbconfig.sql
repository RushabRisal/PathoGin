DROP DATABASE IF EXISTS `pathogindb`;

CREATE DATABASE `pathogindb`;

USE `pathogindb`;

CREATE TABLE `Patient` (
    `patient_id` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `patient_name` VARCHAR(255),
    `patient_sex` VARCHAR(10),
    `patient_age` INT,
    `age_type` VARCHAR(10),
    `patient_address` VARCHAR(255),
    `patient_contact` BIGINT,
    `patient_report` INT
);

CREATE TABLE `Referrer` (
    `referrer_id` int PRIMARY KEY NOT NULL,
    `referrer_name` VARCHAR(255) NOT NULL,
    `referrer_head` VARCHAR(255) NOT NULL,
    `referrer_contact` BIGINT NOT NULL,
    `commission` float NOT NULL
);

CREATE TABLE `Sample` (
    `sample_id` INT PRIMARY KEY NOT NULL,
    `collection_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `sample_specimen` VARCHAR(255) NOT NULL,
    `referrer` int NOT NULL
);

CREATE TABLE `Report` (
    `report_id` int PRIMARY KEY NOT NULL,
    `report_date` DATETIME,
    `report_list` VARCHAR(255)
);

CREATE TABLE `Users` (
    `user_id` int PRIMARY KEY NOT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `user_contact` BIGINT NOT NULL,
    `user_address` VARCHAR(255) NOT NULL,
    `user_role` SMALLINT UNSIGNED NOT NULL,
    `user_qualification` VARCHAR(255),
    `user_position` VARCHAR(255),
    `user_reg_number` VARCHAR(255),
    `user_signature` BLOB
);

CREATE TABLE `Lab` (
    `lab_registration_no` VARCHAR(255) PRIMARY KEY NOT NULL,
    `lab_name` VARCHAR(255) NOT NULL,
    `lab_address` VARCHAR(255) NOT NULL,
    `test_array` VARCHAR(255) NOT NULL
);

CREATE TABLE `UserTest` (
    `user_test_id` int PRIMARY KEY NOT NULL,
    `user_test_result` VARCHAR(255)
);

CREATE TABLE `TestInfo` (
    `test_id` int PRIMARY KEY NOT NULL,
    `test_name` VARCHAR(255) NOT NULL,
    `test_category` INT NOT NULL,
    `recommendation` INT,
    `test_range` BIGINT,
    `test_description` VARCHAR(255)
);

CREATE TABLE `Category` (
    `category_id` int PRIMARY KEY NOT NULL,
    `category_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Doctors` (
    `doctor_id` int PRIMARY KEY NOT NULL,
    `doctor_name` VARCHAR(255) NOT NULL,
    `doctor_reg_num` VARCHAR(255) NOT NULL,
    `doctor_location` VARCHAR(255)
);

ALTER TABLE `Patient` MODIFY `age_type` VARCHAR(10) COMMENT 'Years or Months?';

ALTER TABLE `Users` MODIFY `user_qualification` VARCHAR(255) COMMENT 'Only if role = lab_assistant';

ALTER TABLE `Users` MODIFY `user_position` VARCHAR(255) COMMENT 'Only if role = lab_assistant';

ALTER TABLE `Users` MODIFY `user_reg_number` VARCHAR(255) COMMENT 'Only if role = lab_assistant';

ALTER TABLE `Users` MODIFY `user_signature` BLOB COMMENT 'Only if role = lab_assistant';

ALTER TABLE `TestInfo` MODIFY `test_category` INT COMMENT 'Should be selected from drop-down';

ALTER TABLE `TestInfo`
ADD FOREIGN KEY (`recommendation`) REFERENCES `Doctors` (`doctor_id`);

ALTER TABLE `TestInfo`
ADD FOREIGN KEY (`test_category`) REFERENCES `Category` (`category_id`);

ALTER TABLE `Patient`
ADD FOREIGN KEY (`patient_report`) REFERENCES `Report` (`report_id`);

ALTER TABLE `Sample`
ADD FOREIGN KEY (`referrer`) REFERENCES `Referrer` (`referrer_id`);