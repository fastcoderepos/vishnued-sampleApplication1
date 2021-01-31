package com.fastcode.dvdrental.domain.core.staff;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("staffRepository")
public interface IStaffRepository extends JpaRepository<StaffEntity, Integer>, QuerydslPredicateExecutor<StaffEntity> {}
