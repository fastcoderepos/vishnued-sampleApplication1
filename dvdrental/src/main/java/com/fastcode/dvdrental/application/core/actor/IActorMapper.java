package com.fastcode.dvdrental.application.core.actor;

import com.fastcode.dvdrental.application.core.actor.dto.*;
import com.fastcode.dvdrental.domain.core.actor.ActorEntity;
import java.time.*;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IActorMapper {
    ActorEntity createActorInputToActorEntity(CreateActorInput actorDto);
    CreateActorOutput actorEntityToCreateActorOutput(ActorEntity entity);

    ActorEntity updateActorInputToActorEntity(UpdateActorInput actorDto);

    UpdateActorOutput actorEntityToUpdateActorOutput(ActorEntity entity);

    FindActorByIdOutput actorEntityToFindActorByIdOutput(ActorEntity entity);
}
