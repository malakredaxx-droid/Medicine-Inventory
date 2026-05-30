CREATE VIEW vw_prescription_bill_summary AS
SELECT p.prescription_id, p.patient_name, p.issuing_doctor, p.issue_date, b.bill_id, b.tax, b.discount, b.total
FROM prescription p
LEFT JOIN bill b ON p.prescription_id = b.prescription_id;
GO

CREATE VIEW vw_medicine_disease_summary AS
SELECT m.medicine_id, m.name AS medicine_name, d.disease_id, d.name AS disease_name, d.type AS disease_type
FROM medicine m
JOIN medicine_disease md ON m.medicine_id = md.medicine_id
JOIN disease d ON md.disease_id = d.disease_id;
GO
