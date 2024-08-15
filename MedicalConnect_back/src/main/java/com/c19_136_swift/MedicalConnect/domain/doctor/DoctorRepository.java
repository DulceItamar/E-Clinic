package com.c19_136_swift.MedicalConnect.domain.doctor;

import com.c19_136_swift.MedicalConnect.domain.doctor.models.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DoctorRepository extends JpaRepository<Doctor, Long > {

}
