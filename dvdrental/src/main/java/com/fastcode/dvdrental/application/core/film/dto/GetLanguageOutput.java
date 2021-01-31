package com.fastcode.dvdrental.application.core.film.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetLanguageOutput {

    private Integer languageId;
    private String name;
    private Integer filmFilmId;
}
