package com.fastcode.dvdrental.domain.core.language;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("languageRepository")
public interface ILanguageRepository
    extends JpaRepository<LanguageEntity, Integer>, QuerydslPredicateExecutor<LanguageEntity> {}
