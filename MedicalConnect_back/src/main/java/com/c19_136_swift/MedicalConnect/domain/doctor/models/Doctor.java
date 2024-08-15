package com.c19_136_swift.MedicalConnect.domain.doctor.models;

import com.c19_136_swift.MedicalConnect.domain.doctor.MedicalSpeciality;
import com.c19_136_swift.MedicalConnect.domain.user.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@Entity(name = "Doctor")
@Table(name = "doctors")
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Doctor extends User {

    @Enumerated(EnumType.STRING)
    private MedicalSpeciality medicalSpeciality;

    private String professionalLicense;

    private String jobDescription;

    private List<String> services;

    private List<String> workDays;

    private Float servicePrice;

    @OneToOne(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)

    private DoctorEvaluationData evaluationData = new DoctorEvaluationData();

}
