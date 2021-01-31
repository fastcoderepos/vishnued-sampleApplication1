package com.fastcode.dvdrental.application.core.category.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindCategoryByIdOutput {

    private Integer categoryId;
    private String name;
    private Long versiono;
}
