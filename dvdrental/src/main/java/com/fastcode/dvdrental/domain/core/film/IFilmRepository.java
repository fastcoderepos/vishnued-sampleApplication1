package com.fastcode.dvdrental.domain.core.film;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("filmRepository")
public interface IFilmRepository extends JpaRepository<FilmEntity, Integer>, QuerydslPredicateExecutor<FilmEntity> {}
