package com.fastcode.dvdrental.application.extended.filmcategory;

import com.fastcode.dvdrental.application.core.filmcategory.IFilmCategoryMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IFilmCategoryMapperExtended extends IFilmCategoryMapper {}
