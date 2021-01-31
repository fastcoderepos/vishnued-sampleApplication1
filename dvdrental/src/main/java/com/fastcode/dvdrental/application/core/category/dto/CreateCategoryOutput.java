package com.fastcode.dvdrental.application.core.category.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateCategoryOutput {

    private Integer categoryId;
    private String name;
}
