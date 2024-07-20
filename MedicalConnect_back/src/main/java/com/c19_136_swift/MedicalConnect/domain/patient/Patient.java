package com.c19_136_swift.MedicalConnect.domain.patient;

import com.c19_136_swift.MedicalConnect.domain.person.Person;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity(name = "Patient")
@Table(name = "Patients")
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Patient extends Person {
    private Date birthDate;
    private String allergies;

}
