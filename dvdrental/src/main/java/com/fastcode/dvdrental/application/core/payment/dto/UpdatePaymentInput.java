package com.fastcode.dvdrental.application.core.payment.dto;

import java.time.*;
import java.util.Date;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdatePaymentInput {

    @NotNull(message = "amount Should not be null")
    private Double amount;

    private Date paymentDate;

    @NotNull(message = "paymentId Should not be null")
    private Integer paymentId;

    private Integer customerId;
    private Integer rentalId;
    private Integer staffId;
    private Long versiono;
}
