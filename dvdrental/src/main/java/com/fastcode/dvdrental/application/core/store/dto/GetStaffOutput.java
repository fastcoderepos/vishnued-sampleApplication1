package com.fastcode.dvdrental.application.core.store.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetStaffOutput {

    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private Integer staffId;
    private Short storeId;
    private String username;
    private Integer storeStoreId;
}
