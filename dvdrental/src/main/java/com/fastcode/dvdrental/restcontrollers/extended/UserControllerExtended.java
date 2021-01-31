package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.authorization.user.IUserAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.userpermission.IUserpermissionAppServiceExtended;
import com.fastcode.dvdrental.application.extended.authorization.userrole.IUserroleAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.UserController;
import com.fastcode.dvdrental.security.JWTAppService;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user/extended")
public class UserControllerExtended extends UserController {

    public UserControllerExtended(
        IUserAppServiceExtended userAppServiceExtended,
        IUserpermissionAppServiceExtended userpermissionAppServiceExtended,
        IUserroleAppServiceExtended userroleAppServiceExtended,
        PasswordEncoder pEncoder,
        JWTAppService jwtAppService,
        LoggingHelper helper,
        Environment env
    ) {
        super(
            userAppServiceExtended,
            userpermissionAppServiceExtended,
            userroleAppServiceExtended,
            pEncoder,
            jwtAppService,
            helper,
            env
        );
    }
    //Add your custom code here

}
