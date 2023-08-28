CREATE TABLE `events`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `discription` VARCHAR(255) NOT NULL,
    `event_start_date` DATE NOT NULL,
    `event_end_date` DATE NOT NULL,
    `event_start_time` TIME NOT NULL,
    `event_end_time` TIME NOT NULL,
    `event_poster` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `events` ADD PRIMARY KEY `events_id_primary`(`id`);
CREATE TABLE `Blood_inventory`(
    `id` INT NOT NULL,
    `blood_group` ENUM('') NOT NULL,
    `bag_size` INT NOT NULL,
    `bag_quantity` INT NOT NULL,
    `last_updated_date` DATE NOT NULL
);
ALTER TABLE
    `Blood_inventory` ADD PRIMARY KEY `blood_inventory_id_primary`(`id`);
CREATE TABLE `patients`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `doctor_name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `patients` ADD PRIMARY KEY `patients_id_primary`(`id`);
CREATE TABLE `Blood_consumptions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `blood_group` ENUM('') NOT NULL,
    `appointment_id` INT NOT NULL,
    `bag_size` INT NOT NULL,
    `bag_quantity` INT NOT NULL,
    `pateint_id` INT NOT NULL,
    `Creation_date` DATE NOT NULL
);
ALTER TABLE
    `Blood_consumptions` ADD PRIMARY KEY `blood_consumptions_id_primary`(`id`);
ALTER TABLE
    `Blood_consumptions` ADD UNIQUE `blood_consumptions_appointment_id_unique`(`appointment_id`);
CREATE TABLE `blood_donations`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `blood_sample_id` VARCHAR(255) NOT NULL,
    `blood_group` ENUM('') NOT NULL,
    `Bag_size` INT NOT NULL,
    `bag_quantity` INT NOT NULL,
    `date_of donation` DATE NOT NULL,
    `Creation_date` DATE NOT NULL
);
ALTER TABLE
    `blood_donations` ADD PRIMARY KEY `blood_donations_id_primary`(`id`);
CREATE TABLE `Appointments`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `appointment_creation_date` DATE NOT NULL,
    `appointment_schedule_date` DATE NOT NULL,
    `center` ENUM('') NOT NULL,
    `blood_group` ENUM('') NOT NULL,
    `bag_size` INT NOT NULL,
    `bag_quantity` INT NOT NULL,
    `status` ENUM('') NOT NULL
);
ALTER TABLE
    `Appointments` ADD PRIMARY KEY `appointments_id_primary`(`id`);
CREATE TABLE `forget_password`(
    `id` INT NULL AUTO_INCREMENT,
    `userid` INT NOT NULL,
    `otp_code` INT NOT NULL,
    `otp_expiry_time` DATETIME NOT NULL
);
ALTER TABLE
    `forget_password` ADD PRIMARY KEY `forget_password_id_primary`(`id`);
ALTER TABLE
    `forget_password` ADD UNIQUE `forget_password_userid_unique`(`userid`);
CREATE TABLE `identity_proof`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `Document_type` ENUM('') NOT NULL,
    `Document_uniq_id` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `verification_status` ENUM('') NOT NULL
);
ALTER TABLE
    `identity_proof` ADD PRIMARY KEY `identity_proof_id_primary`(`id`);
ALTER TABLE
    `identity_proof` ADD UNIQUE `identity_proof_document_uniq_id_unique`(`Document_uniq_id`);
ALTER TABLE
    `identity_proof` ADD UNIQUE `identity_proof_user_id_unique`(`user_id`);
CREATE TABLE `addresses`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `entity_id` ENUM('') NOT NULL,
    `entity_id` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `state` VARCHAR(255) NOT NULL,
    `pincode` INT NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `is_default` TINYINT NOT NULL
);
ALTER TABLE
    `addresses` ADD PRIMARY KEY `addresses_id_primary`(`id`);
CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `contact_number` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `gender` ENUM('') NOT NULL,
    `profile_image` VARCHAR(255) NOT NULL,
    `role` ENUM('') NOT NULL
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_contact_number_unique`(`contact_number`);
ALTER TABLE
    `Blood_consumptions` ADD CONSTRAINT `blood_consumptions_appointment_id_foreign` FOREIGN KEY(`appointment_id`) REFERENCES `Appointments`(`id`);
ALTER TABLE
    `Blood_consumptions` ADD CONSTRAINT `blood_consumptions_pateint_id_foreign` FOREIGN KEY(`pateint_id`) REFERENCES `patients`(`id`);
ALTER TABLE
    `blood_donations` ADD CONSTRAINT `blood_donations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `Appointments` ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `forget_password` ADD CONSTRAINT `forget_password_userid_foreign` FOREIGN KEY(`userid`) REFERENCES `users`(`id`);
ALTER TABLE
    `identity_proof` ADD CONSTRAINT `identity_proof_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);