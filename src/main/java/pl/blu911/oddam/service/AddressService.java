package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.User;

import java.util.List;

public interface AddressService {
    Address findById(Long id);

    void saveAddress(Address address, User currentUser);

    void updateAddress(Address address, User currentUser);

    List<Address> getInstitutionsAdresses(List<User> institutionList);

    void deleteAddressById(Long id);
}
