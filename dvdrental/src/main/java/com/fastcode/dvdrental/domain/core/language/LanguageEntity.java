package com.fastcode.dvdrental.domain.core.language;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.film.FilmEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "language")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class LanguageEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "language_id", nullable = false)
    private Integer languageId;

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    private String name;

    @OneToMany(mappedBy = "language", cascade = CascadeType.ALL)
    private Set<FilmEntity> filmsSet = new HashSet<FilmEntity>();
}
