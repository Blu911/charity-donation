package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.dto.DonationDto;

import java.util.List;
import java.util.Map;

public interface DonationService {

    void saveDonation(Donation donation);

    void saveDonationFromDto(DonationDto donationDto, User user);

    void confirmDonationCollection(long id);

    List<Donation> findAll();

    List<Donation> findAllByUserId(long id);

    Donation findByDonationId(Long id);
}
