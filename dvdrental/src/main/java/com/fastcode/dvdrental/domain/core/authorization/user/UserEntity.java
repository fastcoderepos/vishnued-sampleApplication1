package com.fastcode.dvdrental.domain.core.authorization.user;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.authorization.tokenverification.TokenverificationEntity;
import com.fastcode.dvdrental.domain.core.authorization.userpermission.UserpermissionEntity;
import com.fastcode.dvdrental.domain.core.authorization.userpreference.UserpreferenceEntity;
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
@Table(name = "f_user")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class UserEntity extends AbstractEntity {

    @Basic
    @Column(name = "last_name", nullable = false, length = 32)
    private String lastName;

    @Basic
    @Column(name = "user_name", nullable = false, length = 32)
    private String userName;

    @Basic
    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Basic
    @Column(name = "first_name", nullable = false, length = 32)
    private String firstName;

    @Basic
    @Column(name = "password", nullable = false, length = 128)
    private String password;

    @Basic
    @Column(name = "email_address", nullable = false, length = 256)
    private String emailAddress;

    @Basic
    @Column(name = "phone_number", nullable = true, length = 32)
    private String phoneNumber;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Basic
    @Column(name = "is_email_confirmed", nullable = true)
    private Boolean isEmailConfirmed;

    @OneToOne(mappedBy = "user", cascade = CascadeType.MERGE)
    private UserpreferenceEntity userpreference;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserpermissionEntity> userpermissionsSet = new HashSet<UserpermissionEntity>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<TokenverificationEntity> tokenverificationsSet = new HashSet<TokenverificationEntity>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<UserroleEntity> userrolesSet = new HashSet<UserroleEntity>();
}
