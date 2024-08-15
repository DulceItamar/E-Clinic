CREATE TABLE reviews_to_doctors(
      serial_id SERIAL PRIMARY KEY,
      uuid_id id UUID NOT NULL,

      evaluation FLOAT NOT NULL,
      review_description TEXT,

      patient_id UUID NOT NULL,
      doctor_id UUID NOT NULL,

      CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
      CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);