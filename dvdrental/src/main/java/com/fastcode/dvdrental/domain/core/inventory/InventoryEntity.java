package com.fastcode.dvdrental.domain.core.inventory;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.film.FilmEntity;
import com.fastcode.dvdrental.domain.core.rental.RentalEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "inventory")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class InventoryEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "inventory_id", nullable = false)
    private Integer inventoryId;

    @Basic
    @Column(name = "store_id", nullable = false)
    private Short storeId;

    @ManyToOne
    @JoinColumn(name = "film_id")
    private FilmEntity film;

    @OneToMany(mappedBy = "inventory", cascade = CascadeType.ALL)
    private Set<RentalEntity> rentalsSet = new HashSet<RentalEntity>();
}
