DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    phone_number VARCHAR(20),
    office VARCHAR(3)
);

INSERT INTO doctors
(doctor_name, phone_number, office)
VALUES
('Dr. Acula', 123-456-8910, 'A1'),
('Dr. Feelgood', 555-555-5555, 'C2'),
('Dr. Mario', 875-751-9687, 'M4');

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number VARCHAR(20),
    DOB DATE NOT NULL
);

INSERT INTO patients
(first_name, last_name, phone_number, DOB)
VALUES
('Bob', 'Roberts', 184-875-7777, '10-03-1978'),
('Rob', 'Boberts', 144-145-6677, '07-03-1998'),
('Suzan', 'Frogger', 564-845-6185, '05-12-1988'),
('Craig', 'Manguy', 514-555-5585, '05-15-1958'),
('Sarah', 'Smith', 765-668-7854, '06-22-1962');

CREATE TABLE doctor_patient
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors (id),
    patient_id INT REFERENCES patients (id)
);

INSERT INTO doctor_patient
(doctor_id, patient_id)
VALUES
(1,2),
(1,1),
(3,2),
(2,4),
(3,3),
(2,5),
(1,3);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    diagnosis TEXT NOT NULL
);

INSERT INTO diagnosis
(diagnosis)
VALUES
('Cold'),
('Flu'),
('Broken Arm'),
('Tummy Ache'),
('Worms?');

CREATE TABLE patient_diagnosis
(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients (id),
    diagnosis_id INT REFERENCES diagnosis (id)
);

INSERT INTO patient_diagnosis
(patient_id, diagnosis_id)
VALUES
(1,1),
(1,2),
(2,5),
(3,5),
(4,5),
(5,5),
(3,2),
(4,4);