package com.c19_136_swift.MedicalConnect.domain.user;

import java.lang.reflect.Type;

public enum TypeOfUser {
    PATIENT("patient", "Paciente"),
    DOCTOR("doctor", "Doctor");

    private String getTypeOfUser;
    private String getTypeOfUserInSpanish;

    TypeOfUser(String getTypeOfUser, String getTypeOfUserInSpanish){
        this.getTypeOfUser = getTypeOfUser;
        this.getTypeOfUserInSpanish = getTypeOfUserInSpanish;

    }

    public static TypeOfUser fromSpanish (String text){
        for (TypeOfUser user:TypeOfUser.values()){
            if (user.getTypeOfUserInSpanish.equalsIgnoreCase(text)){
                return user;
            }
        }
        throw new IllegalArgumentException("Este tipo de usuario no fue encontrado " + text);
    }

    public static  TypeOfUser getTypeOfUser(String text){
        for (TypeOfUser user: TypeOfUser.values()){
            if (user.getTypeOfUser.equalsIgnoreCase(text)){
                return user;
            }
        }
        throw  new IllegalArgumentException("Este tipo de usuario no fue encontrado " + text );
    }

}
