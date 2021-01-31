package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.authorization.role.IRoleAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.user.IUserAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.userrole.IUserroleAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.UserroleController;
import com.fastcode.dvdrental.security.JWTAppService;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/userrole/extended")
public class UserroleControllerExtended extends UserroleController {

    public UserroleControllerExtended(
        IUserroleAppServiceExtended userroleAppServiceExtended,
        IRoleAppServiceExtended roleAppServiceExtended,
        IUserAppServiceExtended userAppServiceExtended,
        JWTAppService jwtAppService,
        LoggingHelper helper,
        Environment env
    ) {
        super(userroleAppServiceExtended, roleAppServiceExtended, userAppServiceExtended, jwtAppService, helper, env);
    }
    //Add your custom code here

}
