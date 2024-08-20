CREATE TABLE doctor_evaluation_data (
    serial_id SERIAL,
    id UUID PRIMARY KEY,

    average_of_evaluations FLOAT,
    number_of_consults INTEGER,

    doctor_id UUID NOT NULL,

    CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(id)

);