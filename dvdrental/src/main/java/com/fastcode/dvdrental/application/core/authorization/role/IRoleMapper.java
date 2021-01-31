package com.fastcode.dvdrental.application.core.authorization.role;

import com.fastcode.dvdrental.application.core.authorization.role.dto.*;
import com.fastcode.dvdrental.domain.core.authorization.role.RoleEntity;
import java.time.*;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IRoleMapper {
    RoleEntity createRoleInputToRoleEntity(CreateRoleInput roleDto);
    CreateRoleOutput roleEntityToCreateRoleOutput(RoleEntity entity);

    RoleEntity updateRoleInputToRoleEntity(UpdateRoleInput roleDto);

    UpdateRoleOutput roleEntityToUpdateRoleOutput(RoleEntity entity);

    FindRoleByIdOutput roleEntityToFindRoleByIdOutput(RoleEntity entity);

    FindRoleByNameOutput roleEntityToFindRoleByNameOutput(RoleEntity entity);
}
