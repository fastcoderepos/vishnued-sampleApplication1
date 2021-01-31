package com.fastcode.dvdrental.domain.core.address;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.city.CityEntity;
import com.fastcode.dvdrental.domain.core.customer.CustomerEntity;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import com.fastcode.dvdrental.domain.core.store.StoreEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "address")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class AddressEntity extends AbstractEntity {

    @Basic
    @Column(name = "address", nullable = false, length = 50)
    private String address;

    @Basic
    @Column(name = "address2", nullable = true, length = 50)
    private String address2;

    @Basic
    @Column(name = "phone", nullable = false, length = 20)
    private String phone;

    @Basic
    @Column(name = "district", nullable = false, length = 20)
    private String district;

    @Basic
    @Column(name = "postal_code", nullable = true, length = 10)
    private String postalCode;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id", nullable = false)
    private Integer addressId;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private CityEntity city;

    @OneToMany(mappedBy = "address", cascade = CascadeType.ALL)
    private Set<StaffEntity> staffsSet = new HashSet<StaffEntity>();

    @OneToMany(mappedBy = "address", cascade = CascadeType.ALL)
    private Set<StoreEntity> storesSet = new HashSet<StoreEntity>();

    @OneToMany(mappedBy = "address", cascade = CascadeType.ALL)
    private Set<CustomerEntity> customersSet = new HashSet<CustomerEntity>();
}
