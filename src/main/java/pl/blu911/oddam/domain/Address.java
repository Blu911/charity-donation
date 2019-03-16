package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.transaction.Transactional;
import javax.validation.constraints.NotEmpty;

@Data
@Entity
@NoArgsConstructor
@Table(name = "addresses")
@Transactional
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int houseNumber;
    private int flatNumber;
    @NotEmpty
    private String street;
    @NotEmpty
    private String city;
    @NotEmpty
    private String zipCode;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
