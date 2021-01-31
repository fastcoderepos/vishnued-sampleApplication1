package com.fastcode.dvdrental.domain.core.authorization.role;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.authorization.rolepermission.RolepermissionEntity;
import com.fastcode.dvdrental.domain.core.authorization.userrole.UserroleEntity;
import java.time.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "role")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class RoleEntity extends AbstractEntity {

    @Basic
    @Column(name = "display_name", nullable = false, length = 255)
    private String displayName;

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
    private Set<RolepermissionEntity> rolepermissionsSet = new HashSet<RolepermissionEntity>();

    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
    private Set<UserroleEntity> userrolesSet = new HashSet<UserroleEntity>();
}
