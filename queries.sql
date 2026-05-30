-- 1. List doctors specialized in heart disease
SELECT DoctorName
FROM Doctor
WHERE Specialization = 'heart disease';


-- 2. List deficiency diseases
SELECT DiseaseName
FROM Disease
WHERE DiseaseType = 'deficiency diseases';


-- 3. Most sold medicine in 2023
SELECT
    m.MedicineName,
    SUM(pm.Quantity) AS TotalQuantitySold
FROM Prescription_Medicine pm
JOIN Prescription p
ON pm.PrescriptionID = p.PrescriptionID
JOIN Medicine m
ON pm.MedicineID = m.MedicineID
WHERE YEAR(p.IssueDate) = 2023
GROUP BY m.MedicineName
ORDER BY TotalQuantitySold DESC
LIMIT 1;


-- 4. Show all bills with patient names
SELECT
    b.BillID,
    p.PatientName,
    b.Tax,
    b.Discount,
    b.Total
FROM Bill b
JOIN Prescription p
ON b.PrescriptionID = p.PrescriptionID;


-- 5. List medicines and their disease names
SELECT
    m.MedicineName,
    d.DiseaseName
FROM Medicine_Disease md
JOIN Medicine m
ON md.MedicineID = m.MedicineID
JOIN Disease d
ON md.DiseaseID = d.DiseaseID;


-- 6. Total sales per medicine in 2023
SELECT
    m.MedicineName,
    SUM(pm.Quantity * m.Price) AS TotalSales
FROM Prescription_Medicine pm
JOIN Prescription p
ON pm.PrescriptionID = p.PrescriptionID
JOIN Medicine m
ON pm.MedicineID = m.MedicineID
WHERE YEAR(p.IssueDate) = 2023
GROUP BY m.MedicineName
ORDER BY TotalSales DESC;