package com.fastcode.dvdrental.domain.core.address;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("addressRepository")
public interface IAddressRepository
    extends JpaRepository<AddressEntity, Integer>, QuerydslPredicateExecutor<AddressEntity> {}
