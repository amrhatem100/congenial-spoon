USE `cell_culture_db2`;

-- VIEW 1: Active Cell Line Culturing Overview
CREATE OR REPLACE VIEW `vw_active_passages` AS
SELECT 
    p.passage_id,
    c.name AS cell_line,
    c.atcc_number,
    e.title AS experiment_title,
    r.name AS researcher,
    i.name AS incubator,
    p.passage_number,
    p.passage_date
FROM Passages p
JOIN Cell_Lines c ON p.cell_line_id = c.cell_line_id
JOIN Experiments e ON p.experiment_id = e.experiment_id
JOIN Researchers r ON p.researcher_id = r.researcher_id
JOIN Incubators i ON p.incubator_id = i.incubator_id;

-- VIEW 2: Cryo-Storage Vial Inventory
CREATE OR REPLACE VIEW `vw_cryo_inventory` AS
SELECT 
    s.stock_id,
    c.name AS cell_line,
    s.vial_label,
    s.freezer_location,
    s.vial_count,
    s.freeze_date
FROM Cryopreserved_Stocks s
JOIN Passages p ON s.passage_id = p.passage_id
JOIN Cell_Lines c ON p.cell_line_id = c.cell_line_id;
