package com.fastcode.dvdrental.domain.core.rental;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.customer.CustomerEntity;
import com.fastcode.dvdrental.domain.core.inventory.InventoryEntity;
import com.fastcode.dvdrental.domain.core.payment.PaymentEntity;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import java.time.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "rental")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class RentalEntity extends AbstractEntity {

    @Basic
    @Column(name = "rental_date", nullable = true)
    @Temporal(TemporalType.DATE)
    private Date rentalDate;

    @Basic
    @Column(name = "return_date", nullable = true)
    @Temporal(TemporalType.DATE)
    private Date returnDate;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_id", nullable = false)
    private Integer rentalId;

    @OneToMany(mappedBy = "rental", cascade = CascadeType.ALL)
    private Set<PaymentEntity> paymentsSet = new HashSet<PaymentEntity>();

    @ManyToOne
    @JoinColumn(name = "staff_id")
    private StaffEntity staff;

    @ManyToOne
    @JoinColumn(name = "inventory_id")
    private InventoryEntity inventory;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private CustomerEntity customer;
}
