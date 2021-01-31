package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.film.IFilmAppServiceExtended;
import com.fastcode.dvdrental.application.extended.language.ILanguageAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.LanguageController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/language/extended")
public class LanguageControllerExtended extends LanguageController {

    public LanguageControllerExtended(
        ILanguageAppServiceExtended languageAppServiceExtended,
        IFilmAppServiceExtended filmAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(languageAppServiceExtended, filmAppServiceExtended, helper, env);
    }
    //Add your custom code here

}
