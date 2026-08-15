USE `cell_culture_db2`;

-- PROCEDURE: Safely remove/checkout vials from cryopreservation
-- Enforces business logic to prevent negative vial counts.
DELIMITER //

CREATE PROCEDURE `Checkout_Cryo_Vials` (
    IN p_stock_id INT,
    IN p_vials_to_remove INT
)
BEGIN
    DECLARE current_count INT;
    
    -- Check current vial count
    SELECT vial_count INTO current_count 
    FROM Cryopreserved_Stocks 
    WHERE stock_id = p_stock_id;
    
    -- Business Rule: Cannot remove more vials than available
    IF current_count >= p_vials_to_remove THEN
        UPDATE Cryopreserved_Stocks
        SET vial_count = vial_count - p_vials_to_remove
        WHERE stock_id = p_stock_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Insufficient vials in stock.';
    END IF;
END //

DELIMITER ;
