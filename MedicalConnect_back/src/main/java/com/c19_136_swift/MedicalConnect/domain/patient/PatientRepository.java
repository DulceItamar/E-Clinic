package com.c19_136_swift.MedicalConnect.domain.patient;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository  extends JpaRepository<Patient, Long> {
}
