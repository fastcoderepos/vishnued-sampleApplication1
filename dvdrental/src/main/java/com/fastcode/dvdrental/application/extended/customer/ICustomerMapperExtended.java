package com.fastcode.dvdrental.application.extended.customer;

import com.fastcode.dvdrental.application.core.customer.ICustomerMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ICustomerMapperExtended extends ICustomerMapper {}
