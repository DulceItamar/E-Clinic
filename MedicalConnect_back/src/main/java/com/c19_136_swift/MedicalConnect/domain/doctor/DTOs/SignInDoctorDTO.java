package com.c19_136_swift.MedicalConnect.domain.doctor;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record SignInDoctorDTO(
        @NotBlank
        String name,

        @NotNull
        @Email
        String email,

        @NotNull
        String password,

        @NotBlank
        String phone,

        @NotNull
        @JsonProperty("Medical Speciality")
        MedicalSpeciality medicalSpeciality,

        @NotNull
        @JsonProperty("Professional License")
        String professionalLicense,

        @NotNull
        @JsonProperty("Job Description")
        String jobDescription
) {
}
