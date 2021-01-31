package com.fastcode.dvdrental.application.core.address.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateAddressOutput {

    private String address;
    private String address2;
    private Integer addressId;
    private String district;
    private String phone;
    private String postalCode;
    private Integer cityId;
    private Integer cityDescriptiveField;
}
