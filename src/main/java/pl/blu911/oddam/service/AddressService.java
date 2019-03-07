package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Address;

import javax.validation.Valid;

public interface AddressService {
    Address findById(Long id);

    void saveAddress(Address address);

    void updateAddress(@Valid Address address);
}
