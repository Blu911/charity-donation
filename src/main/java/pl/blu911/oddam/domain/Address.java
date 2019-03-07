package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

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
    private String street;
    private String city;
    private String zipCode;

    @ManyToMany(mappedBy = "addresses", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<User> users;

}
