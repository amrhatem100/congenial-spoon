# Cell Culture Laboratory Management System

## Project Overview
This project implements a relational database for managing a cell culture laboratory. It tracks cell lines, culture vessels, media, incubators, researchers, experiments, passages, observations, contamination tests, and cryopreserved stocks. 

## DBMS Used
* **MySQL 8.0+ / MariaDB**

## Execution Instructions
1. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or CLI).
2. Execute the scripts in the `/sql/` directory in the following order:
   - `create_tables.sql` (Builds the schema and constraints)
   - `load_data.sql` (Populates the tables with synthetic test data)
   - `views.sql` (Creates analytical views)
   - `triggers_procedures.sql` (Creates stored procedures)
   - `queries.sql` (Contains test queries to verify functionality)
 Cell Culture Laboratory Management System_amr
ObjectiveThe Cell Culture Laboratory Management System is a robust, fully normalized (3NF) relational database designed to streamline and secure the complex workflows of a modern biotechnology laboratory. Built using MySQL, the system acts as a centralized hub to track the complete lifecycle of in vitro cell cultures—from initial cryopreservation thawing to daily maintenance, experimental application, and eventual biological waste disposal or re-freezing.Core CapabilitiesThe database is engineered to replace fragmented spreadsheet tracking with a secure, interconnected architecture that ensures data integrity and regulatory compliance. Key features include:Biological Asset Tracking: Maintains detailed records of mammalian, insect, and stem cell lines, standardizing nomenclature using ATCC numbers and enforcing Biosafety Level (BSL) classifications.Workflow & Passage Management: Connects researchers to specific experiments by tracking real-time cell passages, seeding densities, utilized media formulations, and specific culture vessels.Environmental & Equipment Monitoring: Logs the exact physical location of active cultures, mapping them to specific incubators with defined temperature, $CO_2$, and humidity parameters to ensure reproducibility.Quality Control & Contamination Logging: Implements mandatory logging for routine screening (e.g., Mycoplasma PCR, Endotoxin LAL, and bacterial cultures) to rapidly trace and isolate contamination events.Biobank & Cryo-Inventory Control: Manages frozen vial inventories across liquid nitrogen tanks. It utilizes custom stored procedures to enforce strict checkout logic, preventing negative vial counts and ensuring accurate stock levels.Technical ArchitectureThe system is built on a highly relational schema utilizing strict FOREIGN KEY constraints with cascading deletes to maintain referential integrity. Advanced SQL elements, including data validation triggers (CHECK constraints for volumes, percentages, and passage numbers) and analytical VIEWS, are implemented to provide laboratory managers with instantaneous insights into active experiments and biobank capacities.ImpactBy centralizing data input and enforcing structured relationships, this system minimizes human error, prevents the loss of critical experimental provenance, and provides an essential foundation for scalable, high-throughput biomedical research and laboratory management.
