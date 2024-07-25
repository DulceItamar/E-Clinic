package com.c19_136_swift.MedicalConnect.domain.patient;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;
import java.util.Date;

public record SignInPatientDTO(
        @NotBlank
        String name,
        @NotBlank
        @Email
        String email,
        @NotBlank
        String password,
        @NotBlank
        String phone,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy" )
        @NotBlank
        LocalDate birthdate,

        String allergies,
        @NotNull
        Gender gender
) {
}
