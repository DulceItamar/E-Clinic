package com.c19_136_swift.MedicalConnect.domain.medicalConsult;

import com.c19_136_swift.MedicalConnect.domain.doctor.Doctor;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


/*
@Entity(name = "MedicalConsult")
@Table(name = "medical_consults")
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MedicalConsult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JoinColumn(name = "doctor_id")
    private Doctor doctor;
    @JoinColumn(name = "patient_id")
    private Patient patient;
    private LocalDateTime date;

}
*/