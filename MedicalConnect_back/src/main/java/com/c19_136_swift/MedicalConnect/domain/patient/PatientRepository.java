package com.c19_136_swift.MedicalConnect.domain.patient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PatientRepository  extends JpaRepository<Patient, Long> {

    @Query("""
            SELECT p
            FROM Patient p
            WHERE p.email = :email
            AND p.status = 'ACTIVE'
            """)
    Optional<Patient> findByEmailAndActive( String email);

    @Query("""
            SELECT p
            FROM Patient p
            WHERE p.id = :id
            AND p.status = 'ACTIVE'
            """)
    Optional<Patient> findByIdAndActive(Long id);


}
