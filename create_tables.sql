CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(120) NOT NULL,
    Qualification VARCHAR(120) NOT NULL,
    Specialization VARCHAR(120) NOT NULL
);
GO

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(120) NOT NULL,
    DiseaseType VARCHAR(100) NOT NULL CHECK (DiseaseType IN (
        'infectious diseases',
        'deficiency diseases',
        'genetic hereditary diseases',
        'non-genetic hereditary diseases'
    ))
);
GO

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(120) NOT NULL,
    ManufactureDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Dosage VARCHAR(120) NOT NULL,
    CONSTRAINT CHK_Medicine_Dates CHECK (ExpiryDate > ManufactureDate)
);
GO

CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    IssuingDoctorID INT NOT NULL,
    IssuingDate DATE NOT NULL,
    PatientName VARCHAR(120) NOT NULL,
    CONSTRAINT FK_Prescription_Doctor FOREIGN KEY (IssuingDoctorID)
        REFERENCES Doctor(DoctorID)
);
GO

CREATE TABLE PrescriptionItem (
    PrescriptionID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (PrescriptionID, MedicineID),
    CONSTRAINT FK_PrescriptionItem_Prescription FOREIGN KEY (PrescriptionID)
        REFERENCES Prescription(PrescriptionID),
    CONSTRAINT FK_PrescriptionItem_Medicine FOREIGN KEY (MedicineID)
        REFERENCES Medicine(MedicineID)
);
GO

CREATE TABLE MedicineDisease (
    MedicineID INT NOT NULL,
    DiseaseID INT NOT NULL,
    PRIMARY KEY (MedicineID, DiseaseID),
    CONSTRAINT FK_MedicineDisease_Medicine FOREIGN KEY (MedicineID)
        REFERENCES Medicine(MedicineID),
    CONSTRAINT FK_MedicineDisease_Disease FOREIGN KEY (DiseaseID)
        REFERENCES Disease(DiseaseID)
);
GO

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    PrescriptionID INT NOT NULL UNIQUE,
    Tax DECIMAL(10,2) NOT NULL DEFAULT 0,
    Discount DECIMAL(10,2) NOT NULL DEFAULT 0,
    Total DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Bill_Prescription FOREIGN KEY (PrescriptionID)
        REFERENCES Prescription(PrescriptionID)
);
GO
