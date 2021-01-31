package com.fastcode.dvdrental.application.extended.staff;

import com.fastcode.dvdrental.application.core.staff.StaffAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.address.IAddressRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.staff.IStaffRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("staffAppServiceExtended")
public class StaffAppServiceExtended extends StaffAppService implements IStaffAppServiceExtended {

    public StaffAppServiceExtended(
        IStaffRepositoryExtended staffRepositoryExtended,
        IAddressRepositoryExtended addressRepositoryExtended,
        IStaffMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(staffRepositoryExtended, addressRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
