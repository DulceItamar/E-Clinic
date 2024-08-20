package com.c19_136_swift.MedicalConnect.domain.medicalConsult;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MedicalConsultRepository extends JpaRepository<MedicalConsult, UUID> {
}
