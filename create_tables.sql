CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(120) NOT NULL,
    Qualification VARCHAR(120) NOT NULL,
    Specialization VARCHAR(120) NOT NULL
);

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(120) NOT NULL,
    DiseaseType VARCHAR(100) NOT NULL,
    CHECK (DiseaseType IN (
        'infectious diseases',
        'deficiency diseases',
        'genetic hereditary diseases',
        'non-genetic hereditary diseases'
    ))
);

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(120) NOT NULL,
    ManufactureDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Dosage VARCHAR(120) NOT NULL,
    CHECK (ExpiryDate > ManufactureDate)
);

CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    DoctorID INT NOT NULL,
    IssueDate DATE NOT NULL,
    PatientName VARCHAR(120) NOT NULL,

    CONSTRAINT FK_Prescription_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID)
);

CREATE TABLE Prescription_Medicine (
    PrescriptionID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (PrescriptionID, MedicineID),
    CONSTRAINT FK_PM_Prescription
    FOREIGN KEY (PrescriptionID)
    REFERENCES Prescription(PrescriptionID),
    CONSTRAINT FK_PM_Medicine
    FOREIGN KEY (MedicineID)
    REFERENCES Medicine(MedicineID)
);

CREATE TABLE Medicine_Disease (
    MedicineID INT NOT NULL,
    DiseaseID INT NOT NULL,
    PRIMARY KEY (MedicineID, DiseaseID),
    CONSTRAINT FK_MD_Medicine
    FOREIGN KEY (MedicineID)
    REFERENCES Medicine(MedicineID),
    CONSTRAINT FK_MD_Disease
    FOREIGN KEY (DiseaseID)
    REFERENCES Disease(DiseaseID)
);

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    PrescriptionID INT NOT NULL UNIQUE,
    Tax DECIMAL(10,2) NOT NULL DEFAULT 0,
    Discount DECIMAL(10,2) NOT NULL DEFAULT 0,
    Total DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Bill_Prescription
    FOREIGN KEY (PrescriptionID)
    REFERENCES Prescription(PrescriptionID)
);

