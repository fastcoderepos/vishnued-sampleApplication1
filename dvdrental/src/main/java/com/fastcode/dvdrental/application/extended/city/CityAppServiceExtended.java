package com.fastcode.dvdrental.application.extended.city;

import com.fastcode.dvdrental.application.core.city.CityAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.domain.extended.city.ICityRepositoryExtended;
import com.fastcode.dvdrental.domain.extended.country.ICountryRepositoryExtended;
import org.springframework.stereotype.Service;

@Service("cityAppServiceExtended")
public class CityAppServiceExtended extends CityAppService implements ICityAppServiceExtended {

    public CityAppServiceExtended(
        ICityRepositoryExtended cityRepositoryExtended,
        ICountryRepositoryExtended countryRepositoryExtended,
        ICityMapperExtended mapper,
        LoggingHelper logHelper
    ) {
        super(cityRepositoryExtended, countryRepositoryExtended, mapper, logHelper);
    }
    //Add your custom code here

}
