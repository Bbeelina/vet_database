CREATE TABLE `Patient`(
    `Кличка` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Вид` BIGINT NOT NULL,
    `Возраст` BIGINT NOT NULL,
    `id_pet` BIGINT NOT NULL,
    `Пол` BIGINT NOT NULL,
    `Порода` BIGINT NOT NULL,
    `id_owner` BIGINT NOT NULL,
    PRIMARY KEY(`id_owner`)
);
CREATE TABLE `Owner`(
    `Имя` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Фамилия` BIGINT NOT NULL,
    `Отчество` BIGINT NOT NULL,
    `Адрес` BIGINT NOT NULL,
    `Номер` BIGINT NOT NULL,
    `Айдишник` BIGINT NOT NULL,
    `id_owner` BIGINT NOT NULL,
    PRIMARY KEY(`id_owner`)
);
CREATE TABLE `Medical staff`(
    `id_staff` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Должность` BIGINT NOT NULL,
    `Имя` BIGINT NOT NULL,
    `Фамилия` BIGINT NOT NULL,
    `Отчество` BIGINT NOT NULL,
    `Специализация` BIGINT NOT NULL
);
CREATE TABLE `Treatment`(
    `id_treatment` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Название процедуры` BIGINT NOT NULL,
    `Стоимость` BIGINT NOT NULL
);
CREATE TABLE `Medicine`(
    `id_medicine` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Название лекарства` BIGINT NOT NULL,
    `Стоимость` BIGINT NOT NULL,
    `Дозировка` BIGINT NOT NULL
);
CREATE TABLE `Procedure_treatment`(
    `id_procedure` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pet` BIGINT NOT NULL,
    `id_treatment` BIGINT NOT NULL
);
CREATE TABLE `Procedure_medicine`(
    `id_medicine` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_прием` BIGINT NOT NULL
);
CREATE TABLE `Procedure`(
    `id_procedure` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pet` BIGINT NOT NULL,
    `id_staff` BIGINT NOT NULL,
    `Date` BIGINT NOT NULL,
    `Time` BIGINT NOT NULL
);
ALTER TABLE
    `Procedure_medicine` ADD CONSTRAINT `procedure_medicine_id_прием_foreign` FOREIGN KEY(`id_прием`) REFERENCES `Procedure`(`id_procedure`);
ALTER TABLE
    `Procedure_treatment` ADD CONSTRAINT `procedure_treatment_id_procedure_foreign` FOREIGN KEY(`id_procedure`) REFERENCES `Procedure`(`id_procedure`);
ALTER TABLE
    `Owner` ADD CONSTRAINT `owner_id_owner_foreign` FOREIGN KEY(`id_owner`) REFERENCES `Patient`(`id_owner`);
ALTER TABLE
    `Procedure` ADD CONSTRAINT `procedure_id_staff_foreign` FOREIGN KEY(`id_staff`) REFERENCES `Medical staff`(`id_staff`);
ALTER TABLE
    `Patient` ADD CONSTRAINT `patient_id_pet_foreign` FOREIGN KEY(`id_pet`) REFERENCES `Procedure`(`id_pet`);
ALTER TABLE
    `Procedure_treatment` ADD CONSTRAINT `procedure_treatment_id_treatment_foreign` FOREIGN KEY(`id_treatment`) REFERENCES `Treatment`(`id_treatment`);
ALTER TABLE
    `Medicine` ADD CONSTRAINT `medicine_id_medicine_foreign` FOREIGN KEY(`id_medicine`) REFERENCES `Procedure_medicine`(`id_medicine`);