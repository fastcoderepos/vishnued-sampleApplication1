package com.fastcode.dvdrental.application.extended.authorization.userrole;

import com.fastcode.dvdrental.application.core.authorization.userrole.UserroleAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.authorization.role.IRoleRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.authorization.user.IUserRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.authorization.userrole.IUserroleRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("userroleAppServiceExtended")
public class UserroleAppServiceExtended extends UserroleAppService implements IUserroleAppServiceExtended {

    public UserroleAppServiceExtended(
        IUserroleRepositoryExtended userroleRepositoryExtended,
        IRoleRepositoryExtended roleRepositoryExtended,
        IUserRepositoryExtended userRepositoryExtended,
        IUserroleMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(userroleRepositoryExtended, roleRepositoryExtended, userRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
