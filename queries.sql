-- 1. List the name of doctors whose specialty is heart disease
SELECT name
FROM doctor
WHERE specialization = 'heart disease';
GO

-- 2. List the deficiency diseases
SELECT name
FROM disease
WHERE type = 'deficiency diseases';
GO

-- 3. List the most medicine sold in 2023
SELECT TOP 1 m.name AS medicine_name, SUM(pm.quantity) AS total_quantity_sold
FROM prescription_medicine pm
JOIN prescription p ON pm.prescription_id = p.prescription_id
JOIN medicine m ON pm.medicine_id = m.medicine_id
WHERE YEAR(p.issue_date) = 2023
GROUP BY m.name
ORDER BY total_quantity_sold DESC;
GO

-- 4. Show all bills with patient names
SELECT b.bill_id, p.patient_name, b.tax, b.discount, b.total
FROM bill b
JOIN prescription p ON b.prescription_id = p.prescription_id;
GO

-- 5. List medicines and their disease names
SELECT m.name AS medicine_name, d.name AS disease_name
FROM medicine_disease md
JOIN medicine m ON md.medicine_id = m.medicine_id
JOIN disease d ON md.disease_id = d.disease_id;
GO

-- 6. Total sales per medicine in 2023
SELECT m.name AS medicine_name, SUM(pm.quantity * m.price) AS total_sales
FROM prescription_medicine pm
JOIN prescription p ON pm.prescription_id = p.prescription_id
JOIN medicine m ON pm.medicine_id = m.medicine_id
WHERE YEAR(p.issue_date) = 2023
GROUP BY m.name
ORDER BY total_sales DESC;
GO
