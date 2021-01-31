package com.fastcode.dvdrental.application.extended.payment;

import com.fastcode.dvdrental.application.core.payment.PaymentAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.customer.ICustomerRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.payment.IPaymentRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.rental.IRentalRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.staff.IStaffRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("paymentAppServiceExtended")
public class PaymentAppServiceExtended extends PaymentAppService implements IPaymentAppServiceExtended {

    public PaymentAppServiceExtended(
        IPaymentRepositoryExtended paymentRepositoryExtended,
        ICustomerRepositoryExtended customerRepositoryExtended,
        IRentalRepositoryExtended rentalRepositoryExtended,
        IStaffRepositoryExtended staffRepositoryExtended,
        IPaymentMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(
            paymentRepositoryExtended,
            customerRepositoryExtended,
            rentalRepositoryExtended,
            staffRepositoryExtended,
            mapper,
            logHelper
        );
    }
    //Add your custom code here

}
