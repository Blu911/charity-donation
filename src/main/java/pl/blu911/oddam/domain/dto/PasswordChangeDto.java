package pl.blu911.oddam.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotBlank;


@Data
@AllArgsConstructor
public class PasswordChangeDto {

    @NotBlank
    private String passwordNew;
    @NotBlank
    private String passwordNewConfirm;
}
