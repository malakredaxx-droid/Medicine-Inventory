CREATE VIEW vw_prescription_bill_summary AS
SELECT
    p.PrescriptionID,
    p.PatientName,
    p.IssueDate,
    b.BillID,
    b.Tax,
    b.Discount,
    b.Total
FROM Prescription p
LEFT JOIN Bill b
ON p.PrescriptionID = b.PrescriptionID;


CREATE VIEW vw_medicine_disease_summary AS
SELECT
    m.MedicineID,
    m.MedicineName,
    d.DiseaseID,
    d.DiseaseName,
    d.DiseaseType
FROM Medicine m
JOIN Medicine_Disease md
ON m.MedicineID = md.MedicineID
JOIN Disease d
ON md.DiseaseID = d.DiseaseID;