package com.c19_136_swift.MedicalConnect.domain.doctor.DTOs;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;

public record LoginDoctorDTO(
        @NotNull
        @Email
        String email,

        @NotNull
        String password

) {
}
