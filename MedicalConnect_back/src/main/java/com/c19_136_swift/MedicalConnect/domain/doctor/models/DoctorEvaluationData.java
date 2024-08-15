package com.c19_136_swift.MedicalConnect.domain.doctor.models;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;
@Entity(name = "DoctorEvaluationData")
@Table(name = "Doctor_Evaluation_Data")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DoctorEvaluationData {

    @Id
    private UUID uuid;
    private Float averageOfEvaluations;
    private Integer numberOfConsults;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;


    private List<Review> reviews;
}
