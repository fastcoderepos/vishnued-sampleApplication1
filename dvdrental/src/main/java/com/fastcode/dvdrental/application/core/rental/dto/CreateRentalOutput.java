package com.fastcode.dvdrental.application.core.rental.dto;

import java.time.*;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateRentalOutput {

    private Date rentalDate;
    private Integer rentalId;
    private Date returnDate;
    private Integer customerId;
    private Integer customerDescriptiveField;
    private Integer inventoryId;
    private Integer inventoryDescriptiveField;
    private Integer staffId;
    private Integer staffDescriptiveField;
}
