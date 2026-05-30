INSERT INTO Doctor
(DoctorID, DoctorName, Qualification, Specialization)
VALUES
(1, 'Ahmed Samir', 'MBBS', 'heart disease'),
(2, 'Mona Adel', 'MD', 'nutrition'),
(3, 'Karim Tarek', 'PhD', 'infectious diseases'),
(4, 'Nourhan Ali', 'MD', 'genetics'),
(5, 'Youssef Salah', 'MBBS', 'internal medicine'),
(6, 'Sara Hassan', 'MD', 'heart disease'),
(7, 'Omar Fathy', 'PhD', 'hematology'),
(8, 'Mai Nabil', 'MBBS', 'immunology'),
(9, 'Hana Mostafa', 'MD', 'pediatrics'),
(10, 'Khaled Anwar', 'MD', 'gastroenterology');


INSERT INTO Disease
(DiseaseID, DiseaseName, DiseaseType)
VALUES
(1, 'Anemia', 'deficiency diseases'),
(2, 'Scurvy', 'deficiency diseases'),
(3, 'Influenza', 'infectious diseases'),
(4, 'Tuberculosis', 'infectious diseases'),
(5, 'Hemophilia', 'genetic hereditary diseases'),
(6, 'Color Blindness', 'genetic hereditary diseases'),
(7, 'Hypertension History', 'non-genetic hereditary diseases'),
(8, 'Diabetes Tendency', 'non-genetic hereditary diseases'),
(9, 'Coronary Disease', 'non-genetic hereditary diseases'),
(10, 'Rickets', 'deficiency diseases');


INSERT INTO Medicine
(MedicineID, MedicineName,
ManufactureDate, ExpiryDate,
Price, Dosage)
VALUES
(101, 'Iron Plus', '2023-01-10', '2027-01-10', 50.00, '1 tablet daily'),
(102, 'Vitamin C Max', '2023-03-15', '2026-03-15', 40.00, '1 tablet twice daily'),
(103, 'FluCure', '2022-11-01', '2025-11-01', 70.00, '10 ml syrup twice daily'),
(104, 'TB Shield', '2022-05-20', '2026-05-20', 120.00, '1 capsule daily'),
(105, 'CardioSafe', '2023-02-18', '2027-02-18', 150.00, '1 tablet daily'),
(106, 'GeniCare', '2023-06-10', '2027-06-10', 200.00, '1 tablet every 12 hours'),
(107, 'SugarBalance', '2023-04-14', '2026-04-14', 110.00, '1 tablet before meal'),
(108, 'BoneStrong', '2023-07-01', '2026-07-01', 60.00, '1 tablet daily'),
(109, 'ImmunoBoost', '2023-08-11', '2026-08-11', 95.00, '1 capsule daily'),
(110, 'PressureLess', '2023-09-05', '2026-09-05', 130.00, '1 tablet daily');


INSERT INTO Medicine_Disease
(MedicineID, DiseaseID)
VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 9),
(106, 5),
(106, 6),
(107, 8),
(108, 10),
(110, 7);


INSERT INTO Prescription
(PrescriptionID, DoctorID, IssueDate, PatientName)
VALUES
(201, 1, '2023-01-05', 'Ali Hassan'),
(202, 2, '2023-02-10', 'Mariam Adel'),
(203, 3, '2023-03-15', 'Omar Mostafa'),
(204, 4, '2023-04-20', 'Huda Nabil'),
(205, 5, '2023-05-18', 'Sara Emad'),
(206, 6, '2023-06-25', 'Tamer Samy'),
(207, 7, '2023-07-14', 'Nesma Wael'),
(208, 8, '2023-08-09', 'Hassan Adel'),
(209, 9, '2023-09-03', 'Reem Yasser'),
(210, 10, '2023-10-12', 'Kareem Fathy');


INSERT INTO Prescription_Medicine
(PrescriptionID, MedicineID, Quantity)
VALUES
(201, 105, 2),
(201, 110, 1),
(202, 101, 3),
(203, 103, 5),
(203, 109, 2),
(204, 106, 1),
(205, 110, 2),
(206, 102, 4),
(207, 108, 6),
(208, 109, 3),
(209, 107, 2),
(210, 103, 7);