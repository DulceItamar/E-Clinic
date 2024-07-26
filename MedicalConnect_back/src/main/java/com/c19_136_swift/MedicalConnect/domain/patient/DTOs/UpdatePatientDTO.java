package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record UpdatePatientDTO(
        @NotNull
        Long id,

        String name,

        String password,

        String phone,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
        LocalDate birthdate,

        String allergies,

        Gender gender

) {
}
