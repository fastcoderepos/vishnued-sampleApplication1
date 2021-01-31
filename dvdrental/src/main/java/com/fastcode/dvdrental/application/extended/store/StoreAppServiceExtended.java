package com.fastcode.dvdrental.application.extended.store;

import com.fastcode.dvdrental.application.core.store.StoreAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.address.IAddressRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.staff.IStaffRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.store.IStoreRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("storeAppServiceExtended")
public class StoreAppServiceExtended extends StoreAppService implements IStoreAppServiceExtended {

    public StoreAppServiceExtended(
        IStoreRepositoryExtended storeRepositoryExtended,
        IAddressRepositoryExtended addressRepositoryExtended,
        IStaffRepositoryExtended staffRepositoryExtended,
        IStoreMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(storeRepositoryExtended, addressRepositoryExtended, staffRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
