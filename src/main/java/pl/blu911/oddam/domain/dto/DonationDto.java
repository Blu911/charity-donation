package pl.blu911.oddam.domain.dto;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.Category;
import pl.blu911.oddam.domain.User;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Data
//@ToString(exclude = {"userDetails", "institutionDetails", "whatToDonate", "pickUpAddress"})
public class DonationDto {
    @NotNull
    @NotBlank
    @NotEmpty
    private List<Category> whatToDonate;
    @NotNull
    private int quantity;
    @NotNull
    @NotBlank
    @NotEmpty
    private User institutionDetails;

    private User userDetails;
    @NotNull
    @NotBlank
    @NotEmpty
    private Address pickUpAddress;

    private String pickUpDate;
    @NotNull
    @NotBlank
    @NotEmpty
    private LocalTime pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;
}
