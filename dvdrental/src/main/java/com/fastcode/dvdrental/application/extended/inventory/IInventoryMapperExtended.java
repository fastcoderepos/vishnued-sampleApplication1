package com.fastcode.dvdrental.application.extended.inventory;

import com.fastcode.dvdrental.application.core.inventory.IInventoryMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IInventoryMapperExtended extends IInventoryMapper {}
