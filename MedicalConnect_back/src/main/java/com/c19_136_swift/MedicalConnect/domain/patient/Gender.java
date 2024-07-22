package com.c19_136_swift.MedicalConnect.domain.patient;

public enum Gender {
    FEMALE("Femenino"),
    MALE("Masculino"),
    OTHER ("Otro");
    private String getGenderInSpanish;

    Gender(String getGenderInSpanish){
        this.getGenderInSpanish = getGenderInSpanish;
    }

    public static  Gender fromSpanish (String text){
        for (Gender gender:Gender.values()){
            if (gender.getGenderInSpanish.equalsIgnoreCase(text)){
                return gender;
            }
        }
        throw new IllegalArgumentException(("Ese género no fue encontrado " + text));
    }
}
