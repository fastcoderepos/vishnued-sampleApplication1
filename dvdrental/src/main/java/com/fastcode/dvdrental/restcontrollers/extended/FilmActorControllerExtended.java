package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.actor.IActorAppServiceExtended;
import com.fastcode.dvdrental.application.extended.film.IFilmAppServiceExtended;
import com.fastcode.dvdrental.application.extended.filmactor.IFilmActorAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.FilmActorController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/filmActor/extended")
public class FilmActorControllerExtended extends FilmActorController {

    public FilmActorControllerExtended(
        IFilmActorAppServiceExtended filmActorAppServiceExtended,
        IActorAppServiceExtended actorAppServiceExtended,
        IFilmAppServiceExtended filmAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(filmActorAppServiceExtended, actorAppServiceExtended, filmAppServiceExtended, helper, env);
    }
    //Add your custom code here

}
