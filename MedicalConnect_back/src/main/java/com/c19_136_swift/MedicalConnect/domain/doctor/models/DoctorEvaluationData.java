package com.c19_136_swift.MedicalConnect.domain.doctor.models;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Entity(name = "DoctorEvaluationData")
@Table(name = "doctor_evaluation_data")
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

    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL, mappedBy = "evaluationDoctor")
    private List<Review> reviews;
}
