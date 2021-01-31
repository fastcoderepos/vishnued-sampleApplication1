package com.fastcode.dvdrental.domain.core.filmcategory;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("filmCategoryRepository")
public interface IFilmCategoryRepository
    extends JpaRepository<FilmCategoryEntity, FilmCategoryId>, QuerydslPredicateExecutor<FilmCategoryEntity> {}
