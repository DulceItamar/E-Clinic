CREATE TABLE medical_consults(
    serial_id SERIAL,
    id UUID PRIMARY KEY,
    doctor_id UUID NOT NULL,
    patient_id UUID NOT NULL,
    consult_date TIMESTAMP NOT NULL,
    type_of_consult VARCHAR(120) NOT NULL,
    symptoms TEXT,
    diagnosis TEXT,
    treatment TEXT,
    payment_id UUID NOT NULL,
    reason_cancellation TEXT,

    CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id),
    CONSTRAINT fk_payment_id FOREIGN KEY (payment_id) REFERENCES payments(id)

);