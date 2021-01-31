package com.fastcode.dvdrental.application.core.rental.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetCustomerOutput {

    private Integer active;
    private Integer customerId;
    private String email;
    private String firstName;
    private String lastName;
    private Short storeId;
    private Integer rentalRentalId;
}
