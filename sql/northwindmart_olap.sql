-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2025 at 06:42 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Create Database & Use
DROP DATABASE IF EXISTS cy6er_bi_olap;
CREATE DATABASE cy6er_bi_olap;
USE cy6er_bi_olap;

-- --------------------------------------------------------

--
-- Table structure for table dim_customer
--

CREATE TABLE dim_customer (
  customer_id varchar(50) NOT NULL,
  company_name varchar(100) DEFAULT NULL,
  contact_name varchar(50) DEFAULT NULL,
  contact_title varchar(50) DEFAULT NULL,
  city varchar(50) DEFAULT NULL,
  country varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table dim_employee
--

CREATE TABLE dim_employee (
  employee_id int NOT NULL,
  employee_name varchar(100) DEFAULT NULL,
  title varchar(50) DEFAULT NULL,
  city varchar(50) DEFAULT NULL,
  country varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table dim_product
--

CREATE TABLE dim_product (
  product_id int NOT NULL,
  product_name varchar(100) DEFAULT NULL,
  category varchar(50) DEFAULT NULL,
  unit_price decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table dim_shipper
--

CREATE TABLE dim_shipper (
  shipper_id int NOT NULL,
  shipper_name varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table dim_time
--

CREATE TABLE dim_time (
  time_id int NOT NULL,
  full_date date DEFAULT NULL,
  day int DEFAULT NULL,
  month int DEFAULT NULL,
  month_name varchar(20) DEFAULT NULL,
  quarter int DEFAULT NULL,
  year int DEFAULT NULL,
  weekday varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table fact_sales
--

CREATE TABLE fact_sales (
  fact_id int NOT NULL,
  order_id int NOT NULL,
  customer_id varchar(50) NOT NULL,
  employee_id int NOT NULL,
  product_id int NOT NULL,
  shipper_id int NOT NULL,
  time_id int NOT NULL,
  unit_price decimal(10,2) NOT NULL,
  quantity int NOT NULL,
  discount decimal(5,2) NOT NULL,
  total_sales decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table dim_customer
--
ALTER TABLE dim_customer
  ADD PRIMARY KEY (customer_id);

--
-- Indexes for table dim_employee
--
ALTER TABLE dim_employee
  ADD PRIMARY KEY (employee_id);

--
-- Indexes for table dim_product
--
ALTER TABLE dim_product
  ADD PRIMARY KEY (product_id);

--
-- Indexes for table dim_shipper
--
ALTER TABLE dim_shipper
  ADD PRIMARY KEY (shipper_id);

--
-- Indexes for table dim_time
--
ALTER TABLE dim_time
  ADD PRIMARY KEY (time_id);

--
-- Indexes for table fact_sales
--
ALTER TABLE fact_sales
  ADD PRIMARY KEY (fact_id),
  ADD KEY customer_id (customer_id),
  ADD KEY employee_id (employee_id),
  ADD KEY product_id (product_id),
  ADD KEY shipper_id (shipper_id),
  ADD KEY time_id (time_id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table fact_sales
--
ALTER TABLE fact_sales
  MODIFY fact_id int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table fact_sales
--
ALTER TABLE fact_sales
  ADD CONSTRAINT fact_sales_ibfk_1 FOREIGN KEY (customer_id) REFERENCES dim_customer (customer_id),
  ADD CONSTRAINT fact_sales_ibfk_2 FOREIGN KEY (employee_id) REFERENCES dim_employee (employee_id),
  ADD CONSTRAINT fact_sales_ibfk_3 FOREIGN KEY (product_id) REFERENCES dim_product (product_id),
  ADD CONSTRAINT fact_sales_ibfk_4 FOREIGN KEY (shipper_id) REFERENCES dim_shipper (shipper_id),
  ADD CONSTRAINT fact_sales_ibfk_5 FOREIGN KEY (time_id) REFERENCES dim_time (time_id);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;