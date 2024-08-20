package com.c19_136_swift.MedicalConnect.domain.doctor;

import com.c19_136_swift.MedicalConnect.domain.doctor.models.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface DoctorRepository extends JpaRepository<Doctor, UUID> {

}
