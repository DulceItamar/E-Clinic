package com.c19_136_swift.MedicalConnect.infra.errors;

public class PatientNotFoundException extends RuntimeException{
    public PatientNotFoundException(Long id){
        super("Paciente con id "+ id + "no encontrado o no está activo"  );
    }
}
