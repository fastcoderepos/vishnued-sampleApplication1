package com.fastcode.dvdrental.domain.core.category;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.filmcategory.FilmCategoryEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "category")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class CategoryEntity extends AbstractEntity {

    @Basic
    @Column(name = "name", nullable = false, length = 25)
    private String name;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id", nullable = false)
    private Integer categoryId;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private Set<FilmCategoryEntity> filmCategorysSet = new HashSet<FilmCategoryEntity>();
}
