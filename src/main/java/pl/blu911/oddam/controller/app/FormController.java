package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.*;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.service.impl.AddressServiceImpl;
import pl.blu911.oddam.service.impl.CategoryServiceImpl;
import pl.blu911.oddam.service.impl.DonationServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/app/form")
public class FormController {

    private final UserServiceImpl userService;
    private final CategoryServiceImpl categoryService;
    private final DonationServiceImpl donationService;
    private final AddressServiceImpl addressService;

    public FormController(UserServiceImpl userService, CategoryServiceImpl categoryService, DonationServiceImpl donationService, AddressServiceImpl addressService) {
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

