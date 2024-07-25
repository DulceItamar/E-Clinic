package com.c19_136_swift.MedicalConnect.controllers;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.PatientDataDetailsDTO;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientRepository;
import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.SignInPatientDTO;
import com.c19_136_swift.MedicalConnect.infra.errors.PatientNotFoundException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    PatientRepository patientRepository;

    //To create a new patient
    @PostMapping
    public ResponseEntity<PatientDataDetailsDTO> signinNewPatient(@RequestBody @Valid SignInPatientDTO patientDTO, UriComponentsBuilder uriComponentsBuilder){
        Patient patient = new Patient(patientDTO);
        patientRepository.save(patient);


        PatientDataDetailsDTO dataDetailsDTO = new PatientDataDetailsDTO(patient.getId(), patient.getName(), patient.getEmail(), patient.getBirthdate(), patient.getGender());

        URI uri = uriComponentsBuilder.path("/patients/{id}").buildAndExpand(patient.getId()).toUri();
        return ResponseEntity.created(uri).body(dataDetailsDTO);

    }

    //To get an active patient by its email
    @GetMapping()
    public ResponseEntity<PatientDataDetailsDTO> patientDetailsById( @RequestParam(name = "id")  Long id){
        var patient = patientRepository.findByIdAndActive(id)
                .orElseThrow(() -> new PatientNotFoundException("Paciente con id "+ id + "no encontrado o no está activo"));

        return ResponseEntity.ok( new PatientDataDetailsDTO(patient));

    }

    //To get an active patient by its name
    @GetMapping()
    public ResponseEntity<PatientDataDetailsDTO> patientDetailsByName( @RequestParam(name = "name") String name) {
        var patient = patientRepository.findByNameAndActive(name)
                .orElseThrow(() -> new PatientNotFoundException("Paciente con el nombre "+ name + "no encontrado o no está activo"));

        return ResponseEntity.ok(new PatientDataDetailsDTO(patient));

    }







}
