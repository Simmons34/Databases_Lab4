create database HospitalManagementSystem;
use HospitalManagementSystem;

--execute previous chunk of code
go
create table Patients(
	patient_id int identity (100000,2) primary key NOT NULL,
	patient_name varchar(256) NOT NULL,
	patient_dateOfBirth date NOT NULL,
);

create table Specializations(
	id int identity (1,1) primary key NOT NULL,
	specialization_abbreviation varchar(16) NOT NULL
);

--execute previous chunk of code
go
create table Doctors(
	doctor_id int identity (100001,2) primary key NOT NULL,
	doctor_name varchar(256) NOT NULL,
	specialization_id int,
	constraint fk_specialization
		foreign key (specialization_id)
		references Specializations(id)
		on delete cascade
		on update cascade
);

create table Appointments(
	appointment_id int identity (10000,2) primary key NOT NULL,
	patient_id int NOT NULL,
	doctor_id int NOT NULL,
	appointment_dateTime SmallDateTime NOT NULL,
	purpose text,
	constraint fk_patient
		foreign key (patient_id)
		references Patients(patient_id)
		on delete cascade,
	constraint fk_doctor
		foreign key (doctor_id)
		references Doctors(doctor_id)
		on delete cascade
);

--execute previous chunk of code
go
create table DiagnosisAndTreatment(
	id int identity (10001,2) primary key NOT NULL,
	appointment_id int not null,
	constraint fk_appointment_id
		foreign key (appointment_id)
		references Appointments(appointment_id)
		on update cascade,
	diagnosis text,
	treatment text
);

--execute previous chunk of code
go
create table MedicalHistory(
	history_id int identity(50000,1) primary key,
	diagnosis_id int references DiagnosisAndTreatment(id)
	on delete cascade
	on update cascade
);

--execute previous chunk of code
go
alter table Patients
add patient_medicalHistory_id int
	constraint fk_medicalHistory
		foreign key (patient_medicalHistory_id)
		references MedicalHistory(history_id)
		on delete cascade
		on update cascade;

--executed code up to this point
