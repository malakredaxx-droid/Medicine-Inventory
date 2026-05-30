CREATE TRIGGER trg_prescription_medicine_bill_insert
ON prescription_medicine
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH changed AS (
        SELECT DISTINCT prescription_id FROM inserted
    ),
    totals AS (
        SELECT pm.prescription_id,
               SUM(m.price * pm.quantity) AS subtotal
        FROM prescription_medicine pm
        JOIN medicine m ON pm.medicine_id = m.medicine_id
        WHERE pm.prescription_id IN (SELECT prescription_id FROM changed)
        GROUP BY pm.prescription_id
    )
    MERGE bill AS target
    USING totals AS source
    ON target.prescription_id = source.prescription_id
    WHEN MATCHED THEN
        UPDATE SET
            tax = ROUND(source.subtotal * 0.10, 2),
            discount = ROUND(source.subtotal * 0.05, 2),
            total = ROUND(source.subtotal + (source.subtotal * 0.10) - (source.subtotal * 0.05), 2)
    WHEN NOT MATCHED THEN
        INSERT (bill_id, prescription_id, tax, discount, total)
        VALUES (1000 + source.prescription_id, source.prescription_id,
                ROUND(source.subtotal * 0.10, 2),
                ROUND(source.subtotal * 0.05, 2),
                ROUND(source.subtotal + (source.subtotal * 0.10) - (source.subtotal * 0.05), 2));
END;
GO

CREATE TRIGGER trg_prescription_medicine_bill_update
ON prescription_medicine
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH changed AS (
        SELECT prescription_id FROM inserted
        UNION
        SELECT prescription_id FROM deleted
    ),
    totals AS (
        SELECT pm.prescription_id,
               SUM(m.price * pm.quantity) AS subtotal
        FROM prescription_medicine pm
        JOIN medicine m ON pm.medicine_id = m.medicine_id
        WHERE pm.prescription_id IN (SELECT prescription_id FROM changed)
        GROUP BY pm.prescription_id
    )
    UPDATE b
    SET tax = ROUND(t.subtotal * 0.10, 2),
        discount = ROUND(t.subtotal * 0.05, 2),
        total = ROUND(t.subtotal + (t.subtotal * 0.10) - (t.subtotal * 0.05), 2)
    FROM bill b
    JOIN totals t ON b.prescription_id = t.prescription_id;
END;
GO
