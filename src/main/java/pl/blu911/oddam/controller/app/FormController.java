package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.*;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.service.AddressService;
import pl.blu911.oddam.service.CategoryService;
import pl.blu911.oddam.service.DonationService;
import pl.blu911.oddam.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/app/form")
public class FormController {

    private final UserService userService;
    private final CategoryService categoryService;
    private final DonationService donationService;
    private final AddressService addressService;

    public FormController(UserService userService, CategoryService categoryService, DonationService donationService, AddressService addressService) {
        this.userService = userService;
        this.categoryService = categoryService;
        this.donationService = donationService;
        this.addressService = addressService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("")
    public String appFormStep1(Model model) {

        model.addAttribute("donation", new DonationDto());

        model.addAttribute("helpsWho", categoryService.findByParentId(2l));
        model.addAttribute("whatToDonate", categoryService.findByParentId(4l));

        List<User> institutionList = userService.findAllByRole("ROLE_INSTITUTION");
        model.addAttribute("institutions", userService.findAllByRole("ROLE_INSTITUTION"));

        List<Address> institutionsAdresses = addressService.getInstitutionsAdresses(institutionList);
        model.addAttribute("institutionAddresses", institutionsAdresses);

        return "app/form";
    }

    @PostMapping("")
    public String appFormStep1(@ModelAttribute DonationDto donationDto, @AuthenticationPrincipal CurrentUser customUser) {
        User user = userService.findByUserId(customUser.getUser().getId());
        donationService.saveDonationFromDto(donationDto, user);
        return "redirect:/app";
    }

}

