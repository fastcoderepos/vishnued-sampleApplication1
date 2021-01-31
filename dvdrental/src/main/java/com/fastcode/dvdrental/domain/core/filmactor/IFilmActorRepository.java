package com.fastcode.dvdrental.domain.core.filmactor;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("filmActorRepository")
public interface IFilmActorRepository
    extends JpaRepository<FilmActorEntity, FilmActorId>, QuerydslPredicateExecutor<FilmActorEntity> {}
