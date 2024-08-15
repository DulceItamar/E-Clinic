package com.c19_136_swift.MedicalConnect.domain.doctor.models;

import com.c19_136_swift.MedicalConnect.domain.patient.model.Patient;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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


    private Patient patient;

    
    private Doctor doctor;
}
