USE `cell_culture_db2`;

INSERT INTO `Researchers` (`researcher_id`, `name`, `email`, `role`, `department`) VALUES
(101, 'Dr. Elena Rostova', 'elena.rostova@lab.org', 'Principal Investigator', 'Cancer Biology'),
(102, 'Marcus Vance', 'marcus.vance@lab.org', 'Lab Manager', 'Cellular Engineering'),
(103, 'Sarah Chen', 'sarah.chen@lab.org', 'Postdoctoral Fellow', 'Stem Cell Research'),
(104, 'Dr. Ahmed Hassan', 'ahmed.hassan@lab.org', 'Senior Scientist', 'Virology'),
(105, 'Maria Garcia', 'maria.garcia@lab.org', 'Research Associate', 'Immunology'),
(106, 'David Kim', 'david.kim@lab.org', 'Lab Technician', 'Quality Control'),
(107, 'Dr. Rachel Adams', 'rachel.adams@lab.org', 'Microbiologist', 'Contamination Control'),
(108, 'Youssef Mansour', 'youssef.mansour@lab.org', 'PhD Candidate', 'Tissue Engineering'),
(109, 'Chloe Dubois', 'chloe.dubois@lab.org', 'Quality Control Tech', 'Cell Banking'),
(110, 'James O\'Connor', 'james.oconnor@lab.org', 'Bioinformatics Specialist', 'Genomics');

INSERT INTO `Cell_Lines` (`cell_line_id`, `name`, `organism`, `tissue_origin`, `cell_type`, `atcc_number`, `bsl_level`) VALUES
(1, 'HeLa', 'Homo sapiens (Human)', 'Cervix', 'Epithelial', 'ATCC CCL-2', 2),
(2, 'HEK-293', 'Homo sapiens (Human)', 'Embryonic Kidney', 'Epithelial', 'ATCC CRL-1573', 2),
(3, 'CHO-K1', 'Cricetulus griseus (Hamster)', 'Ovary', 'Epithelial', 'ATCC CCL-61', 1),
(4, 'MCF-7', 'Homo sapiens (Human)', 'Mammary Gland', 'Epithelial / Breast Cancer', 'ATCC HTB-22', 1),
(5, 'A549', 'Homo sapiens (Human)', 'Lung', 'Epithelial / Carcinoma', 'ATCC CCL-185', 1),
(6, 'Jurkat', 'Homo sapiens (Human)', 'Peripheral Blood', 'T-Lymphoblast', 'ATCC TIB-152', 1),
(7, 'Vero', 'Chlorocebus aethiops (Monkey)', 'Kidney', 'Epithelial', 'ATCC CCL-81', 1),
(8, 'NIH/3T3', 'Mus musculus (Mouse)', 'Embryo', 'Fibroblast', 'ATCC CRL-1658', 1),
(9, 'RAW 264.7', 'Mus musculus (Mouse)', 'Abdomen', 'Macrophage', 'ATCC TIB-71', 2),
(10, 'hiPSC-101', 'Homo sapiens (Human)', 'Dermal Skin Fibroblast', 'Induced Pluripotent Stem Cell', 'CVCL_0099', 1);

INSERT INTO `Media` (`media_id`, `name`, `manufacturer`, `catalog_number`, `serum_percentage`, `storage_temp_c`) VALUES
(1, 'DMEM High Glucose', 'Thermo Fisher Scientific', 'Cat #11965092', 10.00, 4.0),
(2, 'RPMI-1640 Medium', 'Gibco', 'Cat #11875093', 10.00, 4.0),
(3, 'F-12K Medium', 'ATCC', 'Cat #30-2004', 10.00, 4.0),
(4, 'EMEM (Eagle\'s MEM)', 'ATCC', 'Cat #30-2003', 10.00, 4.0),
(5, 'Opti-MEM Reduced Serum', 'Gibco', 'Cat #31985070', 2.00, 4.0),
(6, 'mTeSR1 Stem Cell Medium', 'STEMCELL Technologies', 'Cat #85850', 0.00, -20.0),
(7, 'DMEM/F-12 (1:1 Mixture)', 'Gibco', 'Cat #11320033', 10.00, 4.0),
(8, 'McCoy\'s 5A Medium', 'Sigma-Aldrich', 'Cat #M8403', 10.00, 4.0),
(9, 'IMDM (Iscove\'s Modified)', 'Gibco', 'Cat #12440053', 20.00, 4.0),
(10, 'Grace\'s Insect Medium', 'Thermo Fisher Scientific', 'Cat #11605094', 10.00, 4.0);

INSERT INTO `Incubators` (`incubator_id`, `name`, `location`, `temp_target_c`, `co2_target_percent`, `humidity_percent`) VALUES
(1, 'Incubator A1 (HeraCell)', 'Room 201 - Main Culture Lab', 37.0, 5.0, 95.0),
(2, 'Incubator A2 (HeraCell)', 'Room 201 - Main Culture Lab', 37.0, 5.0, 95.0),
(3, 'Incubator B1 (Eppendorf)', 'Room 202 - Viral Suite', 37.0, 5.0, 95.0),
(4, 'Incubator B2 (Eppendorf)', 'Room 202 - Viral Suite', 37.0, 10.0, 95.0),
(5, 'Incubator C1 (Hypoxic Workstation)', 'Room 203 - Oncology Lab', 37.0, 5.0, 90.0),
(6, 'Incubator C2 (Forma Steri)', 'Room 203 - Oncology Lab', 37.0, 5.0, 95.0),
(7, 'Incubator D1 (Shaker Unit)', 'Room 204 - Suspension Lab', 37.0, 0.0, 80.0),
(8, 'Incubator D2 (Insect Chamber)', 'Room 204 - Suspension Lab', 27.0, 0.0, 70.0),
(9, 'Incubator E1 (Stem Cell Dedicated)', 'Room 205 - Cleanroom', 37.0, 5.0, 95.0),
(10, 'Incubator E2 (Backup Unit)', 'Room 205 - Cleanroom', 37.0, 5.0, 95.0);

INSERT INTO `Culture_Vessels` (`vessel_id`, `vessel_type`, `surface_area_cm2`, `working_volume_ml`, `brand`) VALUES
(1, 'T-25 Tissue Culture Flask', 25.00, 5.00, 'Corning'),
(2, 'T-75 Tissue Culture Flask', 75.00, 15.00, 'Corning'),
(3, 'T-175 Tissue Culture Flask', 175.00, 35.00, 'Falcon'),
(4, '6-Well Clear Flat Bottom Plate', 9.50, 2.00, 'Greiner Bio-One'),
(5, '12-Well Clear Flat Bottom Plate', 3.80, 1.00, 'Greiner Bio-One'),
(6, '24-Well Clear Flat Bottom Plate', 1.90, 0.50, 'Greiner Bio-One'),
(7, '96-Well Microplate', 0.32, 0.20, 'Corning'),
(8, '100mm Cell Culture Petri Dish', 55.00, 10.00, 'Falcon'),
(9, '150mm Cell Culture Petri Dish', 148.00, 25.00, 'Falcon'),
(10, 'HYPERFlask High Yield', 1720.00, 560.00, 'Corning');

INSERT INTO `Experiments` (`experiment_id`, `researcher_id`, `title`, `start_date`, `status`) VALUES
(1001, 101, 'CRISPR Knockout Screening in Cervical Cancer', '2025-09-01', 'Active'),
(1002, 102, 'Recombinant Protein Production in CHO-K1', '2025-10-15', 'Active'),
(1003, 103, 'iPSC Differentiation into Cardiomyocytes', '2025-11-01', 'Active'),
(1004, 104, 'Viral Vector Replication Dynamics in HEK-293', '2025-12-05', 'Active'),
(1005, 105, 'Macrophage Activation Assay under Hypoxia', '2026-01-10', 'Active'),
(1006, 106, 'Routine Mycoplasma Clearance & QC Assessment', '2026-01-20', 'Completed'),
(1007, 108, '3D Bioprinting Scaffold Attachment Assay', '2026-02-01', 'Active'),
(1008, 101, 'Cytotoxicity Testing of Novel Kinase Inhibitor', '2026-02-15', 'Active'),
(1009, 104, 'Vero Cell Plaque Assay for Vaccine Candidates', '2026-03-01', 'Active'),
(1010, 103, 'Reprogramming Efficiency Optimization', '2026-03-10', 'Active');

INSERT INTO `Passages` (`passage_id`, `cell_line_id`, `experiment_id`, `vessel_id`, `media_id`, `incubator_id`, `researcher_id`, `passage_number`, `seeding_density_cells_cm2`, `passage_date`) VALUES
(5001, 1, 1001, 2, 1, 1, 101, 12, 15000, '2026-01-10'),
(5002, 2, 1004, 3, 1, 3, 104, 8, 20000, '2026-01-12'),
(5003, 3, 1002, 10, 3, 7, 102, 25, 10000, '2026-01-15'),
(5004, 4, 1008, 2, 8, 5, 101, 18, 12000, '2026-02-01'),
(5005, 5, 1008, 1, 4, 1, 105, 5, 18000, '2026-02-05'),
(5006, 6, 1005, 2, 2, 2, 105, 14, 25000, '2026-02-10'),
(5007, 7, 1009, 3, 4, 3, 104, 30, 15000, '2026-02-20'),
(5008, 8, 1007, 8, 1, 6, 108, 9, 8000, '2026-03-01'),
(5009, 9, 1005, 2, 9, 1, 105, 11, 22000, '2026-03-05'),
(5010, 10, 1003, 4, 6, 9, 103, 3, 50000, '2026-03-08');

INSERT INTO `Observations` (`observation_id`, `passage_id`, `researcher_id`, `observation_date`, `confluency_percentage`, `morphology_notes`) VALUES
(8001, 5001, 101, '2026-01-11', 45, 'Healthy cobblestone epithelial morphology, clean background.'),
(8002, 5001, 101, '2026-01-13', 85, 'Ready for splitting. High viability, minimal dead floating cells.'),
(8003, 5002, 104, '2026-01-14', 70, 'Normal HEK-293 adherence, slight clumping observed.'),
(8004, 5003, 102, '2026-01-17', 90, 'CHO suspension forming uniform single-cell culture.'),
(8005, 5004, 101, '2026-02-03', 60, 'MCF-7 forming characteristic epithelial islands.'),
(8006, 5006, 105, '2026-02-12', 75, 'Jurkat T-cells in suspension, good round cell boundary.'),
(8007, 5007, 104, '2026-02-22', 80, 'Vero monolayer confluent and fully attached.'),
(8008, 5008, 108, '2026-03-03', 50, 'Fibroblastic elongation observed, normal spreading.'),
(8009, 5009, 105, '2026-03-06', 65, 'RAW 264.7 displaying pseudopodia formation.'),
(8010, 5010, 103, '2026-03-10', 40, 'iPSC colonies tight with distinct defined borders.');

INSERT INTO `Contamination_Tests` (`test_id`, `passage_id`, `tested_by_researcher_id`, `test_type`, `test_date`, `result`) VALUES
(9001, 5001, 107, 'Mycoplasma PCR', '2026-01-11', 'Negative'),
(9002, 5002, 107, 'Bacterial Culture', '2026-01-13', 'Negative'),
(9003, 5003, 107, 'Endotoxin LAL', '2026-01-16', 'Negative'),
(9004, 5004, 107, 'Mycoplasma PCR', '2026-02-02', 'Negative'),
(9005, 5005, 107, 'Fungal Culture', '2026-02-06', 'Negative'),
(9006, 5006, 107, 'Mycoplasma PCR', '2026-02-11', 'Negative'),
(9007, 5007, 107, 'Bacterial Culture', '2026-02-21', 'Negative'),
(9008, 5008, 107, 'Mycoplasma PCR', '2026-03-02', 'Negative'),
(9009, 5009, 107, 'Endotoxin LAL', '2026-03-06', 'Negative'),
(9010, 5010, 107, 'Mycoplasma PCR', '2026-03-09', 'Negative');

INSERT INTO `Cryopreserved_Stocks` (`stock_id`, `passage_id`, `vial_label`, `freezer_location`, `passage_number_at_freeze`, `vial_count`, `freeze_date`) VALUES
(7001, 5001, 'HeLa-P12-LN2-01', 'LN2 Tank 01 / Rack A / Box 01', 12, 10, '2026-01-14'),
(7002, 5002, 'HEK293-P08-LN2-02', 'LN2 Tank 01 / Rack A / Box 02', 8, 15, '2026-01-15'),
(7003, 5003, 'CHO-P25-LN2-03', 'LN2 Tank 02 / Rack B / Box 01', 25, 25, '2026-01-18'),
(7004, 5004, 'MCF7-P18-LN2-04', 'LN2 Tank 01 / Rack B / Box 03', 18, 12, '2026-02-04'),
(7005, 5005, 'A549-P05-LN2-05', 'LN2 Tank 01 / Rack C / Box 01', 5, 8, '2026-02-07'),
(7006, 5006, 'JURKAT-P14-LN2-06', 'LN2 Tank 02 / Rack A / Box 01', 14, 20, '2026-02-13'),
(7007, 5007, 'VERO-P30-LN2-07', 'LN2 Tank 02 / Rack C / Box 02', 30, 30, '2026-02-23'),
(7008, 5008, '3T3-P09-LN2-08', 'LN2 Tank 01 / Rack C / Box 02', 9, 10, '2026-03-04'),
(7009, 5009, 'RAW-P11-LN2-09', 'LN2 Tank 01 / Rack A / Box 03', 11, 14, '2026-03-07'),
(7010, 5010, 'iPSC-P03-LN2-10', 'LN2 Tank 03 / Cleanroom Rack 01', 3, 5, '2026-03-11');
