CREATE TABLE reviews(
      serial_id SERIAL,
      id UUID PRIMARY KEY,

      evaluation FLOAT NOT NULL,
      review_description TEXT,

      patient_id UUID NOT NULL,
      doctor_evaluation_id UUID NOT NULL,

      CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id),
      CONSTRAINT fk_doctor_evaluation_id FOREIGN KEY (doctor_evaluation_id) REFERENCES  doctor_evaluation_data(id)
);