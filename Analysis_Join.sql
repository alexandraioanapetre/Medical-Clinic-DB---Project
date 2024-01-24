use MedicalClinicDB
go

--Exercise 1--
--Inner Join: Get details of appointments along with patient and doctor information.--

Select A.AppointmentID, 
       A.MeetingDate, 
	   A.MeetingTime,
       P.PatientID, 
	   P.FirstName, 
	   P.LastName, 
	   P.ContactNumber,
       D.DoctorID 
From Appointments A
Inner join Patients P on A.PatientID = P.PatientID
Inner join Doctors D on A.DoctorID = D.DoctorID;

--Exercise 2--
--Left Join: Retrieve all patients, including those without appointments.--

Select P.PatientID, 
       P.FirstName, 
	   P.LastName, 
	   P.ContactNumber,
       A.AppointmentID, 
	   A.MeetingDate, 
	   A.MeetingTime
From Patients P
Left Join Appointments A on P.PatientID = A.PatientID;

--Exercise 3--
--Right Join: Retrieve information from the TaxInvoices table along with patient and appointment details.--

Select TI.InvoiceID, 
       TI.AmountPaid, 
	   TI.MethodOfPayment, 
	   TI.InvoiceDate,
       P.PatientID, 
	   P.FirstName, 
	   P.LastName,
       A.AppointmentID, 
	   A.MeetingDate, 
	   A.MeetingTime
From TaxInvoices TI
Right Join Patients P on TI.PatientID = P.PatientID
Right Join Appointments A on TI.AppointmentID = A.AppointmentID;

--Exercise 4--
--Full Outer Join: Get all medical files along with corresponding appointments and patients.--

Select MF.RegistrationID, 
       MF.Diagnosis, 
	   MF.Treatment,
       A.AppointmentID, 
	   A.MeetingDate, 
	   A.MeetingTime,
       P.PatientID, 
	   P.FirstName, 
	   P.LastName
From MedicalFiles MF
Full Outer Join Appointments A on MF.AppointmentID = A.AppointmentID
Full Outer Join Patients P on MF.PatientID = P.PatientID;

--Exercise 5--
--Cross Join: Combine doctors and patients to see all possible doctor-patient combinations.--

Select D.DoctorID, 
       D.FirstName, 
	   D.LastName, 
	   P.PatientID, 
	   P.FirstName, 
	   P.LastName
From Doctors D
Cross join Patients P;

--Exercise 6--
--Retrieve a list of all doctors along with the patients they have appointments with.--

Select
    D.DoctorID,
    D.FirstName,
    D.LastName,
    A.PatientID,
    P.FirstName,
    P.LastName
From
    Doctors D
Left Join
    Appointments A on D.DoctorID = A.DoctorID
Left Join
    Patients P on A.PatientID = P.PatientID;

--Exercise 7--
--Get a list of patients who have appointments, including details about the appointments such as the date and time. If a patient does not have an appointment, display NULL values.--

Select
    P.PatientID,
    P.FirstName,
    P.LastName,
    A.AppointmentID,
    A.MeetingDate,
    A.MeetingTime
From
    Patients P
Left Join
    Appointments A on P.PatientID = A.PatientID;

--Exercise 8--
--Retrieve a list of tax invoices with details about the associated patient. Include all tax invoices, even if there is no matching patient.--

Select
    TI.InvoiceID,
    TI.AmountPaid,
    TI.MethodOfPayment,
    TI.InvoiceDate,
    P.PatientID,
    P.FirstName,
    P.LastName
From
    TaxInvoices TI
Left Join
    Patients P on TI.PatientID = P.PatientID;

--Exercise 9--
--List all medical files, including the patient's name, who have medical records. Display NULL for patients without medical records.--

Select
    MF.RegistrationID,
    MF.Diagnosis,
    MF.Treatment,
    MF.MedicalPrescription,
    P.PatientID,
    P.FirstName,
    P.LastName 
From
    MedicalFiles MF
Left Join
    Patients P on MF.PatientID = P.PatientID;

-- Exercise 10--
--Retrieve a list of appointments along with the corresponding doctor's name. Include appointments where the doctor is not assigned.--

Select
    A.AppointmentID,
    A.MeetingDate,
    A.MeetingTime,
    A.Notes,
    D.DoctorID,
    D.FirstName,
    D.LastName 
From
    Appointments A
LEFT JOIN
    Doctors D on A.DoctorID = D.DoctorID;

--Exercise 11--
--Display a list of patients and their tax invoices, if any.--

Select
    P.PatientID,
    P.FirstName,
    P.LastName,
    TI.InvoiceID,
    TI.AmountPaid,
    TI.MethodOfPayment,
    TI.InvoiceDate
From
    Patients P
Left Join
    TaxInvoices TI on P.PatientID = TI.PatientID;

