package com.fastcode.dvdrental.domain.core.authorization.user;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface IUserRepository extends JpaRepository<UserEntity, Long>, QuerydslPredicateExecutor<UserEntity> {
    @Query("select u from UserEntity u where u.userName = ?1")
    UserEntity findByUserName(String value);

    UserEntity findByEmailAddress(String emailAddress);
}
