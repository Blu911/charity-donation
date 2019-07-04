package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Donation;

import java.util.List;
import java.util.Map;

public interface DonationService {

    void saveDonation(Donation donation);

    List<Donation> findAll();
}
