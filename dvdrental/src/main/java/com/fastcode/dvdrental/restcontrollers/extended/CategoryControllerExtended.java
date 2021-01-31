package com.fastcode.dvdrental.restcontrollers.extended;

import com.fastcode.dvdrental.application.extended.category.ICategoryAppServiceExtended;
import com.fastcode.dvdrental.application.extended.filmcategory.IFilmCategoryAppServiceExtended;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.restcontrollers.core.CategoryController;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/category/extended")
public class CategoryControllerExtended extends CategoryController {

    public CategoryControllerExtended(
        ICategoryAppServiceExtended categoryAppServiceExtended,
        IFilmCategoryAppServiceExtended filmCategoryAppServiceExtended,
        LoggingHelper helper,
        Environment env
    ) {
        super(categoryAppServiceExtended, filmCategoryAppServiceExtended, helper, env);
    }
    //Add your custom code here

}
