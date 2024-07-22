package com.c19_136_swift.MedicalConnect.domain.doctor;

import com.c19_136_swift.MedicalConnect.domain.user.User;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Entity(name = "Doctor")
@Table(name = "doctors")
@Getter
@AllArgsConstructor
@NoArgsConstructor

public class Doctor extends User {

    @Enumerated(EnumType.STRING)
    private MedicalSpecialty medicalSpecialty;

    private String professionalLicense;

    private String jobDescription;

}
