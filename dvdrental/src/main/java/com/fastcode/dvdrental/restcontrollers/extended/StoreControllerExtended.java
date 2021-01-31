package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.address.IAddressAppServiceExtended;
import com.fastcode.dvdrental.application.extended.staff.IStaffAppServiceExtended;
import com.fastcode.dvdrental.application.extended.store.IStoreAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.StoreController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/store/extended")
public class StoreControllerExtended extends StoreController {

    public StoreControllerExtended(
        IStoreAppServiceExtended storeAppServiceExtended,
        IAddressAppServiceExtended addressAppServiceExtended,
        IStaffAppServiceExtended staffAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(storeAppServiceExtended, addressAppServiceExtended, staffAppServiceExtended, helper, env);
    }
    //Add your custom code here

}
