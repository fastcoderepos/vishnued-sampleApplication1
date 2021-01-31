package com.fastcode.dvdrental.application.core.rental.dto;

import java.time.*;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateRentalInput {

    private Date rentalDate;

    private Date returnDate;

    private Integer customerId;
    private Integer inventoryId;
    private Integer staffId;
}
