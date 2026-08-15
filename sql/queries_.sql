USE `cell_culture_db2`;

-- 1. RETRIEVAL & JOIN: Find all BSL-2 Cell Lines currently stored in Cryo Tanks
SELECT DISTINCT 
    c.name, 
    c.atcc_number, 
    c.bsl_level, 
    s.vial_label, 
    s.freezer_location
FROM Cell_Lines c
JOIN Passages p ON c.cell_line_id = p.cell_line_id
JOIN Cryopreserved_Stocks s ON p.passage_id = s.passage_id
WHERE c.bsl_level = 2;

-- 2. AGGREGATION: Count total active passages per researcher
SELECT 
    r.name AS researcher_name, 
    COUNT(p.passage_id) AS total_passages_conducted
FROM Researchers r
LEFT JOIN Passages p ON r.researcher_id = p.researcher_id
GROUP BY r.researcher_id, r.name;

-- 3. SUBQUERY: Find Researchers who are currently working on an 'Active' experiment
SELECT name, department 
FROM Researchers 
WHERE researcher_id IN (
    SELECT researcher_id 
    FROM Experiments 
    WHERE status = 'Active'
);

-- 4. INSERT OPERATION: Log a new contamination test result
INSERT INTO `Contamination_Tests` 
(`passage_id`, `tested_by_researcher_id`, `test_type`, `test_date`, `result`) 
VALUES 
(5001, 107, 'Endotoxin LAL', '2026-08-15', 'Negative');

-- 5. UPDATE OPERATION: Suspend an experiment
UPDATE `Experiments` 
SET `status` = 'Suspended' 
WHERE `experiment_id` = 1007;

-- 6. DELETE OPERATION: Remove a discarded culture vessel (simulated cleanup)
-- Note: Foreign key constraints (ON DELETE CASCADE) will protect referential integrity
DELETE FROM `Observations` 
WHERE `observation_id` = 8010;
