package com.fastcode.dvdrental.application.core.store.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindStoreByIdOutput {

    private Integer storeId;
    private Integer addressId;
    private Integer addressDescriptiveField;
    private Integer managerStaffId;
    private Integer staffDescriptiveField;
    private Long versiono;
}
