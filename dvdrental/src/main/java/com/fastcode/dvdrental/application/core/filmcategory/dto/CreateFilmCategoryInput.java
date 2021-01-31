package com.fastcode.dvdrental.application.core.filmcategory.dto;

import java.time.*;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateFilmCategoryInput {

    @NotNull(message = "categoryId Should not be null")
    private Integer categoryId;

    @NotNull(message = "filmId Should not be null")
    private Integer filmId;
}
