package com.fastcode.dvdrental.application.core.filmactor.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetActorOutput {

    private Integer actorId;
    private String firstName;
    private String lastName;
    private Integer filmActorActorId;
    private Integer filmActorFilmId;
}
