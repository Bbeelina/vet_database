CREATE TABLE `Patient`(
    `Name` VARCHAR(255) NOT NULL,
    `Type_of_animal` TEXT NOT NULL,
    `Age` INT NOT NULL,
    `Gender` CHAR(255) NOT NULL,
    `Breed` TEXT NOT NULL,
    `id_owner` INT NOT NULL,
    `id_pet` INT NOT NULL,
    PRIMARY KEY(`id_pet`)
);
CREATE TABLE `Owner`(
    `Name` VARCHAR(255) NOT NULL,
    `Surname` VARCHAR(255) NOT NULL,
    `Address` TEXT NOT NULL,
    `Phone_number` VARCHAR(255) NOT NULL,
    `id_owner` INT NOT NULL,
    PRIMARY KEY(`id_owner`)
);
CREATE TABLE `Medical staff`(
    `id_staff` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Position` TEXT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Surname` VARCHAR(255) NOT NULL,
    `Specialization` TEXT NOT NULL
);
CREATE TABLE `Treatment`(
    `id_treatment` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name_of_procedure` TEXT NOT NULL,
    `Cost` INT NOT NULL
);
CREATE TABLE `Medicine`(
    `id_medicine` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name_of_the_medicine` TEXT NOT NULL,
    `Cost` INT NOT NULL,
    `Dose` TEXT NOT NULL
);
CREATE TABLE `Visit_treatment`(
    `id_visit` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_treatment` INT NOT NULL
);
CREATE TABLE `Visit_medicine`(
    `id_medicine` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_visit` INT NOT NULL
);
CREATE TABLE `Doctor_visit`(
    `id_visit` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pet` INT NOT NULL,
    `id_staff` INT NOT NULL,
    `Date` DATE NOT NULL,
    `Time` TIME NOT NULL
);
ALTER TABLE
    `Doctor_visit` ADD INDEX `doctor_visit_date_index`(`Date`);
ALTER TABLE
    `Doctor_visit` ADD INDEX `doctor_visit_time_index`(`Time`);
ALTER TABLE
    `Visit_medicine` ADD CONSTRAINT `visit_medicine_id_visit_foreign` FOREIGN KEY(`id_visit`) REFERENCES `Doctor_visit`(`id_visit`);
ALTER TABLE
    `Visit_treatment` ADD CONSTRAINT `visit_treatment_id_visit_foreign` FOREIGN KEY(`id_visit`) REFERENCES `Doctor_visit`(`id_visit`);
ALTER TABLE
    `Patient` ADD CONSTRAINT `patient_id_owner_foreign` FOREIGN KEY(`id_owner`) REFERENCES `Owner`(`id_owner`);
ALTER TABLE
    `Doctor_visit` ADD CONSTRAINT `doctor_visit_id_staff_foreign` FOREIGN KEY(`id_staff`) REFERENCES `Medical staff`(`id_staff`);
ALTER TABLE
    `Visit_treatment` ADD CONSTRAINT `visit_treatment_id_treatment_foreign` FOREIGN KEY(`id_treatment`) REFERENCES `Treatment`(`id_treatment`);
ALTER TABLE
    `Medicine` ADD CONSTRAINT `medicine_id_medicine_foreign` FOREIGN KEY(`id_medicine`) REFERENCES `Visit_medicine`(`id_medicine`);
ALTER TABLE
    `Doctor_visit` ADD CONSTRAINT `doctor_visit_id_pet_foreign` FOREIGN KEY(`id_pet`) REFERENCES `Patient`(`id_pet`);