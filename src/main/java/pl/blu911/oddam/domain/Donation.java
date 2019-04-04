package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
    @ManyToMany
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    private LocalTime pickUpTime;

    private int pickUpPhoneNumber;
    private String pickUpComment;

    private LocalDateTime created;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

    private LocalDateTime deliveryDate;

    private Boolean deliveryStatus = false;
}
