package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;


import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

import java.time.LocalDate;
public record PatientDataDetailsDTO(

        Long id,
        String name,
        String email,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy" )
        LocalDate birthdate,

        Gender gender

) {

        public PatientDataDetailsDTO(Patient patient) {
                this(patient.getId(),patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender());
        }
}
