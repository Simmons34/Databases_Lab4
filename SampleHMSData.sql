--Part A
use HospitalManagementSystem
-- Insert Specializations
INSERT INTO Specializations (specialization_abbreviation) VALUES 
('CARD'), ('ORTHO'), ('NEURO'), ('DERM'), ('GEN');

-- Insert Doctors (5 total)
INSERT INTO Doctors (doctor_name, specialization_id) VALUES 
('Dr. John Smith', 1),
('Dr. Alice Brown', 2),
('Dr. Robert Wilson', 3),
('Dr. Emily Davis', 4),
('Dr. Mark Taylor', 5);

-- Insert Patients (10 total)
INSERT INTO Patients (patient_name, patient_dateOfBirth) VALUES 
('Michael Johnson', '1985-06-15'),
('Sarah Thompson', '1992-09-23'),
('David White', '1978-12-05'),
('Laura Martinez', '2000-03-18'),
('James Anderson', '1967-08-22'),
('Emma Rodriguez', '1995-11-30'),
('William Scott', '1980-04-10'),
('Sophia Lewis', '1989-07-25'),
('Benjamin Harris', '2003-05-14'),
('Olivia Carter', '1975-10-02');

-- Insert Appointments (20 total)
INSERT INTO Appointments (patient_id, doctor_id, appointment_dateTime, purpose) VALUES 
(100000, 100001, '2025-04-01 10:00:00', 'Routine Checkup'),
(100002, 100003, '2025-04-02 11:30:00', 'Knee Pain'),
(100004, 100005, '2025-04-03 14:00:00', 'Migraine Issues'),
(100006, 100007, '2025-04-04 09:00:00', 'Skin Rash Consultation'),
(100008, 100009, '2025-04-05 15:30:00', 'General Weakness'),
(100000, 100005, '2025-04-06 10:45:00', 'Chest Pain'),
(100002, 100007, '2025-04-07 12:00:00', 'Joint Pain'),
(100004, 100001, '2025-04-08 16:15:00', 'Hypertension Follow-up'),
(100006, 100003, '2025-04-09 09:30:00', 'Neck Pain'),
(100008, 100005, '2025-04-10 14:45:00', 'Recurring Headaches'),
(100000, 100007, '2025-04-11 11:00:00', 'Muscle Cramps'),
(100002, 100009, '2025-04-12 10:30:00', 'Fatigue Evaluation'),
(100004, 100001, '2025-04-13 13:15:00', 'Arrhythmia Check'),
(100006, 100003, '2025-04-14 08:45:00', 'Sciatica Symptoms'),
(100008, 100007, '2025-04-15 17:00:00', 'Acne Treatment'),
(100000, 100009, '2025-04-16 15:00:00', 'General Checkup'),
(100002, 100005, '2025-04-17 10:00:00', 'Migraine Consultation'),
(100004, 100003, '2025-04-18 11:15:00', 'Back Pain Assessment'),
(100006, 100001, '2025-04-19 14:00:00', 'Cardiac Health Review'),
(100008, 100007, '2025-04-20 09:00:00', 'Eczema Treatment');

-- Insert Diagnosis and Treatment (20 total)
INSERT INTO DiagnosisAndTreatment (appointment_id, diagnosis, treatment) VALUES 
(10000, 'High Blood Pressure', 'Prescribed medication and lifestyle changes'),
(10002, 'Ligament Tear', 'Recommended physiotherapy and rest'),
(10004, 'Chronic Migraine', 'Prescribed pain management and lifestyle adjustments'),
(10006, 'Allergic Dermatitis', 'Recommended topical steroids and antihistamines'),
(10008, 'Anemia', 'Iron supplements and dietary adjustments'),
(10010, 'Cardiac Arrhythmia', 'Medication and further tests'),
(10012, 'Arthritis', 'Pain management therapy and exercise plan'),
(10014, 'Hypertension', 'Regular monitoring and medication'),
(10016, 'Cervical Strain', 'Neck support and physiotherapy'),
(10018, 'Cluster Headaches', 'Pain relievers and lifestyle advice'),
(10020, 'Muscle Spasms', 'Magnesium supplements and hydration'),
(10022, 'Chronic Fatigue Syndrome', 'Nutritional support and therapy'),
(10024, 'Mild Arrhythmia', 'Electrolyte balance and lifestyle change'),
(10026, 'Sciatica', 'Physical therapy and pain relief medication'),
(10028, 'Acne Vulgaris', 'Dermatological treatment and creams'),
(10030, 'General Checkup - No Issues', 'Healthy lifestyle advice'),
(10032, 'Severe Migraine', 'Prescription-based pain management'),
(10034, 'Lumbar Strain', 'Back support and rehabilitation exercises'),
(10036, 'Coronary Risk Assessment', 'Dietary changes and cholesterol control'),
(10038, 'Chronic Eczema', 'Long-term dermatological treatment');

-- Insert Medical History (20 total)
INSERT INTO MedicalHistory (diagnosis_id) VALUES 
(10001), (10003), (10005), (10007), (10009),
(10011), (10013), (10015), (10017), (10019),
(10021), (10023), (10025), (10027), (10029),
(10031), (10033), (10035), (10037), (10039);

-- Update Patients with Medical History
UPDATE Patients SET patient_medicalHistory_id = 50000 WHERE patient_id = 100000;
UPDATE Patients SET patient_medicalHistory_id = 50001 WHERE patient_id = 100002;
UPDATE Patients SET patient_medicalHistory_id = 50002 WHERE patient_id = 100004;
UPDATE Patients SET patient_medicalHistory_id = 50003 WHERE patient_id = 100006;
UPDATE Patients SET patient_medicalHistory_id = 50004 WHERE patient_id = 100008;
UPDATE Patients SET patient_medicalHistory_id = 50005 WHERE patient_id = 100010;
UPDATE Patients SET patient_medicalHistory_id = 50006 WHERE patient_id = 100012;
UPDATE Patients SET patient_medicalHistory_id = 50007 WHERE patient_id = 100014;
UPDATE Patients SET patient_medicalHistory_id = 50008 WHERE patient_id = 100016;
UPDATE Patients SET patient_medicalHistory_id = 50009 WHERE patient_id = 100018;
go

--the text tyoe I used when creating the database is a depreciated data type so I'm altering the tables so that the text is varchar
alter table Appointments
alter column purpose varchar(8000);

alter table DiagnosisAndTreatment
alter column diagnosis varchar(8000);

alter table DiagnosisAndTreatment
alter column treatment varchar(8000);
go

--Part B

--SELECT: statement to retrieve ALL columns for every patient
--Query 1
print 'Query 1';
select * from Patients;

--DISTINCT: list distinct doctor specializations
--Query 2
print 'Query 2';
select * from Specializations;

--WHERE: find patient names and DOB born before '1990-01-01'
--Query 3
print 'Query 3';
select patient_name, patient_dateOfBirth
from Patients
where patient_dateOfBirth < '1990-01-01';

--WHERE + FILTER: list date, time, and purpose of all appt for patient with (patient_id = 3)
--Query 4
print 'Query 4';
select appointment_dateTime, purpose
from Appointments
where patient_id=100004;

--INNER JOIN: display appt date, patient name, doctor name, and purpose for appointments
--Query 5
print 'Query 5';
select a.appointment_dateTime, p.patient_name, d.doctor_name, a.purpose
from Appointments a
inner join Patients p on a.patient_id = p.patient_id
inner join Doctors d on a.doctor_id = d.doctor_id;

--GROUP BY + COUNT(): count the number of appts per doctor; sort in in descending order of count
--Query 6
print 'Query 6';
select d.doctor_name, COUNT(a.appointment_id) as appointment_count
from Appointments a
join Doctors d on a.doctor_id = d.doctor_id
group by d.doctor_name
order by appointment_count DESC;

--HAVING: find doctors with more than 3 appts
--Query 7
print 'Query 7';
select d.doctor_name, COUNT(a.appointment_id) as appointment_count
from Appointments a
join Doctors d on a.doctor_id = d.doctor_id
group by d.doctor_name
having COUNT(a.appointment_id) > 3;

--LEFT JOIN + NULL FILTER: list patients who have never had an appt.
--Query 8
print 'Query 8';
select p.patient_id, p.patient_name
from Patients p
left join Appointments a on p.patient_id = a.patient_id
where a.appointment_id is NULL;

--DATE FILTER: list appointments that occured in the last 30 days (relative to today)
--Query 9
print 'Query 9';
select appointment_id, patient_id, doctor_id, appointment_dateTime, purpose
from Appointments
where appointment_dateTime >= DATEADD(DAY, -30, GETDATE());

--JOIN + WHERE: show diagnosis and treatment from medical records for the patient named 'John Doe'
--Query 10
print 'Query 10';
select p.patient_name, dt.diagnosis, dt.treatment
from Patients p
join Appointments a on p.patient_id = a.patient_id
join DiagnosisAndTreatment dt on a.appointment_id = dt.appointment_id
where p.patient_name = 'John Doe';

--Nested Subquery: find names of patients diagnosed with 'Diabetes'
--Query 11
print 'Query 11';
select distinct p.patient_name
from Patients p
where p.patient_id IN (
	select a.patient_id
	from Appointments a
    join DiagnosisAndTreatment dt on a.appointment_id = dt.appointment_id
    where dt.diagnosis = 'Diabetes');

--UNION: list (patient_id)s who either had an appt. in January 2025 OR have a diagnosis of 'Hypertension'
--Query 12
print 'Query 12';
select distinct a.patient_id
from Appointments a
where FORMAT(a.appointment_dateTime, 'yyyy-MM') = '2025-01'
union
select distinct a.patient_id
from Appointments a
join DiagnosisAndTreatment dt on a.appointment_id = dt.appointment_id
where dt.diagnosis = 'Hypertension';


--INTERSECT: find (patient_id)s present in both sets from the UNION query
--Query 13
print 'Query 13';
select distinct a.patient_id
from Appointments a
where FORMAT(a.appointment_dateTime, 'yyyy-MM') = '2025-01'
intersect
select distinct a.patient_id
from Appointments a
join DiagnosisAndTreatment dt on a.appointment_id = dt.appointment_id
where dt.diagnosis = 'Hypertension';

--EXCEPT (MINUS): list (patient_id)s who had an appointment but DO NOT have any medical records
--Query 14
print 'Query 14';
select distinct a.patient_id
from Appointments a
except
select distinct a.patient_id
from Appointments a
join DiagnosisAndTreatment dt on a.appointment_id = dt.appointment_id;

--ORDER BY + LIMIT: show the top 5 patients with the highest number of appt (include patient name and appt count)
--Query 15
print 'Query 15';
select top 5 p.patient_name, COUNT(a.appointment_id) as appointment_count
from Patients p
join Appointments a on p.patient_id = a.patient_id
group by p.patient_name
order by appointment_count DESC;