package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.service.impl.DonationServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/app")
public class MyDonationsController {

    private final DonationServiceImpl donationService;

    public MyDonationsController(DonationServiceImpl donationService) {
        this.donationService = donationService;
    }

    @GetMapping("/donations")
    public String myDonations(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        List<Donation> donations = donationService.findAllByUserId(customUser.getUser().getId());
        System.out.println(donations.toString());
        model.addAttribute("donations", donations);
        return "/app/app-my-donations";
    }

}
