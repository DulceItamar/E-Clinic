package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientRepository;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;

public record PatientListDTO(
        Long id,
        String name,
        String email,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy" )
        LocalDate birthdate,
        Gender gender


) {

    public PatientListDTO(Patient patient) {
        this(patient.getId(), patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender());
    }
}
