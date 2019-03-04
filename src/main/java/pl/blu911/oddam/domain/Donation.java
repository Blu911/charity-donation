package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@Table(name = "donations")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "donations_type", joinColumns = @JoinColumn(name = "donations_id"),
            inverseJoinColumns = @JoinColumn(name = "categories_id"))
    private List<Category> whatToDonate;

    private int quantity;

    @ManyToOne
    private User institutionDetails;

    @ManyToOne
    private User userDetails;

    @ManyToOne
    private Address pickUpAddress;

    private LocalDate pickUpDate;

    private LocalTime pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;

}
