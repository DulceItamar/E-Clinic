package com.c19_136_swift.MedicalConnect.domain.doctor.DTOs;

import com.c19_136_swift.MedicalConnect.domain.doctor.MedicalSpeciality;
import com.c19_136_swift.MedicalConnect.domain.user.TypeOfUser;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.List;
import java.util.UUID;

public record SignInDoctorDTO(
        @NotBlank
        UUID id,

        @NotBlank
        String name,

        @NotNull
        @Email
        String email,

        @NotNull
        String password,

        @NotNull
        String phoneNumber,

        @NotNull
        TypeOfUser typeOfUser,

        @NotNull
        @JsonProperty("Medical Speciality")
        MedicalSpeciality medicalSpeciality,

        @NotNull
        @JsonProperty("Professional License")
        String professionalLicense,

        @NotNull
        @JsonProperty("Job Description")
        String jobDescription,

        @NotNull
        List<String> services,

        @NotNull
                @JsonProperty("Work Days")
        List<String> workDays,

        @NotNull
        @JsonProperty("Service Price")
        Float servicePrice
) {
}


