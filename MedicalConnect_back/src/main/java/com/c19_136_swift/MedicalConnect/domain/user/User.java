package com.c19_136_swift.MedicalConnect.domain.user;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public class User  {

    @Id
    private UUID id;

    private String name;
    private String email;
    private String password;
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    private TypeOfUser typeOfUser;

    @Enumerated(EnumType.STRING)
    private StatusOnApp status;

    public User(UUID id, String name, String email, String password, String phoneNumber, TypeOfUser typeOfUser){
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.typeOfUser = typeOfUser;
        this.status = StatusOnApp.ACTIVE;
    }

    public void updateUserData(String name, String password, String phoneNumber) {
       if ( name != null) {
           this.name = name;
       }

       if (password != null ){
           this.password = password;
       }

       if (phoneNumber != null){
           this.phoneNumber = phoneNumber;
       }
    }
    public void disableUserAccount(){
        this.status = StatusOnApp.DISABLED;
    }
}
