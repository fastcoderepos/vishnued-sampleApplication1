package com.fastcode.dvdrental.application.core.language.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindLanguageByIdOutput {

    private Integer languageId;
    private String name;
    private Long versiono;
}
