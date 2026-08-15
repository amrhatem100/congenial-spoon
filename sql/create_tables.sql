-- ============================================================================
-- PROJECT: Cell Culture Laboratory Management System
-- NAME: amrhatem abd elkader   ID: 221001165
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `cell_culture_db2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cell_culture_db2`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `Cryopreserved_Stocks`;
DROP TABLE IF EXISTS `Contamination_Tests`;
DROP TABLE IF EXISTS `Observations`;
DROP TABLE IF EXISTS `Passages`;
DROP TABLE IF EXISTS `Experiments`;
DROP TABLE IF EXISTS `Culture_Vessels`;
DROP TABLE IF EXISTS `Incubators`;
DROP TABLE IF EXISTS `Media`;
DROP TABLE IF EXISTS `Cell_Lines`;
DROP TABLE IF EXISTS `Researchers`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Researchers` (
    `researcher_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `role` VARCHAR(50) DEFAULT 'Research Assistant',
    `department` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Cell_Lines` (
    `cell_line_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `organism` VARCHAR(100) NOT NULL,
    `tissue_origin` VARCHAR(100) NOT NULL,
    `cell_type` VARCHAR(100) NOT NULL,
    `atcc_number` VARCHAR(50) NOT NULL UNIQUE,
    `bsl_level` INT NOT NULL DEFAULT 1 CHECK (`bsl_level` IN (1, 2, 3)),
    PRIMARY KEY (`cell_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Media` (
    `media_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `manufacturer` VARCHAR(100) NOT NULL,
    `catalog_number` VARCHAR(50) NOT NULL,
    `serum_percentage` DECIMAL(4, 2) NOT NULL CHECK (`serum_percentage` >= 0),
    `storage_temp_c` DECIMAL(4, 1) NOT NULL,
    PRIMARY KEY (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Incubators` (
    `incubator_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `location` VARCHAR(100) NOT NULL,
    `temp_target_c` DECIMAL(4, 1) NOT NULL DEFAULT 37.0,
    `co2_target_percent` DECIMAL(4, 1) NOT NULL DEFAULT 5.0,
    `humidity_percent` DECIMAL(4, 1) NOT NULL DEFAULT 95.0,
    PRIMARY KEY (`incubator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Culture_Vessels` (
    `vessel_id` INT NOT NULL AUTO_INCREMENT,
    `vessel_type` VARCHAR(100) NOT NULL,
    `surface_area_cm2` DECIMAL(8, 2) NOT NULL CHECK (`surface_area_cm2` > 0),
    `working_volume_ml` DECIMAL(8, 2) NOT NULL CHECK (`working_volume_ml` > 0),
    `brand` VARCHAR(50) DEFAULT 'Corning',
    PRIMARY KEY (`vessel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Experiments` (
    `experiment_id` INT NOT NULL AUTO_INCREMENT,
    `researcher_id` INT NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `start_date` DATE NOT NULL,
    `status` ENUM('Active', 'Completed', 'Suspended', 'Cancelled') DEFAULT 'Active',
    PRIMARY KEY (`experiment_id`),
    CONSTRAINT `fk_exp_researcher` FOREIGN KEY (`researcher_id`) REFERENCES `Researchers` (`researcher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Passages` (
    `passage_id` INT NOT NULL AUTO_INCREMENT,
    `cell_line_id` INT NOT NULL,
    `experiment_id` INT NOT NULL,
    `vessel_id` INT NOT NULL,
    `media_id` INT NOT NULL,
    `incubator_id` INT NOT NULL,
    `researcher_id` INT NOT NULL,
    `passage_number` INT NOT NULL CHECK (`passage_number` >= 0),
    `seeding_density_cells_cm2` INT NOT NULL CHECK (`seeding_density_cells_cm2` > 0),
    `passage_date` DATE NOT NULL,
    PRIMARY KEY (`passage_id`),
    CONSTRAINT `fk_pas_cell` FOREIGN KEY (`cell_line_id`) REFERENCES `Cell_Lines` (`cell_line_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pas_exp` FOREIGN KEY (`experiment_id`) REFERENCES `Experiments` (`experiment_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pas_vessel` FOREIGN KEY (`vessel_id`) REFERENCES `Culture_Vessels` (`vessel_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pas_media` FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pas_inc` FOREIGN KEY (`incubator_id`) REFERENCES `Incubators` (`incubator_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pas_res` FOREIGN KEY (`researcher_id`) REFERENCES `Researchers` (`researcher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Observations` (
    `observation_id` INT NOT NULL AUTO_INCREMENT,
    `passage_id` INT NOT NULL,
    `researcher_id` INT NOT NULL,
    `observation_date` DATE NOT NULL,
    `confluency_percentage` INT NOT NULL CHECK (`confluency_percentage` BETWEEN 0 AND 100),
    `morphology_notes` TEXT NOT NULL,
    PRIMARY KEY (`observation_id`),
    CONSTRAINT `fk_obs_passage` FOREIGN KEY (`passage_id`) REFERENCES `Passages` (`passage_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_obs_researcher` FOREIGN KEY (`researcher_id`) REFERENCES `Researchers` (`researcher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Contamination_Tests` (
    `test_id` INT NOT NULL AUTO_INCREMENT,
    `passage_id` INT NOT NULL,
    `tested_by_researcher_id` INT NOT NULL,
    `test_type` ENUM('Mycoplasma PCR', 'Bacterial Culture', 'Fungal Culture', 'Endotoxin LAL') NOT NULL,
    `test_date` DATE NOT NULL,
    `result` ENUM('Negative', 'Positive', 'Inconclusive') NOT NULL DEFAULT 'Negative',
    PRIMARY KEY (`test_id`),
    CONSTRAINT `fk_cnt_passage` FOREIGN KEY (`passage_id`) REFERENCES `Passages` (`passage_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_cnt_researcher` FOREIGN KEY (`tested_by_researcher_id`) REFERENCES `Researchers` (`researcher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Cryopreserved_Stocks` (
    `stock_id` INT NOT NULL AUTO_INCREMENT,
    `passage_id` INT NOT NULL,
    `vial_label` VARCHAR(100) NOT NULL UNIQUE,
    `freezer_location` VARCHAR(100) NOT NULL, 
    `passage_number_at_freeze` INT NOT NULL,
    `vial_count` INT NOT NULL CHECK (`vial_count` >= 0),
    `freeze_date` DATE NOT NULL,
    PRIMARY KEY (`stock_id`),
    CONSTRAINT `fk_cryo_passage` FOREIGN KEY (`passage_id`) REFERENCES `Passages` (`passage_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
