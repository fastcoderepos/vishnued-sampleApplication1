package com.fastcode.dvdrental.application.core.filmactor.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateFilmActorOutput {

    private Integer actorId;
    private Integer filmId;
    private Integer actorDescriptiveField;
    private Integer filmDescriptiveField;
}
