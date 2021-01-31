package com.fastcode.dvdrental.application.extended.authorization.userpermission;

import com.fastcode.dvdrental.application.core.authorization.userpermission.UserpermissionAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.authorization.permission.IPermissionRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.authorization.user.IUserRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.authorization.userpermission.IUserpermissionRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("userpermissionAppServiceExtended")
public class UserpermissionAppServiceExtended
    extends UserpermissionAppService
    implements IUserpermissionAppServiceExtended {

    public UserpermissionAppServiceExtended(
        IUserpermissionRepositoryExtended userpermissionRepositoryExtended,
        IPermissionRepositoryExtended permissionRepositoryExtended,
        IUserRepositoryExtended userRepositoryExtended,
        IUserpermissionMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(
            userpermissionRepositoryExtended,
            permissionRepositoryExtended,
            userRepositoryExtended,
            mapper,
            logHelper
        );
    }
    //Add your custom code here

}
