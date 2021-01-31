package com.fastcode.dvdrental.application.core.staff;

import com.fastcode.dvdrental.application.core.staff.dto.*;
import com.fastcode.dvdrental.domain.core.address.AddressEntity;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import java.time.*;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(componentModel = "spring")
public interface IStaffMapper {
    StaffEntity createStaffInputToStaffEntity(CreateStaffInput staffDto);

    @Mappings(
        {
            @Mapping(source = "entity.address.addressId", target = "addressId"),
            @Mapping(source = "entity.address.addressId", target = "addressDescriptiveField"),
        }
    )
    CreateStaffOutput staffEntityToCreateStaffOutput(StaffEntity entity);

    StaffEntity updateStaffInputToStaffEntity(UpdateStaffInput staffDto);

    @Mappings(
        {
            @Mapping(source = "entity.address.addressId", target = "addressId"),
            @Mapping(source = "entity.address.addressId", target = "addressDescriptiveField"),
        }
    )
    UpdateStaffOutput staffEntityToUpdateStaffOutput(StaffEntity entity);

    @Mappings(
        {
            @Mapping(source = "entity.address.addressId", target = "addressId"),
            @Mapping(source = "entity.address.addressId", target = "addressDescriptiveField"),
        }
    )
    FindStaffByIdOutput staffEntityToFindStaffByIdOutput(StaffEntity entity);

    @Mappings(
        {
            @Mapping(source = "address.address", target = "address"),
            @Mapping(source = "foundStaff.staffId", target = "staffStaffId"),
        }
    )
    GetAddressOutput addressEntityToGetAddressOutput(AddressEntity address, StaffEntity foundStaff);
}
