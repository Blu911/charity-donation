package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.User;

public interface AddressService {
    Address findById(Long id);

    void saveAddress(Address address, User currentUser);

    void updateAddress(Address address, User currentUser);
}
