
-- Create Database
CREATE DATABASE IF NOT EXISTS `university_db`;
USE `university_db`;

-- Create Tables (without foreign keys)
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `role_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `company_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tenant_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(250) NOT NULL,
  `company_email` varchar(250) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `cp_name` varchar(250) NOT NULL,
  `cp_email` varchar(250) NOT NULL,
  `company_size` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `card_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_title` varchar(250) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `card_ten_worker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  `title` int NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `approved_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `reorder_level` int NOT NULL,
  `supplier_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `parking_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `issued_to` int NOT NULL,
  `car_number` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tag_expiry` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `gate_pass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `issued_to` varchar(250) NOT NULL,
  `issued_by` int NOT NULL,
  `issued_date` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `meeting_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `meeting_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` int NOT NULL,
  `start_time` datetime NOT NULL,
  `duration` datetime NOT NULL,
  `description` text NOT NULL,
  `reserved_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `news_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `expiry` datetime NOT NULL,
  `organizer` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Additional Tables
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  `purchase_date` datetime NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `cleaning_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `requested_by` int NOT NULL,
  `cost` int NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `complaints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(250) NOT NULL,
  `issue_date` datetime NOT NULL,
  `complaint_status` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `assign_to` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `event_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `permit_description` text NOT NULL,
  `requested_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `petty_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `used_by` int NOT NULL,
  `notes` text NOT NULL,
  `requested_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert Test Data
INSERT INTO `user_role` (`role_name`, `status`, `created_at`, `updated_at`) VALUES
('Admin', 1, NOW(), NOW()),
('Manager', 1, NOW(), NOW()),
('Staff', 1, NOW(), NOW()),
('Tenant', 1, NOW(), NOW());

INSERT INTO `users` (`name`, `email`, `pwd`, `phone`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
('Shahzaib', 'shahzaib@example.com', 'password123', '555-1234', 1, 1, NOW(), NOW()),
('Ali', 'ali@example.com', 'password123', '555-5678', 2, 1, NOW(), NOW()),
('Ahmed', 'ahmed@example.com', 'password123', '555-9012', 3, 1, NOW(), NOW());

INSERT INTO `company_size` (`name`, `status`, `created_at`, `updated_at`) VALUES
('Small (1-10)', 1, NOW(), NOW()),
('Medium (11-50)', 1, NOW(), NOW()),
('Large (51+)', 1, NOW(), NOW());

INSERT INTO `tenant_company` (`company_name`, `company_email`, `phone_number`, `cp_name`, `cp_email`, `company_size`, `created_at`, `updated_at`) VALUES
('Tech Innovators', 'info@techinnov.com', '555-1111', 'John Doe', 'john@techinnov.com', 1, NOW(), NOW()),
('Global Solutions', 'contact@globalsol.com', '555-2222', 'Jane Smith', 'jane@globalsol.com', 2, NOW(), NOW());

INSERT INTO `card_type` (`card_title`, `status`, `created_at`, `updated_at`) VALUES
('Employee Access Card', 1, NOW(), NOW()),
('Visitor Pass', 1, NOW(), NOW()),
('Contractor Badge', 1, NOW(), NOW());

INSERT INTO `supplier` (`name`, `contact`, `status`) VALUES
('Office Suppliers Inc', 'contact@officesupplies.com', 1),
('Tech Equipment Ltd', 'sales@techequip.com', 1);

INSERT INTO `card_ten_worker` (`type`, `title`, `issue_date`, `expiry_date`, `created_at`, `updated_at`, `status`, `approved_by`) VALUES
('Permanent', 1, NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NOW(), NOW(), 1, 1),
('Temporary', 2, NOW(), DATE_ADD(NOW(), INTERVAL 1 MONTH), NOW(), NOW(), 1, 1);

INSERT INTO `inventory` (`name`, `category`, `quantity`, `price`, `reorder_level`, `supplier_id`, `created_at`, `updated_at`, `status`) VALUES
('Office Chairs', 'Furniture', 25, 15000, 5, 1, NOW(), NOW(), 1),
('Projector', 'Electronics', 8, 35000, 2, 2, NOW(), NOW(), 1),
('Whiteboard Markers', 'Stationery', 100, 150, 20, 1, NOW(), NOW(), 1);

INSERT INTO `parking_tag` (`name`, `issued_to`, `car_number`, `status`, `created_at`, `updated_at`, `tag_expiry`) VALUES
('John Doe', 1, 'ABC-123', 1, NOW(), NOW(), DATE_ADD(NOW(), INTERVAL 6 MONTH)),
('Jane Smith', 2, 'XYZ-789', 1, NOW(), NOW(), DATE_ADD(NOW(), INTERVAL 6 MONTH));

INSERT INTO `gate_pass` (`name`, `issued_to`, `issued_by`, `issued_date`, `expiry`, `status`, `created_at`, `updated_at`) VALUES
('Main Gate Pass', 'John Doe', 1, NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY), 1, NOW(), NOW()),
('Service Entry Pass', 'Service Team', 2, NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY), 1, NOW(), NOW());

INSERT INTO `meeting_location` (`name`, `status`, `created_at`, `updated_at`) VALUES
('Main Conference Room', 1, NOW(), NOW()),
('Training Hall', 1, NOW(), NOW());

INSERT INTO `meeting_room` (`location`, `start_time`, `duration`, `description`, `reserved_by`, `created_at`, `updated_at`, `status`) VALUES
(1, DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 2 HOUR), 'Quarterly Planning', 1, NOW(), NOW(), 1),
(2, DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 3 HOUR), 'Team Training', 2, NOW(), NOW(), 1);

INSERT INTO `news_event` (`name`, `description`, `date`, `expiry`, `organizer`, `status`, `created_at`, `updated_at`) VALUES
('Tech Conference', 'Annual technology showcase event', DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_ADD(NOW(), INTERVAL 8 DAY), 1, 1, NOW(), NOW()),
('Health & Wellness', 'Employee wellness program launch', DATE_ADD(NOW(), INTERVAL 14 DAY), DATE_ADD(NOW(), INTERVAL 15 DAY), 2, 1, NOW(), NOW());