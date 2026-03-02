-- phpMyAdmin SQL Dump (đã sửa cho MariaDB)
-- Host: localhost
-- Database: e-learning

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;

START TRANSACTION;

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `description` text,
  `image_url` varchar(500) NOT NULL,
  `teacher_name` varchar(100) NOT NULL,
  `teacher_avatar` varchar(500) NOT NULL,
  `old_price` decimal(10,2) DEFAULT '0.00',
  `current_price` decimal(10,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `courses` (`id`, `title`, `category`, `duration`, `description`, `image_url`, `teacher_name`, `teacher_avatar`, `old_price`, `current_price`, `created_at`) VALUES
(1, 'AWS Certified Solutions Architect', 'Design', '3 Month', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor', 'https://springo.vn/image/cache/data/top5ungdunghotrohoctienganh-_1600x900-800-resize-500x333.jpg', 'Lina', 'https://watermark.lovepik.com/photo/20211125/large/lovepik-foreign-graduates-happy-picture_501055503.jpg', 180.00, 80.00, '2025-12-09 16:12:57'),
(2, 'Khóa học JavaScript cơ bản', 'Development', '3 Month', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor', 'https://letdiv.com/wp-content/uploads/2024/04/khoa-hoc-javascript.jpg', 'Lina', 'https://watermark.lovepik.com/photo/20211125/large/lovepik-overseas-students-take-books-picture_501031928.jpg', 180.00, 80.00, '2025-12-09 16:12:57');

--
-- Table structure for `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'Credit Card',
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `full_name`, `payment_method`, `total_amount`, `created_at`) VALUES
(1, '6616102005', 'Credit Card', 405.00, '2025-12-09 03:17:43'),
(2, '6616102005', 'Credit Card', 165.00, '2025-12-09 03:57:29'),
(3, '6616102005', 'Credit Card', 85.00, '2025-12-09 04:01:34'),
(4, '6616102005', 'Credit Card', 165.00, '2025-12-09 04:12:29'),
(5, '6616102005', 'Credit Card', 85.00, '2025-12-09 04:19:22');

--
-- Table structure for `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `course_id` int NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_items` (`id`, `order_id`, `course_id`, `course_name`, `price`, `quantity`) VALUES
(1, 1, 1, 'AWS Certified Solutions Architect', 80.00, 4),
(2, 1, 2, 'Khóa học JavaScript cơ bản', 80.00, 1),
(3, 2, 1, 'AWS Certified Solutions Architect', 80.00, 2),
(4, 3, 1, 'AWS Certified Solutions Architect', 80.00, 1),
(5, 4, 1, 'AWS Certified Solutions Architect', 80.00, 2),
(6, 5, 1, 'AWS Certified Solutions Architect', 80.00, 1);

--
-- Table structure for `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'Minh Quang', 'admin@gmail.com', '$2y$12$FPYMwpGla95siWe5G2mrT.Yr.RO3xC6L6IqBDURYTIzP1VEookfQC', '2025-12-09 08:32:45', 'admin');

--
-- Indexes
--

ALTER TABLE `courses` ADD PRIMARY KEY (`id`);
ALTER TABLE `orders` ADD PRIMARY KEY (`id`);
ALTER TABLE `order_items` ADD PRIMARY KEY (`id`), ADD KEY `order_id` (`order_id`);
ALTER TABLE `users` ADD PRIMARY KEY (`id`);

--
-- Auto increment
--

ALTER TABLE `courses` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `orders` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `order_items` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `users` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Foreign key
--

ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

COMMIT;
