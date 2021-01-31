package com.fastcode.dvdrental.application.extended.authorization.user;

import com.fastcode.dvdrental.application.core.authorization.user.IUserMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IUserMapperExtended extends IUserMapper {}
