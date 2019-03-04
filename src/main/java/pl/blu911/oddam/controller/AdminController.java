package pl.blu911.oddam.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.DonationServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserServiceImpl userService;
    private final DonationServiceImpl donationService;

    public AdminController(UserServiceImpl userService, DonationServiceImpl donationService) {
        this.userService = userService;
        this.donationService = donationService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("")
    public String adminPanel(Model model) {
        int adminCount = userService.findAllByRole("ROLE_ADMIN").size();
        int userCount = userService.findAllByRole("ROLE_USER").size();
        int institutionCount = userService.findAllByRole("ROLE_INSTITUTION").size();
        int donationCount = donationService.findAll().size();
        model.addAttribute("adminCount", adminCount);
        model.addAttribute("userCount", userCount);
        model.addAttribute("institutionCount", institutionCount);
        model.addAttribute("donationCount", donationCount);

        return "/admin/admin-panel";
    }

}
