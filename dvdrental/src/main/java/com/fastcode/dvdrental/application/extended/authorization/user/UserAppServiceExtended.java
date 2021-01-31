package com.fastcode.dvdrental.application.extended.authorization.user;

import com.fastcode.dvdrental.application.core.authorization.user.UserAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.core.authorization.userpreference.IUserpreferenceRepository;
import com.fastcode.dvdrental.domain.extended.authorization.user.IUserRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("userAppServiceExtended")
public class UserAppServiceExtended extends UserAppService implements IUserAppServiceExtended {

    public UserAppServiceExtended(
        IUserRepositoryExtended userRepositoryExtended,
        IUserpreferenceRepository userpreferenceRepository,
        IUserMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(userRepositoryExtended, userpreferenceRepository, mapper, logHelper);
    }
    //Add your custom code here

}
