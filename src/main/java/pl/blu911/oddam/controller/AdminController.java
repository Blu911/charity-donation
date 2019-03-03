package pl.blu911.oddam.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Donation;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.DonationServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;

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
    public String adminPanel() {
        return "/admin/admin-panel";
    }

//ADMIN MANAGEMENT ACTIONS

    @GetMapping("/admins")
    public String adminAdmins(Model model) {
        List<User> adminList = userService.findAllByRole("ROLE_ADMIN");
        model.addAttribute("adminList", adminList);
        return "/admin/admin-admins";
    }

    @GetMapping("/admins/add")
    public String addAdmin(@ModelAttribute User user) {
        return "admin/admins/admin-add";
    }

    @PostMapping("/admins/add")
    public String addAdminSuccess(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/admins/admin-add";
        }
        userService.saveUser(user, "ROLE_ADMIN");
        return "redirect:/admin/admins";
    }

    @GetMapping("/admins/view/{id}")
    public String viewAdmin(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        return "admin/admins/admin-view";
    }

    @GetMapping("/admins/edit/{id}")
    public String editAdmin(@PathVariable long id, Model model) {
        User userToEdit = userService.findByUserId(id);
        model.addAttribute("user", userToEdit);
        return "admin/admins/admin-edit";
    }

    @PostMapping("/admins/edit/{id}")
    public String editAdminSuccess(@Valid User user, BindingResult result, @PathVariable long id) {
        if (result.hasErrors()) {
            return "admin/admins/admin-edit";
        }
        userService.updateUser(user);
        return "redirect:/admin/admins";
    }

    @GetMapping("/admins/delete/{id}")
    public String removeAdmin(@PathVariable Long id, Model model) {
        User userToDelete = userService.findByUserId(id);
        model.addAttribute("user", userToDelete);
        return "admin/admins/admin-delete";
    }

    @PostMapping("/admins/delete/{id}")
    public String removeAdminSuccess(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/admins";
    }

//USER MANAGEMENT ACTIONS

    @GetMapping("/users")
    public String adminUsers(Model model) {
        List<User> userList = userService.findAllByRole("ROLE_USER");
        model.addAttribute("userList", userList);
        return "/admin/admin-users";
    }

    @GetMapping("/users/view/{id}")
    public String viewUser(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        return "admin/users/user-view";
    }

    @GetMapping("/users/edit/{id}")
    public String editUser(@PathVariable long id, Model model) {
        User userToEdit = userService.findByUserId(id);
        model.addAttribute("user", userToEdit);
        return "admin/users/user-edit";
    }

    @PostMapping("/users/edit/{id}")
    public String editUserSuccess(@Valid User user, BindingResult result, @PathVariable long id) {
        if (result.hasErrors()) {
            return "admin/users/user-edit";
        }
        userService.updateUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/block/{id}")
    public String lockUser(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        return "admin/users/user-block";
    }

    @PostMapping("/users/block/{id}")
    public String lockUserSuccess(@PathVariable long id) {
        User userToBlock = userService.findByUserId(id);
        if (userToBlock.getEnabled() == 1) {
            userService.lockAndUnlockUserById(id, 0);
        } else {
            userService.lockAndUnlockUserById(id, 1);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/users/delete/{id}")
    public String removeUser(@PathVariable Long id, Model model) {
        User userToDelete = userService.findByUserId(id);
        model.addAttribute("user", userToDelete);
        return "admin/users/user-delete";
    }

    @PostMapping("/users/delete/{id}")
    public String removeUserSuccess(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/users";
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

    //DONATIONS MANAGEMENT ACTIONS
    @GetMapping("/donations")
    public String adminDonations(Model model) {
        List<Donation> donationList = donationService.findAll();
        model.addAttribute("donationList", donationList);
        return "/admin/admin-donations";
    }
}
