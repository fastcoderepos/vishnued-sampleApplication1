package com.fastcode.dvdrental.application.core.rental.dto;

import java.time.*;
import java.util.Date;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateRentalInput {

    private Date rentalDate;

    @NotNull(message = "rentalId Should not be null")
    private Integer rentalId;

    private Date returnDate;

    private Integer customerId;
    private Integer inventoryId;
    private Integer staffId;
    private Long versiono;
}
