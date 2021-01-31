package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.film.IFilmAppServiceExtended;
import com.fastcode.dvdrental.application.extended.filmactor.IFilmActorAppServiceExtended;
import com.fastcode.dvdrental.application.extended.filmcategory.IFilmCategoryAppServiceExtended;
import com.fastcode.dvdrental.application.extended.inventory.IInventoryAppServiceExtended;
import com.fastcode.dvdrental.application.extended.language.ILanguageAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.FilmController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/film/extended")
public class FilmControllerExtended extends FilmController {

    public FilmControllerExtended(
        IFilmAppServiceExtended filmAppServiceExtended,
        IFilmActorAppServiceExtended filmActorAppServiceExtended,
        IFilmCategoryAppServiceExtended filmCategoryAppServiceExtended,
        IInventoryAppServiceExtended inventoryAppServiceExtended,
        ILanguageAppServiceExtended languageAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(
            filmAppServiceExtended,
            filmActorAppServiceExtended,
            filmCategoryAppServiceExtended,
            inventoryAppServiceExtended,
            languageAppServiceExtended,
            helper,
            env
        );
    }
    //Add your custom code here

}
