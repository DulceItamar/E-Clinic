package com.c19_136_swift.MedicalConnect.domain.patient;

import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.SignInPatientDTO;
import com.c19_136_swift.MedicalConnect.domain.user.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity(name = "Patient")
@Table(name = "Patients")
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Patient extends User {
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate birthdate;
    private String allergies;

    @Enumerated(EnumType.STRING)
    private Gender gender;


    public Patient(SignInPatientDTO patientDTO){
        super(patientDTO.name(), patientDTO.email(), patientDTO.password(), patientDTO.phone());
        this.birthdate = patientDTO.birthdate();
        this.allergies = patientDTO.allergies();
        this.gender = Gender.fromSpanish(patientDTO.gender());
    }

}
