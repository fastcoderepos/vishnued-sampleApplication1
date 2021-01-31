package com.fastcode.dvdrental.application.core.payment.dto;

import java.time.*;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GetRentalOutput {

    private Date rentalDate;
    private Integer rentalId;
    private Date returnDate;
    private Integer paymentPaymentId;
}
