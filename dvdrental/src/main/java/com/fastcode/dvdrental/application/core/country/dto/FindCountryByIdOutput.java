package com.fastcode.dvdrental.application.core.country.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindCountryByIdOutput {

    private String country;
    private Integer countryId;
    private Long versiono;
}
