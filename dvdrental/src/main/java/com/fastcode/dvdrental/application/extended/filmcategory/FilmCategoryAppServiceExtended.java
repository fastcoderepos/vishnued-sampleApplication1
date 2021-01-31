package com.fastcode.dvdrental.application.extended.filmcategory;

import com.fastcode.dvdrental.application.core.filmcategory.FilmCategoryAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.category.ICategoryRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.film.IFilmRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.filmcategory.IFilmCategoryRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("filmCategoryAppServiceExtended")
public class FilmCategoryAppServiceExtended extends FilmCategoryAppService implements IFilmCategoryAppServiceExtended {

    public FilmCategoryAppServiceExtended(
        IFilmCategoryRepositoryExtended filmCategoryRepositoryExtended,
        ICategoryRepositoryExtended categoryRepositoryExtended,
        IFilmRepositoryExtended filmRepositoryExtended,
        IFilmCategoryMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(filmCategoryRepositoryExtended, categoryRepositoryExtended, filmRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
