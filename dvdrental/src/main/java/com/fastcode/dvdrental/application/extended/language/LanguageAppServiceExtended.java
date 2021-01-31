package com.fastcode.dvdrental.application.extended.language;

import com.fastcode.dvdrental.application.core.language.LanguageAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.language.ILanguageRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("languageAppServiceExtended")
public class LanguageAppServiceExtended extends LanguageAppService implements ILanguageAppServiceExtended {

    public LanguageAppServiceExtended(
        ILanguageRepositoryExtended languageRepositoryExtended,
        ILanguageMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(languageRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
