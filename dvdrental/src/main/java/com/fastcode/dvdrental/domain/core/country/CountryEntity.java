package com.fastcode.dvdrental.domain.core.country;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.city.CityEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "country")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class CountryEntity extends AbstractEntity {

    @Basic
    @Column(name = "country", nullable = false, length = 50)
    private String country;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "country_id", nullable = false)
    private Integer countryId;

    @OneToMany(mappedBy = "country", cascade = CascadeType.ALL)
    private Set<CityEntity> citysSet = new HashSet<CityEntity>();
}
