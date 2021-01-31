package com.fastcode.dvdrental.domain.core.filmcategory;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.category.CategoryEntity;
import com.fastcode.dvdrental.domain.core.film.FilmEntity;
import java.time.*;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "film_category")
@IdClass(FilmCategoryId.class)
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class FilmCategoryEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "category_id", nullable = false)
    private Integer categoryId;

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "film_id", nullable = false)
    private Integer filmId;

    @ManyToOne
    @JoinColumn(name = "film_id", insertable = false, updatable = false)
    private FilmEntity film;

    @ManyToOne
    @JoinColumn(name = "category_id", insertable = false, updatable = false)
    private CategoryEntity category;
}
