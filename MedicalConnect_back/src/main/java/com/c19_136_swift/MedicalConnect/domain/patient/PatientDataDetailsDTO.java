package com.c19_136_swift.MedicalConnect.domain.patient;

import jakarta.persistence.Id;

import java.util.Date;

public record PatientDataDetailsDTO(

        Long id,
        String name,
        String email,
        Date birthdate,
        Gender gender

) {
}
