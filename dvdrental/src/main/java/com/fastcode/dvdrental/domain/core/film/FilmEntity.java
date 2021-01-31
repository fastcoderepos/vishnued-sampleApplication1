package com.fastcode.dvdrental.domain.core.film;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.filmactor.FilmActorEntity;
import com.fastcode.dvdrental.domain.core.filmcategory.FilmCategoryEntity;
import com.fastcode.dvdrental.domain.core.inventory.InventoryEntity;
import com.fastcode.dvdrental.domain.core.language.LanguageEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "film")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class FilmEntity extends AbstractEntity {

    @Basic
    @Column(name = "rental_rate", nullable = false)
    private Double rentalRate;

    @Basic
    @Column(name = "rental_duration", nullable = false)
    private Short rentalDuration;

    @Basic
    @Column(name = "length", nullable = true)
    private Short length;

    @Basic
    @Column(name = "rating", nullable = true, length = 255)
    private String rating;

    @Basic
    @Column(name = "description", nullable = true, length = 255)
    private String description;

    @Basic
    @Column(name = "replacement_cost", nullable = false)
    private Double replacementCost;

    @Basic
    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "film_id", nullable = false)
    private Integer filmId;

    @Basic
    @Column(name = "release_year", nullable = true)
    private Integer releaseYear;

    @ManyToOne
    @JoinColumn(name = "language_id")
    private LanguageEntity language;

    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
    private Set<InventoryEntity> inventorysSet = new HashSet<InventoryEntity>();

    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
    private Set<FilmCategoryEntity> filmCategorysSet = new HashSet<FilmCategoryEntity>();

    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
    private Set<FilmActorEntity> filmActorsSet = new HashSet<FilmActorEntity>();
}
