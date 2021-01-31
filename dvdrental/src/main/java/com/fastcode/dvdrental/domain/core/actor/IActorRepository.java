package com.fastcode.dvdrental.domain.core.actor;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("actorRepository")
public interface IActorRepository extends JpaRepository<ActorEntity, Integer>, QuerydslPredicateExecutor<ActorEntity> {}
