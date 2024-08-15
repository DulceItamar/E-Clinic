CREATE TABLE medical_consults(
    id BIGSERIAL NOT NULL,
    doctor_id BIGINT NOT NULL,
    patient_id BIGINT NOT NULL,
    consult_date DATE NOT NULL,
    type_of_consult VARCHAR(120) NOT NULL,
    symptoms TEXT,
    diagnosis TEXT,
    treatment TEXT,
    payment_id BIGINT NOT NULL,
    reason_cancellation TEXT,
    primary key(id)

);