package com.fastcode.dvdrental.application.core.customer.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateCustomerOutput {

    private Integer active;
    private Boolean activebool;
    private Integer customerId;
    private String email;
    private String firstName;
    private String lastName;
    private Short storeId;
    private Integer addressId;
    private Integer addressDescriptiveField;
}
