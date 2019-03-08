package pl.blu911.oddam.service.impl;

import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.repository.AddressRepository;
import pl.blu911.oddam.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {
    private final AddressRepository addressRepository;

    public AddressServiceImpl(AddressRepository addressRepository) {
        this.addressRepository = addressRepository;
    }

    @Override
    public Address findById(Long id) {
        return addressRepository.getOne(id);
    }

    @Override
    public void saveAddress(Address address, User currentUser) {
        address.setUser(currentUser);
        addressRepository.saveAndFlush(address);
    }

    @Override
    public void updateAddress(Address address, User currentUser) {
        Address addressToUpdate = addressRepository.getOne(address.getId());
        addressToUpdate.setFlatNumber(address.getFlatNumber());
        addressToUpdate.setHouseNumber(address.getHouseNumber());
        addressToUpdate.setStreet(address.getStreet());
        addressToUpdate.setCity(address.getCity());
        addressToUpdate.setZipCode(address.getZipCode());
        saveAddress(addressToUpdate, currentUser);
    }

    public void deleteAddressById(Long id) {
        addressRepository.deleteById(id);
    }
}
