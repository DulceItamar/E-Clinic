package com.c19_136_swift.MedicalConnect.domain.patient;

import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.SignInPatientDTO;
import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.UpdatePatientDTO;
import com.c19_136_swift.MedicalConnect.domain.user.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

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


    public Patient(SignInPatientDTO patientDTO){
        super(patientDTO.name(), patientDTO.email(), patientDTO.password(), patientDTO.phone());
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
