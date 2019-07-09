package pl.blu911.oddam.controller.admin;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.DonationService;
import pl.blu911.oddam.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class InstitutionsController {

    private final UserService userService;
    private final DonationService donationService;

    public InstitutionsController(UserService userService, DonationService donationService) {
        this.userService = userService;
        this.donationService = donationService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("currentUser", currentUser);
    }


    //INSTITUTIONS MANAGEMENT ACTIONS

    @GetMapping("/institutions")
    public String adminInstitution(Model model) {
        List<User> institutionList = userService.findAllByRole("ROLE_INSTITUTION");
        model.addAttribute("institutionList", institutionList);
        return "/admin/admin-institutions";
    }

    @GetMapping("/institutions/add")
    public String addInstitution(@ModelAttribute User user) {
        return "admin/institutions/institution-add";
    }

    @PostMapping("/institutions/add")
    public String addInstitutionSuccess(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/institutions/institution-add";
        }
        userService.saveUser(user, "ROLE_INSTITUTION");
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institutions/view/{id}")
    public String viewInstitution(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        int nrOfDonations = donationService.findAllByInstitutionId(id).size();
        model.addAttribute("nrOfDonations", nrOfDonations);

        return "admin/institutions/institution-view";
    }

    @GetMapping("/institutions/edit/{id}")
    public String editInstitution(@PathVariable long id, Model model) {
        User userToEdit = userService.findByUserId(id);
        model.addAttribute("user", userToEdit);
        return "admin/institutions/institution-edit";
    }

    @PostMapping("/institutions/edit/{id}")
    public String editInstitutionSuccess(@Valid User user, BindingResult result, @PathVariable long id) {
        if (result.hasErrors()) {
            return "admin/institutions/institution-edit";
        }
        userService.updateUser(user);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institutions/delete/{id}")
    public String removeInstitution(@PathVariable Long id, Model model) {
        User institutionToDelete = userService.findByUserId(id);
        model.addAttribute("user", institutionToDelete);
        return "admin/institutions/institution-delete";
    }

    @PostMapping("/institutions/delete/{id}")
    public String removeInstitutionSuccess(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/institutions";
    }

}
