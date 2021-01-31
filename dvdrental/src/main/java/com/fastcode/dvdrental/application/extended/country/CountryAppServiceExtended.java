package com.fastcode.dvdrental.application.extended.country;

import com.fastcode.dvdrental.application.core.country.CountryAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.country.ICountryRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("countryAppServiceExtended")
public class CountryAppServiceExtended extends CountryAppService implements ICountryAppServiceExtended {

    public CountryAppServiceExtended(
        ICountryRepositoryExtended countryRepositoryExtended,
        ICountryMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(countryRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
