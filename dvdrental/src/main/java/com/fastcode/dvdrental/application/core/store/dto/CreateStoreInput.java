package com.fastcode.dvdrental.application.core.store.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateStoreInput {

    private Integer addressId;
    private Integer managerStaffId;
}
