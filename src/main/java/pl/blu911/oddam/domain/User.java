package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@Table(name = "users")
@ToString(exclude = {"userAddress", "userDonations"})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Email
    private String email;
    @NotBlank
    private String password;
    private String userFirstName;
    private String userLastName;
    private String institutionName;
    @ManyToOne
    private Category institutionType;
    private int phoneNumber;

    @OneToMany
    private List<Address> userAddress;
    @OneToMany
    private List<Donation> userDonations;

    private LocalDateTime created;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }


}
