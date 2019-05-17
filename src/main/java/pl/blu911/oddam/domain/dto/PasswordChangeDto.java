package pl.blu911.oddam.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PasswordChangeDto {

    @NotBlank
    private String passwordNew;
    @NotBlank
    private String passwordNewConfirm;
}
