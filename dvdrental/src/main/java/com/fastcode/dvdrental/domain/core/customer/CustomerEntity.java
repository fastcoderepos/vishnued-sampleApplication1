package com.fastcode.dvdrental.domain.core.customer;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.address.AddressEntity;
import com.fastcode.dvdrental.domain.core.payment.PaymentEntity;
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
@Table(name = "customer")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class CustomerEntity extends AbstractEntity {

    @Basic
    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;

    @Basic
    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id", nullable = false)
    private Integer customerId;

    @Basic
    @Column(name = "active", nullable = true)
    private Integer active;

    @Basic
    @Column(name = "activebool", nullable = false)
    private Boolean activebool;

    @Basic
    @Column(name = "store_id", nullable = false)
    private Short storeId;

    @Basic
    @Column(name = "email", nullable = true, length = 50)
    private String email;

    @ManyToOne
    @JoinColumn(name = "address_id")
    private AddressEntity address;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private Set<PaymentEntity> paymentsSet = new HashSet<PaymentEntity>();

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private Set<RentalEntity> rentalsSet = new HashSet<RentalEntity>();
}
