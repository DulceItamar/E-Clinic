package com.c19_136_swift.MedicalConnect.Service;

import com.c19_136_swift.MedicalConnect.domain.patient.Gender;
import com.c19_136_swift.MedicalConnect.domain.patient.Patient;
import com.c19_136_swift.MedicalConnect.domain.patient.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PatientService {
    @Autowired
    private PatientRepository patientRepository;

    public Optional<Patient> findActivePatientByEmail(String email){

        return patientRepository.findByEmailAndActive(email);
    }

    public Optional<Patient> findByActivePatientByEmail(Long id) {
        return patientRepository.findByIdAndActive(id);
    }

    public Optional<Patient> findByActivePatientByName(String name){
       return patientRepository.findByNameAndActive(name);
    }

    public Optional <Patient> findByActivePatientByPhoneNumber(String phone){
        return patientRepository.findByPhoneNumberAndActive(phone);
    }
    public Page<Patient> findActivePatientByGender(Gender gender, Pageable pageable){
        return patientRepository.findAllByGender(gender, pageable);
    }





}
