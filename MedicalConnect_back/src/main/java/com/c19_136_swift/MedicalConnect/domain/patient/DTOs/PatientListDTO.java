package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.util.UUID;

public record PatientListDTO(
        UUID id,
        String name,
        String email,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy" )
        LocalDate birthdate,
        Gender gender,
        String allergies


) {

    public PatientListDTO(Patient patient) {
        this(patient.getId(), patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender(), patient.getAllergies());
    }
}
