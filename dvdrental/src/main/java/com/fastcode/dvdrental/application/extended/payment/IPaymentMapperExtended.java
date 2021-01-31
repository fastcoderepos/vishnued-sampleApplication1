package com.fastcode.dvdrental.application.extended.payment;

import com.fastcode.dvdrental.application.core.payment.IPaymentMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IPaymentMapperExtended extends IPaymentMapper {}
