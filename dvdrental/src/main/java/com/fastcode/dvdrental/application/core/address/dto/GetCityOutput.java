package com.fastcode.dvdrental.application.core.address.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetCityOutput {

    private String city;
    private Integer cityId;
    private Integer addressAddressId;
}
