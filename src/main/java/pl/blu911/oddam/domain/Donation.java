package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;

@Data
@Entity
@NoArgsConstructor
@Table(name = "donations")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Category type;
    @NotNull
    private int quantity;
    @ManyToOne
    private User institutionDetails;
    @ManyToOne
    private User userDetails;

    @NotBlank
    private int pickUpHouseNumber;
    private int pickUpFlatNumber;
    @NotBlank
    private String pickUpStreet;
    @NotBlank
    private String pickUpCity;
    @NotBlank
    private int pickUpZipCode;
    @NotBlank
    private LocalDate pickUpDate;
    @NotBlank
    private LocalTime pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;

}
