package com.c19_136_swift.MedicalConnect.domain.doctor.models;

import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.print.Doc;
import java.util.UUID;
@Entity(name = "Review")
@Table(name = "Reviews")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Review {

    @Id
    private UUID id;

    private Float evaluation;
    private String reviewDescription;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_evaluation_id")
    private DoctorEvaluationData evaluationDoctor;
}
