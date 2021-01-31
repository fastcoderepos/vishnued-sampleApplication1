package com.fastcode.dvdrental.domain.core.filmactor;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.actor.ActorEntity;
import com.fastcode.dvdrental.domain.core.film.FilmEntity;
import java.time.*;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "film_actor")
@IdClass(FilmActorId.class)
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class FilmActorEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "actor_id", nullable = false)
    private Integer actorId;

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "film_id", nullable = false)
    private Integer filmId;

    @ManyToOne
    @JoinColumn(name = "actor_id", insertable = false, updatable = false)
    private ActorEntity actor;

    @ManyToOne
    @JoinColumn(name = "film_id", insertable = false, updatable = false)
    private FilmEntity film;
}
