package com.c19_136_swift.MedicalConnect.infra.errors;

import lombok.Getter;

@Getter
public class ErrorResponse {

    private String message;

    public ErrorResponse(String message){
        this.message = message;
    }
}
