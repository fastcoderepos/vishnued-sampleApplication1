package com.fastcode.dvdrental.application.extended.address;

import com.fastcode.dvdrental.application.core.address.AddressAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.address.IAddressRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.city.ICityRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("addressAppServiceExtended")
public class AddressAppServiceExtended extends AddressAppService implements IAddressAppServiceExtended {

    public AddressAppServiceExtended(
        IAddressRepositoryExtended addressRepositoryExtended,
        ICityRepositoryExtended cityRepositoryExtended,
        IAddressMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(addressRepositoryExtended, cityRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
