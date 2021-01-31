package com.fastcode.dvdrental.domain.core.payment;

import java.time.*;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository("paymentRepository")
public interface IPaymentRepository
    extends JpaRepository<PaymentEntity, Integer>, QuerydslPredicateExecutor<PaymentEntity> {}
