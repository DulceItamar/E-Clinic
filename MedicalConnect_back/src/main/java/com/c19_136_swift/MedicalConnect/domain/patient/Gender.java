package com.c19_136_swift.MedicalConnect.domain.patient;

public enum Gender {
    FEMALE("Femenino", "Female"),
    MALE("Masculino", "Male"),
    OTHER ("Otro", "Other");
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

    public static Gender getGender(Gender genderInEnglish){
        for(Gender gender:Gender.values()){
            if (gender.getGender.equals(genderInEnglish)) {
                return gender;
            }
        }
        throw new IllegalArgumentException(("Ese género no fue encontrado " + genderInEnglish));
    }
}
