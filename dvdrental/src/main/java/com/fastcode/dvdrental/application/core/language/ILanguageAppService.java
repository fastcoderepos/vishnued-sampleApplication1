package com.fastcode.dvdrental.application.core.language;

import com.fastcode.dvdrental.application.core.language.dto.*;
import com.fastcode.dvdrental.commons.search.SearchCriteria;
import java.util.*;
import org.springframework.data.domain.Pageable;

public interface ILanguageAppService {
    //CRUD Operations

    CreateLanguageOutput create(CreateLanguageInput language);

    void delete(Integer id);

    UpdateLanguageOutput update(Integer id, UpdateLanguageInput input);

    FindLanguageByIdOutput findById(Integer id);

    List<FindLanguageByIdOutput> find(SearchCriteria search, Pageable pageable) throws Exception;

    //Join Column Parsers

    Map<String, String> parseFilmsJoinColumn(String keysString);
}
