--Find all doctors with Specialization in "Cardiologist".--

Select * 
From Doctors 
Where Specialization = 'Cardiologist';

--Calculate the average age of the patients.--

Select AVG(DATEDIFF(YEAR, DateOfBirth, '2023-11-01')) as AverageAge
From Patients;

--Find all diagnoses for patients born in 1995.--

Select Diagnosis
From MedicalFiles MF
Join Patients P on MF.PatientID = P.PatientID
Where P.DateOfBirth > '1995';

--The most frequent diagnosis.--

Select Diagnosis as DiagnosisName, COUNT(*) as Frequency
From MedicalFiles
Group by Diagnosis
Order by Frequency desc

--The total number of appointments for each doctor.--

Select DoctorID, COUNT(*) as TotalAppointments
From Appointments
Group by DoctorID;

--Calculate the total amount paid from the invoices.--

Select SUM(AmountPaid) as TotalAmountPaid
From TaxInvoices;

--Concatenate the names of the patients.--

Select CONCAT(FirstName, ' ', LastName) as FullName
From Patients;

--Find all patients who have appointments with a specific doctor.--

Select *
From Patients
Join Appointments on Patients.PatientID = Appointments.PatientID
Join Doctors on Appointments.DoctorID = Doctors.DoctorID
Where Doctors.DoctorID = 1;

--Find all doctors who have appointments with a specific patient.

Select *
From Doctors
Join Appointments on Doctors.DoctorID = Appointments.DoctorID
Join Patients on Appointments.PatientID = Patients.PatientID
Where Patients.PatientID = 45;

--Find all appointments for a specific date.

Select *
From Appointments A
Join Doctors D on A.DoctorID = D.DoctorID
Join Patients P on A.PatientID = P.PatientID
Where MeetingDate = '2023-11-15';


--Names of patients and date of appointment for all patients.--

Select FirstName,
       LastName,
	   MeetingDate
From Patients P
Inner Join Appointments A on P.PatientID = A.PatientID;

--Name of the patient and the invoices with the amount paid and the method of payment.--

Select FirstName, 
       LastName, 
	   AmountPaid,
	   MethodOfPayment
From Patients P
Left Join TaxInvoices TI on P.PatientID = TI.PatientID;

--Find all medical records and their associated patients.--

Select FirstName,
       LastName,
	   Diagnosis,
	   Treatment
From MedicalFiles MF
Right Join Patients P on MF.PatientID = P.PatientID;

