DELIMITER $$

CREATE TRIGGER trg_prescription_medicine_insert
AFTER INSERT ON Prescription_Medicine
FOR EACH ROW
BEGIN

    DECLARE subtotal DECIMAL(10,2);

    SELECT SUM(m.Price * pm.Quantity)
    INTO subtotal
    FROM Prescription_Medicine pm
    JOIN Medicine m
    ON pm.MedicineID = m.MedicineID
    WHERE pm.PrescriptionID = NEW.PrescriptionID;

    INSERT INTO Bill
    (BillID, PrescriptionID, Tax, Discount, Total)
    VALUES
    (
        1000 + NEW.PrescriptionID,
        NEW.PrescriptionID,
        subtotal * 0.10,
        subtotal * 0.05,
        subtotal + (subtotal * 0.10) - (subtotal * 0.05)
    )

    ON DUPLICATE KEY UPDATE
        Tax = subtotal * 0.10,
        Discount = subtotal * 0.05,
        Total = subtotal + (subtotal * 0.10) - (subtotal * 0.05);

END $$

DELIMITER ;

