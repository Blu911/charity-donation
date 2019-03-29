package pl.blu911.oddam.domain.dto;

import lombok.Data;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.Category;
import pl.blu911.oddam.domain.User;

import java.util.List;

@Data
public class DonationDto {

    private List<Category> whatToDonate;

    private int quantity;

    private User institutionDetails;

    private Address pickUpAddress;

    private String pickUpDate;

    private String pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;
}
