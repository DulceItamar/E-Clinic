package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.user.TypeOfUser;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;
import java.util.UUID;

public record SignInPatientDTO(
        @NotNull
        UUID id,
        @NotBlank
        String name,
        @NotBlank
        @Email
        String email,
        @NotBlank
        String password,
        @NotNull
        String phoneNumber,
        @NotNull
        TypeOfUser typeOfUser,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
        @NotNull
        LocalDate birthdate,

        String allergies,
        @NotNull
        String gender


) {
}
