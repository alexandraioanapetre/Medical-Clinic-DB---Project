Use MedicalClinicDB
Go
Drop table if exists Patients
Go
Create table Patients (
PatientID int primary key not null,
FirstName varchar (50) not null,
LastName varchar (50) not null,
DateOfBirth date not null,
Gender char(1) not null,
ContactNumber varchar (15) not null,
Email varchar (100) not null,
Address varchar (255) not null
);

Drop table if exists Doctors
Go
Create table Doctors (
DoctorID int primary key not null,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Specialization varchar(100) not null,
ContactNumber varchar(15) not null,
Email varchar(100) not null
);

Drop table if exists Appointments
Go
Create table Appointments (
AppointmentID int primary key not null,
PatientID int not null,
DoctorID int not null,
MeetingDate Date not null,
MeetingTime Time not null,
Notes varchar(255) not null,
Foreign key (PatientID) references Patients(PatientID),
Foreign key (DoctorID) references Doctors(DoctorID)
);

Drop table if exists MedicalFiles
Go
Create table MedicalFiles (
RegistrationID int primary key not null,
PatientID int not null,
DoctorID int not null,
AppointmentID int not null,
Diagnosis varchar(255) not null,
Treatment varchar(255) not null,
MedicalPrescription varchar(255) not null,
Foreign key (PatientID) references Patients(PatientID),
Foreign key (DoctorID) references Doctors(DoctorID),
Foreign key (AppointmentID) references Appointments(AppointmentID)
);

Drop table if exists TaxInvoices
Go
Create table TaxInvoices (
InvoiceID int primary key not null,
PatientID int  not null,
AppointmentID int not null,
AmountPaid decimal(10, 2) not null,
MethodOfPayment varchar(50) not null,
InvoiceDate date not null,
Foreign key (PatientID) references Patients(PatientID),
Foreign Key (AppointmentID) references Appointments(AppointmentID)
);


