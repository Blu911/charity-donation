package pl.blu911.oddam.controller.admin;

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

import java.util.List;

@Controller
@RequestMapping("/admin")
public class DonationsController {

    private final DonationServiceImpl donationService;

    public DonationsController(DonationServiceImpl donationService) {
        this.donationService = donationService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("currentUser", currentUser);
    }

    //DONATIONS MANAGEMENT ACTIONS
    @GetMapping("/donations")
    public String adminDonations(Model model) {
        List<Donation> donationList = donationService.findAll();
        model.addAttribute("donationList", donationList);
        return "/admin/admin-donations";
    }

    @GetMapping("/donations/view/{id}")
    public String viewDonation(@PathVariable long id, Model model) {
        Donation donationToView = donationService.findByDonationId(id);
        model.addAttribute("donation", donationToView);
        return "admin/donations/donation-view";
    }
}
