package pl.blu911.oddam.domain.dto;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.Category;
import pl.blu911.oddam.domain.User;

import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Data
//@ToString(exclude = {"userDetails", "institutionDetails", "whatToDonate", "pickUpAddress"})
public class DonationDto {

    private List<Category> whatToDonate;

    private int quantity;

    private User institutionDetails;

    private User userDetails;

    private Address pickUpAddress;

    private String pickUpDate;

    private LocalTime pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;
}
