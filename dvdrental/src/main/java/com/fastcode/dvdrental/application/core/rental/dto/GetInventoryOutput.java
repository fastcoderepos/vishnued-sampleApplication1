package com.fastcode.dvdrental.application.core.rental.dto;

import java.time.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetInventoryOutput {

    private Integer inventoryId;
    private Short storeId;
    private Integer rentalRentalId;
}
