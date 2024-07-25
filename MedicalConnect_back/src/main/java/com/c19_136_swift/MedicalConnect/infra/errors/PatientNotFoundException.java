package com.c19_136_swift.MedicalConnect.infra.errors;

public class PatientNotFoundException extends RuntimeException{
    public PatientNotFoundException(String message){
        super(message);
    }
}
