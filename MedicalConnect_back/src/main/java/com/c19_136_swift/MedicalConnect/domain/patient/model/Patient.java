package com.c19_136_swift.MedicalConnect.domain.patient.model;

import com.c19_136_swift.MedicalConnect.domain.medicalConsult.payment.Payment;
import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.SignInPatientDTO;
import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.UpdatePatientDTO;
import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.user.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Entity(name = "Patient")
@Table(name = "Patients")
@Getter

@NoArgsConstructor
@AllArgsConstructor
public class Patient extends User {
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    private LocalDate birthdate;
    private String allergies;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @OneToMany
    private List<PaymentMethodsPatient> paymentMethodsPatientsList = new ArrayList<>();


    public Patient(SignInPatientDTO patientDTO){
        super(patientDTO.uuid(),patientDTO.name(), patientDTO.email(), patientDTO.password(), patientDTO.phoneNumber(), patientDTO.typeOfUser());
        this.birthdate = patientDTO.birthdate();
        this.allergies = patientDTO.allergies();
        this.gender = Gender.fromSpanish(patientDTO.gender());
    }

    public void updateData(UpdatePatientDTO updatePatientDTO){


       if (updatePatientDTO.name() != null){
           this.setName(updatePatientDTO.name());
           System.out.println("Name updated to " + updatePatientDTO.name()+".");
       }

       if (updatePatientDTO.password() != null) {
           this.setPassword(updatePatientDTO.password());
           System.out.println("Password updated.");
       }

       if ( updatePatientDTO.phone() != null) {
           this.setPhoneNumber(updatePatientDTO.phone());
           System.out.println("Phone number updated to "+ updatePatientDTO.phone() + ".");
       }

       if (updatePatientDTO.gender() != null) {

           gender = updatePatientDTO.gender();
           System.out.println("Gender updated to "+ updatePatientDTO.gender()+ ".");
       }

       if (updatePatientDTO.birthdate() != null){
           birthdate = updatePatientDTO.birthdate();
           System.out.println("Birthdate updated.");
       }

       if (updatePatientDTO.allergies() != null) {
           allergies = updatePatientDTO.allergies();
           System.out.println("Allergies updated.");
       }
    }

    public void disablePatientAccount(){
        disableUserAccount();
    }


}
