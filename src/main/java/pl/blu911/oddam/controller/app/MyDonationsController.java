package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.DonationServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/app")
public class MyDonationsController {

    private final DonationServiceImpl donationService;
    private final UserServiceImpl userService;

    public MyDonationsController(DonationServiceImpl donationService, UserServiceImpl userService) {
        this.donationService = donationService;
        this.userService = userService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("/donations")
    public String myDonations(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        List<Donation> donations = donationService.findAllByUserId(customUser.getUser().getId());
        System.out.println(donations.toString());
        model.addAttribute("donations", donations);
        return "/app/app-my-donations";
    }

    @GetMapping("/donations/view/{id}")
    public String viewDonation(@PathVariable long id, Model model) {
        Donation donation = donationService.findByDonationId(id);
        model.addAttribute("donation", donation);
        return "/app/donations/donation-view";
    }

}
