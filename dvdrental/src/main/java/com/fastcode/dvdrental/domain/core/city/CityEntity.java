package com.fastcode.dvdrental.domain.core.city;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.address.AddressEntity;
import com.fastcode.dvdrental.domain.core.country.CountryEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "city")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class CityEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id", nullable = false)
    private Integer cityId;

    @Basic
    @Column(name = "city", nullable = false, length = 50)
    private String city;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private CountryEntity country;

    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
    private Set<AddressEntity> addressSet = new HashSet<AddressEntity>();
}
