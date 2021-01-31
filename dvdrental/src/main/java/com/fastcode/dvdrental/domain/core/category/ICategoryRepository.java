package com.fastcode.dvdrental.domain.core.category;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("categoryRepository")
public interface ICategoryRepository
    extends JpaRepository<CategoryEntity, Integer>, QuerydslPredicateExecutor<CategoryEntity> {}
