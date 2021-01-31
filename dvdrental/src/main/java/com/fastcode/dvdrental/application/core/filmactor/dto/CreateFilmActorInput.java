package com.fastcode.dvdrental.application.core.filmactor.dto;

import java.time.*;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateFilmActorInput {

    @NotNull(message = "actorId Should not be null")
    private Integer actorId;

    @NotNull(message = "filmId Should not be null")
    private Integer filmId;
}
