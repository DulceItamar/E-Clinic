package com.c19_136_swift.MedicalConnect.domain.user;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.Collection;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public class User  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    private StatusOnApp status;

    public User(String name, String email, String password, String phoneNumber){
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
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
