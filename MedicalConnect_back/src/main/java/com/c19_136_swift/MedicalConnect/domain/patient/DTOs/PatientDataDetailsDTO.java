package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;


import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;
import com.c19_136_swift.MedicalConnect.domain.user.TypeOfUser;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;
import java.util.UUID;

public record PatientDataDetailsDTO(

        UUID id,
        String name,
        String email,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy" )
        LocalDate birthdate,

        Gender gender,
        @JsonProperty("Type of user")
        TypeOfUser typeOfUser



) {

        public PatientDataDetailsDTO(Patient patient) {
                this(patient.getId(),patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender(), patient.getTypeOfUser());
        }
}
