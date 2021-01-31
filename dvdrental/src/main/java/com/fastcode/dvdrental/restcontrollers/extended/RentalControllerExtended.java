package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.customer.ICustomerAppServiceExtended;
import com.fastcode.dvdrental.application.extended.inventory.IInventoryAppServiceExtended;
import com.fastcode.dvdrental.application.extended.payment.IPaymentAppServiceExtended;
import com.fastcode.dvdrental.application.extended.rental.IRentalAppServiceExtended;
import com.fastcode.dvdrental.application.extended.staff.IStaffAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.RentalController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rental/extended")
public class RentalControllerExtended extends RentalController {

    public RentalControllerExtended(
        IRentalAppServiceExtended rentalAppServiceExtended,
        ICustomerAppServiceExtended customerAppServiceExtended,
        IInventoryAppServiceExtended inventoryAppServiceExtended,
        IPaymentAppServiceExtended paymentAppServiceExtended,
        IStaffAppServiceExtended staffAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(
            rentalAppServiceExtended,
            customerAppServiceExtended,
            inventoryAppServiceExtended,
            paymentAppServiceExtended,
            staffAppServiceExtended,
            helper,
            env
        );
    }
    //Add your custom code here

}
