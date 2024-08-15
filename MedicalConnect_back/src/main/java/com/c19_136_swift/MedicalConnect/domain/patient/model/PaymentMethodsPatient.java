package com.c19_136_swift.MedicalConnect.domain.patient.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Optional;
import java.util.UUID;


@Entity(name = "PaymentMethodsPatient")
@Table(name = "payment_Methods_Patient")
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMethodsPatient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    UUID uuid;
    String cardName;
    String cardNumber;
    String expiredDate;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    Patient patient;


}
