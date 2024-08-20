CREATE TABLE payment_info_patients(
    serial_id SERIAL ,
    id UUID PRIMARY KEY,

    name_card VARCHAR(120) NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    expired_date VARCHAR(5) NOT NULL,

    patient_id UUID NOT NULL,

    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id)


);