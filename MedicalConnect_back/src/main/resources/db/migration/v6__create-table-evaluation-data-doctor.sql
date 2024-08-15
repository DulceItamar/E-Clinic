CREATE TABLE evaluation_data_doctors(
    serial_id SERIAL PRIMARY KEY,
    uuid_id id UUID NOT NULL,

    average_of_evaluations FLOAT,
    number_of_consults INTEGER,

    doctor_id UUID NOT NULL,

    CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)

);