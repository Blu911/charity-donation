package pl.blu911.oddam.service.impl;


import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.repository.AddressRepository;
import pl.blu911.oddam.repository.DonationRepository;
import pl.blu911.oddam.service.DonationService;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;


@Service
public class DonationServiceImpl implements DonationService {
    private final DonationRepository donationRepository;
    private final AddressRepository addressRepository;

    public DonationServiceImpl(DonationRepository donationRepository, AddressRepository addressRepository) {
        this.donationRepository = donationRepository;
        this.addressRepository = addressRepository;
    }

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    public List<Donation> findAllByInstitutionId(long id) {
        return donationRepository.findAllByInstitutionDetailsId(id);
    }

    public List<Donation> findAllByUserId(long id) {
        return donationRepository.findAllByUserDetailsId(id);
    }

    public Donation findByDonationId(Long id) {
        return donationRepository.getOne(id);
    }

    @Override
    public void saveDonation(Donation donation) {
        donationRepository.save(donation);
    }

    public void saveDonationFromDto(DonationDto donationDto, User user) {
        Donation donation = new Donation();

        donation.setCreated(LocalDateTime.now());
        donation.setQuantity(donationDto.getQuantity());
        donation.setWhatToDonate(donationDto.getWhatToDonate());
        donation.setInstitutionDetails(donationDto.getInstitutionDetails());
        donation.setPickUpComment(donationDto.getPickUpComment());
        donation.setPickUpPhoneNumber(donationDto.getPickUpPhoneNumber());

        addressRepository.save(donationDto.getPickUpAddress());
        donation.setPickUpAddress(donationDto.getPickUpAddress());

        donation.setUserDetails(user);

        LocalDate date = LocalDate.parse(donationDto.getPickUpDate());
        donation.setPickUpDate(date);

        LocalTime time = LocalTime.parse(donationDto.getPickUpTime());
        donation.setPickUpTime(time);

        donationRepository.save(donation);
    }

    public void confirmDonationCollection(long id) {
        Donation donation = donationRepository.getOne(id);
        donation.setDeliveryStatus(true);
        donation.setDeliveryDate(LocalDateTime.now());
        donationRepository.save(donation);
    }
}
