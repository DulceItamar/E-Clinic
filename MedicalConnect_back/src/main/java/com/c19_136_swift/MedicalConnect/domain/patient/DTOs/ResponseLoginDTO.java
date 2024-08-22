package com.c19_136_swift.MedicalConnect.domain.patient.DTOs;

import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;

public record ResponseLoginDTO(
        String email,
        String password
) {
    public ResponseLoginDTO(Patient patient) {
        this(patient.getEmail(),patient.getPassword());
    }
}
