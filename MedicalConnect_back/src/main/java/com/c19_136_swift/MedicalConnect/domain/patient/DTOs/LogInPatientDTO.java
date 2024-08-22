package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record LogInPatientDTO(
        @NotBlank
        @Email
        String email,

        @NotBlank
        String password
) {
}
