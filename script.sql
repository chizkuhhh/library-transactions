-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_app_grp3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_app_grp3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_app_grp3` DEFAULT CHARACTER SET utf8 ;
USE `db_app_grp3` ;

-- -----------------------------------------------------
-- Table `db_app_grp3`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_app_grp3`.`books` (
  `book_id` 				INT(4) NOT NULL,
  `title` 					VARCHAR(45) NOT NULL,
  `author` 					VARCHAR(45) NOT NULL,
  `isbn` 					BIGINT(13) NOT NULL,
  `section` 				ENUM('references', 'periodicals', 'fiction', 'non-fiction', 'filipiniana', 'miscellaneous') NOT NULL,
  `is_available_online` 	BOOLEAN NOT NULL,
  `is_available_offline` 	BOOLEAN NOT NULL,
  PRIMARY KEY (`book_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_app_grp3`.`borrowers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_app_grp3`.`borrowers` (
  `borrower_id` 		INT(6) NOT NULL,
  `first_name` 			VARCHAR(45) NOT NULL,
  `last_name` 			VARCHAR(45) NOT NULL,
  `email` 				VARCHAR(45) NOT NULL,
  `mobile_no` 			BIGINT(11) NOT NULL,
  `type_of_user` 		ENUM('S', 'T') NOT NULL,
  `quanti_borrowed` 	INT NOT NULL,
  `quanti_returned` 	INT NOT NULL,
  `quanti_lost_damage` 	INT NOT NULL,
  PRIMARY KEY (`borrower_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_app_grp3`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_app_grp3`.`staff` (
  `staff_id` 	INT(6) NOT NULL,
  `first_name` 	VARCHAR(45) NOT NULL,
  `last_name` 	VARCHAR(45) NOT NULL,
  `position` 	VARCHAR(45) NOT NULL,
  `email` 		VARCHAR(45) NOT NULL,
  `mobile_no` 	BIGINT(11) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_app_grp3`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_app_grp3`.`transactions` (
  `transaction_id` 		INT(4) NOT NULL,
  `book_id` 			INT(4) NOT NULL,
  `borrower_id` 		INT(6) NOT NULL,
  `checkout_date` 		DATE NOT NULL,
  `return_date` 		DATE NULL,
  `status` 				ENUM('returned', 'late', 'pending', 'approved', 'lost', 'damaged') NOT NULL,
  `authorizing_staff` 	INT(6) NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transactions_borrowers_idx` (`borrower_id` ASC),
  INDEX `fk_transactions_books1_idx` (`book_id` ASC),
  INDEX `fk_transactions_staff1_idx` (`authorizing_staff` ASC),
  CONSTRAINT `fk_transactions_borrowers`
    FOREIGN KEY (`borrower_id`)
    REFERENCES `db_app_grp3`.`borrowers` (`borrower_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `db_app_grp3`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_staff1`
    FOREIGN KEY (`authorizing_staff`)
    REFERENCES `db_app_grp3`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_app_grp3`.`incidents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_app_grp3`.`incidents` (
  `incident_id` 			INT(4) NOT NULL,
  `incident_date` 			DATE NOT NULL,
  `description` 	VARCHAR(100) NOT NULL,
  `book_id` 				INT(4) NOT NULL,
  `incident_type` 		ENUM('lost', 'damaged') NOT NULL,
  PRIMARY KEY (`incident_id`),
    FOREIGN KEY (`book_id`)
    REFERENCES books (`book_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Insert values into `books`
-- -----------------------------------------------------
INSERT INTO books
VALUES 	(1201, 'To Kill a Mockingbird', 'Harper Lee', 9780061120084, 'fiction', true, true),
		(1202, '1984', 'George Orwell', 9780451524935, 'fiction', true, true),
        (1203, 'Noli Me Tangere', 'José Rizal', 9780143039693, 'filipiniana', true, true),
        (1204, 'Introduction to Algorithms', 'Thomas H. Cormen et al.', 9780262033848, 'references', true, true),
        (1205, 'National Geographic', 'Various Authors', 1234567890123, 'periodicals', true, false),
        (1206, 'The Art of War', 'Sun Tzu', 9780141040076, 'miscellaneous', true, true),
        (1207, 'The Diary of a Young Girl', 'Anne Frank', 9780553296983, 'non-fiction', true, true);
        
        
-- -----------------------------------------------------
-- Insert values into `borrowers`
-- -----------------------------------------------------
INSERT INTO borrowers
VALUES 	(121501, 'Cara', 'Richards', 'cararich88@gmail.com', 09453597169, 'S', 0, 0, 0),
		(121502, 'Sam', 'Sung', 'samsSsung22@yahoo.com', 09453207492, 'T', 1, 1, 0),
        (121503, 'Letty', 'Thompsett', 'lettysworld53@gmail.com', 09634998831, 'T', 0, 0, 0),
        (121504, 'Jhemerlyn', 'Dimaguiba', 'jhemdims@gmail.com', 09201815390, 'S', 1, 1, 0);


-- -----------------------------------------------------
-- Insert values into `staff`
-- -----------------------------------------------------
INSERT INTO staff
VALUES 	(192001, 'Timotha', 'Lewis', 'Librarian', 'timothalewww@yahoo.com', 09200687017),
		(192002, 'Covid', 'Bryant', 'Custodian', 'covbry88@gmail.com', 09456758044);

-- -----------------------------------------------------
-- Insert values into `incidents`
-- -----------------------------------------------------
INSERT INTO incidents
VALUES 	(1401, '2023-03-26', 'torn page',1202, 'damaged'),
		(1402, '2023-02-26', 'wet book', 1204, 'damaged');
        
        
-- -----------------------------------------------------
-- Insert values into `transactions`
-- -----------------------------------------------------
INSERT INTO transactions
VALUES 	(1801, 1203, 121502, '2023-03-26', '2023-03-29', 'returned', 192002),
		(1802, 1201, 121504, '2023-07-10', '2023-07-26', 'late', 192001),
        (1803, 1202, 121503, '2023-06-15', '2023-07-01', 'returned', 192001),
		(1804, 1205, 121501, '2023-08-03', null, 'pending', null),
		(1805, 1206, 121504, '2023-09-20', null, 'approved', 192002);