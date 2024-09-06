CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address TEXT
);
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    contact_number VARCHAR(15)
);
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    contact_number VARCHAR(15)
);
INSERT INTO patients (
        first_name,
        last_name,
        date_of_birth,
        contact_number,
        address
    )
VALUES (
        'John',
        'Doe',
        '1990-05-14',
        '9876543210',
        '123 Main St, City'
    );
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason)
VALUES (1, 2, '2024-09-10 14:30:00', 'Routine Checkup');
SELECT a.appointment_id,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    a.appointment_date,
    a.reason
FROM appointments a
    JOIN patients p ON a.patient_id = p.patient_id
WHERE a.doctor_id = 2;
UPDATE patients
SET contact_number = '9876543211',
    address = '456 Elm St, City'
WHERE patient_id = 1;
DELETE FROM staff
WHERE staff_id = 3;