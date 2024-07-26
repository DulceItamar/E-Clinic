package com.c19_136_swift.MedicalConnect.controllers;

import com.c19_136_swift.MedicalConnect.domain.patient.DTOs.*;
import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientRepository;
import com.c19_136_swift.MedicalConnect.infra.errors.PatientNotFoundException;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.Optional;

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
    @GetMapping("/by-id")
    public ResponseEntity<PatientDataDetailsDTO> patientDetailsById( @RequestParam(name = "id")  Long id){
        var patient = patientRepository.findByIdAndActive(id)
                .orElseThrow(() -> new PatientNotFoundException("Paciente con id "+ id + "no encontrado o no está activo"));

        return ResponseEntity.ok( new PatientDataDetailsDTO(patient));

    }

    //To get an active patient by its name
    @GetMapping("/by-name")
    public ResponseEntity<PatientDataDetailsDTO> patientDetailsByName( @RequestParam(name = "name") String name) {
        var patient = patientRepository.findByNameAndActive(name)
                .orElseThrow(() -> new PatientNotFoundException("Paciente con el nombre "+ name + " no encontrado o no está activo."));

        return ResponseEntity.ok(new PatientDataDetailsDTO(patient));

    }

    //To get an active patient by its phone Number
    @GetMapping("/by-phone")
    public ResponseEntity<PatientDataDetailsDTO> patientDetailsByPhone( @RequestParam(name = "phone-number") String phone){
        var patient = patientRepository.findByPhoneNumberAndActive(phone)
                .orElseThrow(() -> new PatientNotFoundException("Paciente con el número de teléfono "+ phone + " no encontrado o está activo."));
        return ResponseEntity.ok(new PatientDataDetailsDTO(patient));

    }


    //To get all active patients by their Gender
    @GetMapping("/by-gender")
    public ResponseEntity<Page<PatientListDTO>> patientsByGenderList(@PageableDefault(size = 10, sort = {"name"}) Pageable pageable,  @RequestParam(name = "gender") Gender gender){
        var page = patientRepository.findAllByGenderAndActive(gender, pageable).map(PatientListDTO::new);
        return ResponseEntity.ok(page);

    }

    //To get all active patients
    @GetMapping
    public ResponseEntity<Page<PatientListDTO>>  allPatientsList( @PageableDefault(size = 10, sort = {"name"}) Pageable pageable){
        var page = patientRepository.findAllByActive(pageable).map(PatientListDTO::new);
        return ResponseEntity.ok(page);
    }


    @PutMapping
    @Transactional
    public ResponseEntity updatePatientById(@RequestBody @Valid UpdatePatientDTO updatePatientDTO) {
        Patient updatePatient = patientRepository.findByIdAndActive(updatePatientDTO.id()).orElseThrow(() -> new PatientNotFoundException("Paciente no encontrad0"));

        updatePatient.updateData(updatePatientDTO);

        ResponsePatientDataUpdatedDTO responsePatientDataUpdated = new ResponsePatientDataUpdatedDTO(updatePatient.getId(), updatePatient.getName(),updatePatient.getPassword(), updatePatient.getPhoneNumber(), updatePatient.getBirthdate(), updatePatient.getAllergies(), updatePatient.getGender());


        return ResponseEntity.ok( responsePatientDataUpdated);

    }

}
