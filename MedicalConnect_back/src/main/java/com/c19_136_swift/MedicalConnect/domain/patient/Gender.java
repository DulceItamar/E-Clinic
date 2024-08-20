package com.c19_136_swift.MedicalConnect.domain.patient;

public enum Gender {
    FEMALE("Femenino", "female"),
    MALE("Masculino", "male"),
    OTHER ("Otro", "other");
    private String getGenderInSpanish;
    private String getGender;

    Gender(String getGenderInSpanish, String getGender){
        this.getGenderInSpanish = getGenderInSpanish;
        this.getGender = getGender;
    }

    public static  Gender fromSpanish (String text){
        for (Gender gender:Gender.values()){
            if (gender.getGenderInSpanish.equalsIgnoreCase(text)){
                return gender;
            }
        }
        throw new IllegalArgumentException(("Ese género no fue encontrado " + text));
    }

    public static Gender getGender(String genderInEnglish){
        for(Gender gender:Gender.values()){
            if (gender.getGender.equals(genderInEnglish)) {
                return gender;
            }
        }
        throw new IllegalArgumentException(("Ese género no fue encontrado " + genderInEnglish));
    }
}
