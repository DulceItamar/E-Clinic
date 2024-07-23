package com.c19_136_swift.MedicalConnect.controllers;

import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientDataDetailsDTO;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientRepository;
import com.c19_136_swift.MedicalConnect.domain.patient.SignInPatientDTO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    PatientRepository patientRepository;


    @PostMapping
    public ResponseEntity<PatientDataDetailsDTO> signinNewPatient(@RequestBody @Valid SignInPatientDTO patientDTO, UriComponentsBuilder uriComponentsBuilder){
        Patient patient = new Patient(patientDTO);
        patientRepository.save(patient);

        PatientDataDetailsDTO dataDetailsDTO = new PatientDataDetailsDTO(patient.getId(), patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender());

        URI uri = uriComponentsBuilder.path("/patients/{id}").buildAndExpand(patient.getId()).toUri();
        return ResponseEntity.created(uri).body(dataDetailsDTO);







    }

}
