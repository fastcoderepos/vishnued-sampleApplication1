package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.authorization.permission.IPermissionAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.rolepermission.IRolepermissionAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.userpermission.IUserpermissionAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.PermissionController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/permission/extended")
public class PermissionControllerExtended extends PermissionController {

    public PermissionControllerExtended(
        IPermissionAppServiceExtended permissionAppServiceExtended,
        IRolepermissionAppServiceExtended rolepermissionAppServiceExtended,
        IUserpermissionAppServiceExtended userpermissionAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(
            permissionAppServiceExtended,
            rolepermissionAppServiceExtended,
            userpermissionAppServiceExtended,
            helper,
            env
        );
    }
    //Add your custom code here

}
