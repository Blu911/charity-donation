package pl.blu911.oddam.service.impl;


import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.repository.DonationRepository;
import pl.blu911.oddam.repository.UserRepository;
import pl.blu911.oddam.service.DonationService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class DonationServiceImpl implements DonationService {
    private final UserRepository userRepository;
    private final DonationRepository donationRepository;

    public DonationServiceImpl(UserRepository userRepository, DonationRepository donationRepository) {
        this.userRepository = userRepository;
        this.donationRepository = donationRepository;
    }

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    public List<Donation> findAllByInstitutionId(long id) {
        return donationRepository.findAllByInstitutionDetailsId(id);
    }

    public Donation findByDonationId(Long id) {
        return donationRepository.getOne(id);
    }

    @Override
    public void saveDonation(Donation donation) {
        donationRepository.save(donation);
    }

    public void saveDonationFromDto(DonationDto donationDto, CurrentUser currentUser) {
        User user = userRepository.getOne(currentUser.getUser().getId());

        Donation donation = new Donation();

        donation.setCreated(LocalDateTime.now());
        donation.setQuantity(donationDto.getQuantity());
        donation.setWhatToDonate(donationDto.getWhatToDonate());
        donation.setInstitutionDetails(donationDto.getInstitutionDetails());


        donation.setPickUpAddress(donationDto.getPickUpAddress());

    }

}
