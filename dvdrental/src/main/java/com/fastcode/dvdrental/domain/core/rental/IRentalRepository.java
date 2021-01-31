package com.fastcode.dvdrental.domain.core.rental;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("rentalRepository")
public interface IRentalRepository
    extends JpaRepository<RentalEntity, Integer>, QuerydslPredicateExecutor<RentalEntity> {}
