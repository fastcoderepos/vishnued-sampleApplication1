package com.fastcode.dvdrental.application.core.city;

import com.fastcode.dvdrental.application.core.city.dto.*;
import com.fastcode.dvdrental.commons.search.SearchCriteria;
import java.util.*;
import org.springframework.data.domain.Pageable;

public interface ICityAppService {
    //CRUD Operations

    CreateCityOutput create(CreateCityInput city);

    void delete(Integer id);

    UpdateCityOutput update(Integer id, UpdateCityInput input);

    FindCityByIdOutput findById(Integer id);

    List<FindCityByIdOutput> find(SearchCriteria search, Pageable pageable) throws Exception;
    //Relationship Operations

    GetCountryOutput getCountry(Integer cityid);

    //Join Column Parsers

    Map<String, String> parseAddressJoinColumn(String keysString);
}
