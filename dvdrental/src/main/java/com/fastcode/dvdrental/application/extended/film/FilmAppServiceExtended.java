package com.fastcode.dvdrental.application.extended.film;

import com.fastcode.dvdrental.application.core.film.FilmAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.film.IFilmRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.language.ILanguageRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("filmAppServiceExtended")
public class FilmAppServiceExtended extends FilmAppService implements IFilmAppServiceExtended {

    public FilmAppServiceExtended(
        IFilmRepositoryExtended filmRepositoryExtended,
        ILanguageRepositoryExtended languageRepositoryExtended,
        IFilmMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(filmRepositoryExtended, languageRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
