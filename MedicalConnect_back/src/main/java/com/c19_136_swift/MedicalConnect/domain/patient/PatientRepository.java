package com.c19_136_swift.MedicalConnect.domain.patient;

import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface PatientRepository  extends JpaRepository<Patient, UUID> {

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
    Optional<Patient> findByIdAndActive(UUID id);


    @Query("""
            SELECT p 
            FROM Patient p
            WHERE p.name = :name
            AND p.status = 'ACTIVE'
            """)
    Optional<Patient> findByNameAndActive(String name);



    @Query("""
            SELECT p
            FROM Patient p
            WHERE p.phoneNumber = :phone
            AND p.status = 'ACTIVE'
            """)
    Optional<Patient> findByPhoneNumberAndActive(String phone);


    @Query("""
            SELECT p
            FROM Patient p
            WHERE p.gender = :gender
            AND p.status = 'ACTIVE'
            """)
    Page<Patient> findAllByGenderAndActive(Gender gender, Pageable pageable);


    @Query("""
            SELECT p
            FROM Patient p
            WHERE p.status = 'ACTIVE'
            """)
   Page<Patient> findAllByActive(Pageable pageable);







}
