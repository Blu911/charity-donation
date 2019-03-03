package pl.blu911.oddam.service.impl;


import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.repository.DonationRepository;
import pl.blu911.oddam.repository.UserRepository;
import pl.blu911.oddam.service.DonationService;

import java.util.List;

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

    public Donation findByDonationId(Long id) {
        return donationRepository.getOne(id);
    }

    @Override
    public void saveDonation(Donation donation) {
        donationRepository.save(donation);
    }

}
