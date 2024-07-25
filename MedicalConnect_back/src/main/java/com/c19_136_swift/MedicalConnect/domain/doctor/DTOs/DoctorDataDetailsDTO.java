package com.c19_136_swift.MedicalConnect.domain.doctor.DTOs;

import com.c19_136_swift.MedicalConnect.domain.doctor.MedicalSpeciality;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;

public record DoctorDataDetailsDTO(
        @NotBlank
        String name,

        @JsonProperty("Medical Speciality")
        @NotBlank
        MedicalSpeciality medicalSpeciality,

        @JsonProperty("Professional License")
        @NotBlank
        String  professionalLicense,

        @JsonProperty("Job Description")
        @NotBlank
        String jobDescription

) {
}
