package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.*;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.service.impl.CategoryServiceImpl;
import pl.blu911.oddam.service.impl.DonationServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;


import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/app")
public class FormController {

    private final UserServiceImpl userService;
    private final CategoryServiceImpl categoryService;
    private final DonationServiceImpl donationService;

    public FormController(UserServiceImpl userService, CategoryServiceImpl categoryService, DonationServiceImpl donationService) {
        this.userService = userService;
        this.categoryService = categoryService;
        this.donationService = donationService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("/form")
    public String appFormStep1(Model model) {

        model.addAttribute("donation", new DonationDto());

        model.addAttribute("helpsWho", categoryService.findByParentId(2l));
        model.addAttribute("whatToDonate", categoryService.findByParentId(4l));

        List<User> institutionList = userService.findAllByRole("ROLE_INSTITUTION");
        model.addAttribute("institutions", userService.findAllByRole("ROLE_INSTITUTION"));

        List<Address> addressList = new ArrayList<>();
        institutionList.forEach(item -> addressList.addAll(item.getAddresses()));
        model.addAttribute("institutionAddresses", addressList);

        return "app/form";
    }

    //TODO: save donation to DB together with current user details

    @PostMapping("/form")
    public String appFormStep1(@ModelAttribute DonationDto donationDto, @AuthenticationPrincipal CurrentUser customUser) {
        System.out.println(donationDto.toString());
        User user = userService.findByUserId(customUser.getUser().getId());
        donationService.saveDonationFromDto(donationDto, user);

        return "redirect:/app";
    }

}

