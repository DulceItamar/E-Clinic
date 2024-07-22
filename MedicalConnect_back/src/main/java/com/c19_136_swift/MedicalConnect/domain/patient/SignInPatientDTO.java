package com.c19_136_swift.MedicalConnect.domain.patient;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

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
        @NotBlank
        Date birthdate,

        String allergies,
        @NotNull
        Gender gender
) {
}
