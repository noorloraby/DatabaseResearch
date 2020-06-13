


DROP DATABASE IF EXISTS `car_rental_db`;

CREATE DATABASE `car_rental_db`;





-- creating table `agencies`


CREATE TABLE `agencies` (
  `agency_id` int(3) NOT NULL,
  `agency_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- creating table `customers`


CREATE TABLE `customers` (
  `customer_id` int(5) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `agency_id` int(3) NOT NULL,
  `customer_phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- creating table `rentals`


CREATE TABLE `rentals` (
  `rental_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `rental_start_date` date NOT NULL,
  `rental_return_date` date NOT NULL,
  `vehicle_id` int(5) NOT NULL,
  `agency_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- creating table `vehicles`


CREATE TABLE `vehicles` (
  `vehicle_id` int(5) NOT NULL,
  `vehicle_class_id` int(5) NOT NULL,
  `vehicale_details` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- creating table `vehicles_classes`


CREATE TABLE `vehicles_classes` (
  `vehicle_class_id` int(5) NOT NULL,
  `vehicle_class_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- indexes for dumped tables



-- indexes for table `agencies`

ALTER TABLE `agencies`
  ADD PRIMARY KEY (`agency_id`);


-- indexes for table `customers`

ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `agency_id` (`agency_id`);


-- indexes for table `rentals`

ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `agency_id` (`agency_id`);


-- indexes for table `vehicles`

ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `vehicle_class_id` (`vehicle_class_id`);


-- indexes for table `vehicles_classes`

ALTER TABLE `vehicles_classes`
  ADD PRIMARY KEY (`vehicle_class_id`);




ALTER TABLE `agencies`
  MODIFY `agency_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


-- auto_increment for table `customers`

ALTER TABLE `customers`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


-- auto_increment for table `rentals`

ALTER TABLE `rentals`
  MODIFY `rental_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- auto_increment for table `vehicles`

ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


-- auto_increment for table `vehicles_classes`

ALTER TABLE `vehicles_classes`
  MODIFY `vehicle_class_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


-- Constraints for dumped tables



-- Constraints for table `customers`

ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);


-- Constraints for table `rentals`

ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `rentals_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);


-- Constraints for table `vehicles`

ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`vehicle_class_id`) REFERENCES `vehicles_classes` (`vehicle_class_id`);
COMMIT;






-- inserting custom data for table `agencies`


INSERT INTO `agencies` (`agency_id`, `agency_location`) VALUES
(3, 'giza'),
(4, 'maady'),
(5, 'shobra'),
(6, 'alzamalek'),
(7, '6 octobor'),
(8, 'alhussien');



-- inserting custom data for table `customers`


INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_address`, `agency_id`, `customer_phone`) VALUES
(9, 'mahmoud mohamed', '4 Ali Ismail St. Mesaha Sq., DOKKI', 5, 1256987526),
(10, 'ismaiel ibrahim', 'Semouha Landmark Buildings', 4, 1563159637),
(11, 'noor mohamed', 'of Abbass El Akkaad St., Nasr City, Cairo', 6, 1369745632),
(12, 'ahmed eloraby', '2 El Sobky Street, Dahabi Square', 8, 1156325994),
(13, 'rashed elmosalamy', 'Corner St. No.254 and St. No.206, Degla', 7, 126358569);


-- inserting custom data for table `vehicles_classes`


INSERT INTO `vehicles_classes` (`vehicle_class_id`, `vehicle_class_name`) VALUES
(2, 'Hummer'),
(3, 'Hyundai'),
(4, 'Honda'),
(5, 'jeep'),
(6, 'lada');




-- inserting custom data for table `vehicles`


INSERT INTO `vehicles` (`vehicle_id`, `vehicle_class_id`, `vehicale_details`) VALUES
(1, 2, 'maximum top speed of - mph ( km/h), a curb weight of 2756 lbs (1250 kgs)'),
(2, 4, 'fuel consumption of 5.1 litres/100km - 55 mpg UK - 46 mpg US (Average), 0 to 100 km/h (62mph) in 9.1'),
(3, 3, 'maximum top speed of - mph ( km/h), a curb weight of - lbs ( kgs), the Rogue S35 2WD has a naturally'),
(4, 5, 'fuel consumption of 8.7 litres/100km - 32 mpg UK - 27 mpg US (Average), a maximum top speed of - mph'),
(5, 6, 'fuel consumption of 5.7 litres/100km - 50 mpg UK - 41 mpg US (Average), 0 to 100 km/h (62mph) in 11.');



-- inserting custom data for table `rentals`


INSERT INTO `rentals` (`rental_id`, `customer_id`, `rental_start_date`, `rental_return_date`, `vehicle_id`, `agency_id`) VALUES
(1, 12, '2020-06-01', '2020-06-09', 1, 3),
(2, 10, '2020-06-09', '2020-06-16', 2, 4),
(3, 9, '2020-06-10', '2020-06-20', 3, 5),
(4, 11, '2020-06-23', '2020-06-30', 4, 7),
(5, 13, '2020-07-16', '2020-07-18', 5, 8);



