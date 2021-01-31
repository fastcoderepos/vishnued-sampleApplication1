package com.fastcode.dvdrental.domain.core.authorization.userpermission;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("userpermissionRepository")
public interface IUserpermissionRepository
    extends JpaRepository<UserpermissionEntity, UserpermissionId>, QuerydslPredicateExecutor<UserpermissionEntity> {
    List<UserpermissionEntity> findByUserId(Long userId);
}
