-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-01-03 10:39:06
-- 服务器版本： 10.4.21-MariaDB
-- PHP 版本： 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `epic_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `contact_number`, `password`, `register_time`, `admin_type`) VALUES
(1, 'test', 'test@gmail.com', '0123456789', 'nvoejnvnvwevnwenvweo', '0000-00-00 00:00:00', 'super_admin'),
(2, '111', '11', '11', '111', '2022-12-18 16:02:38', '111'),
(3, 'Test', 'test@test.com', '123123123', '', '2022-12-19 17:40:15', '111'),
(4, '11', '11', '11', '', '2022-12-19 17:40:26', 'super_admin'),
(5, '1', '1', '1', '', '2022-12-19 17:41:02', 'null'),
(6, '2', '2', '2', '', '2022-12-19 17:41:38', 'null');

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `image` blob NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`id`, `name`, `price`, `image`, `quantity`) VALUES
(27, 'Apple', '5999', 0x4170706c652e6a7067, 1),
(29, 'Xiaomi', '3999', 0x5869616f6d692e6a7067, 1);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Tops'),
(2, 'Dresses'),
(14, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `Admin` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `login`
--

INSERT INTO `login` (`ID`, `Admin`, `Password`, `Email`, `code`, `status`) VALUES
(1, 'admin', 'admin', '', 0, ''),
(16, 'liheng', '123', 'limliheng56@gmail.com', 0, 'verified'),
(17, 'limliheng', '12345', 'lihenglim452@gmail.com', 875011, 'verified'),
(18, 'chsbcvhs', '123', 'limliheng56@gmail.com', 0, ''),
(25, 'hi', '123456', 'lihenglim452@gmail.com', 875011, 'verified'),
(26, 'zikang', '123456789', 'zikang020430@gmail.com', 663076, 'verified');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `id` int(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `phone` int(100) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `method` varchar(1000) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`id`, `name`, `phone`, `email`, `method`, `address`, `total_products`, `total_price`) VALUES
(27, 'win', 99999, '1201202660@student.mmu.edu.my', 'cash on delivery', 'adasadscvfascf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(28, 'lim', 99999, '1201202660@student.mmu.edu.my', 'cash on delivery', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(29, 'jim', 99999, 'lee@gmail.com', 'cash on delivery', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(30, 'jim', 99999, '1201202660@student.mmu.edu.my', 'credit cart', 'addsfas', 'Samsung (1) , Apple (1) ', 10998),
(31, 'English', 99999, '1201202660@student.mmu.edu.my', 'credit cart', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(32, 'English', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(33, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(34, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(35, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(36, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'qqqq', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(37, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Samsung (1) , Apple (1) , Xiaomi (1) ', 14997),
(38, 'lim', 99999, '1201202660@student.mmu.edu.my', 'cash on delivery', '1', 'Apple (1) , Xiaomi (1) ', 9998),
(39, 'lim', 99999, '1201202660@student.mmu.edu.my', 'credit card', '1', 'Apple (1) , Xiaomi (1) ', 9998),
(40, 'aasfvdas', 0, 'sdafasf', 'credit card', 'dsafdasfasdf', 'Apple (1) , Xiaomi (1) ', 9998),
(41, 'lim', 523552153, '1201202660@student.mmu.edu.my', 'credit card', 'adeqeqrwesaf', 'Apple (1) , Xiaomi (1) ', 9998),
(42, 'English', 235235, '1201202660@student.mmu.edu.my', 'credit card', 'retgewrt', 'Apple (1) , Xiaomi (1) ', 9998),
(43, 'English', 235235, '1201202660@student.mmu.edu.my', 'cash on delivery', 'retgewrt', 'Apple (1) , Xiaomi (1) ', 9998),
(44, 'Lee Kang Yu', 1155015355, 'leeyukang1357924681@gmail.com', 'cash on delivery', 'NO 664-1，Jalan Abdul Rahman', 'Apple (1) , Xiaomi (1) ', 9998),
(45, 'Lee Kang Yu', 1155015355, 'leeyukang1357924681@gmail.com', 'credit card', 'NO 664-1，Jalan Abdul Rahman', 'Apple (1) , Xiaomi (1) ', 9998),
(46, 'Lee Kang Yu', 1155015355, 'leeyukang1357924681@gmail.com', 'credit card', 'NO 664-1，Jalan Abdul Rahman', 'Apple (1) , Xiaomi (1) ', 9998),
(47, 'Lee Kang Yu', 1155015355, 'leeyukang1357924681@gmail.com', 'credit card', 'NO 664-1，Jalan Abdul Rahman', 'Apple (1) , Xiaomi (1) ', 9998),
(48, '', 0, '', 'cash on delivery', '', 'Apple (1) , Xiaomi (1) ', 9998),
(49, '', 0, '', 'cash on delivery', '', 'Apple (1) , Xiaomi (1) ', 9998);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivered_to` varchar(150) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `deliver_address` varchar(255) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `pay_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `delivered_to`, `phone_no`, `deliver_address`, `pay_method`, `pay_status`, `order_status`, `order_date`, `total_products`, `total_price`) VALUES
(1, 2, 'Self', '9802234675', 'Matepani-12', 'Cash', 0, 1, '2022-04-10', '', 0),
(3, 2, 'Test  Firstuser', '980098322', 'matepani-12', 'Khalti', 1, 1, '2022-04-18', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `variation_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 500),
(3, 3, 3, 1, 890);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `uploaded_date` date NOT NULL DEFAULT current_timestamp(),
  `product_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unavailable, 1=available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_desc`, `product_image`, `price`, `category_id`, `uploaded_date`, `product_status`) VALUES
(2, 'Off Shoulder Crop Top', 'Crop Tops for Women Basic Off Shoulder Sexy Print V Neck Slim Shirt Vest with Button at Swiss Collecttion.', './uploads/offshoulder.jpg', 890, 1, '2022-04-04', 1),
(3, 'Off Shoulder Tops', 'Tops for Women Basic Off Shoulder V Neck Slim Shirt Vest with Button at Swiss Collecttion.', './uploads/tops.jpg', 600, 1, '2022-04-04', 0),
(4, 'Printed Crop Top', 'Cute Crop Tops for Women Basic Off Shoulder Sexy Print V Neck Slim Shirt Vest with Button at Swiss Collecttion.', './uploads/croptop.jpg', 700, 1, '2022-04-04', 0),
(5, 'Shirtdress', 'Shirt Dresses for Women Basic dresses with Button at Swiss Collecttion.', './uploads/shirtdress.jpg', 18500, 2, '2022-04-04', 0),
(6, 'Check Strappy Dress', 'Check Strappy Dresses for Women Basic dresses with Button at Swiss Collecttion.', './uploads/check-strappy-dress.jpg', 1250, 2, '2022-03-24', 0),
(9, 'test', 'hi', './uploads/4831437.jpg', 121212, 2, '2022-12-17', 0),
(10, 'Test', 'Test', './uploads/', 123, 1, '2022-12-20', 0),
(11, 'Test', '123', './uploads/', 123, 1, '2022-12-20', 0);

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `price` int(100) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(0, 'Apple', 5999, 0x4170706c652e6a7067),
(0, 'Xiaomi', 3999, 0x5869616f6d692e6a7067),
(0, 'Samsung', 4999, 0x53616d73756e672d47616c6178792d4e6f74652d32322d556c7472612e6a7067);

-- --------------------------------------------------------

--
-- 表的结构 `product_category`
--

CREATE TABLE `product_category` (
  `Category_id` int(11) NOT NULL,
  `Product_Category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product_category`
--

INSERT INTO `product_category` (`Category_id`, `Product_Category_name`) VALUES
(7, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `product_size_variation`
--

CREATE TABLE `product_size_variation` (
  `variation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product_size_variation`
--

INSERT INTO `product_size_variation` (`variation_id`, `product_id`, `size_id`, `quantity_in_stock`) VALUES
(1, 1, 4, 5),
(2, 2, 3, 9),
(3, 2, 2, 3),
(6, 3, 3, 6),
(7, 4, 2, 8),
(8, 5, 4, 8),
(9, 6, 2, 10),
(10, 7, 2, 10),
(11, 7, 3, 4);

-- --------------------------------------------------------

--
-- 表的结构 `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `product_id`, `review_desc`) VALUES
(1, 2, 2, 'Comfortable and stylish. I loved it.'),
(2, 2, 5, 'Perfect dress for summer.');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `registered_at` date NOT NULL DEFAULT current_timestamp(),
  `user_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `contact_no`, `registered_at`, `user_address`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$j9OXXIYS0CG5AYuks62YMeDvuIpo2hZEN4CqfJfujt1yPMnoUq5C6', '9810283472', '2022-04-10', 'newroad'),
(2, 'Test ', 'Firstuser', 'test@gmail.com', '$2y$10$DJOdhZy1InHTKQO6whfyJexVTZCDTlmIYGCXQiPTv7l82AdC9bWHO', '980098322', '2022-04-10', 'matepani-12');

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 表的索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- 表的索引 `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- 表的索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `variation_id` (`variation_id`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- 表的索引 `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`Category_id`);

--
-- 表的索引 `product_size_variation`
--
ALTER TABLE `product_size_variation`
  ADD PRIMARY KEY (`variation_id`),
  ADD UNIQUE KEY `uc_ps` (`product_id`,`size_id`);

--
-- 表的索引 `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `product_category`
--
ALTER TABLE `product_category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `product_size_variation`
--
ALTER TABLE `product_size_variation`
  MODIFY `variation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
