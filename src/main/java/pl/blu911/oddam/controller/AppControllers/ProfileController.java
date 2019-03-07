package pl.blu911.oddam.controller.AppControllers;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.AddressServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping("/app")
public class ProfileController {

    private final UserServiceImpl userService;
    private final AddressServiceImpl addressService;

    public ProfileController(UserServiceImpl userService, AddressServiceImpl addressService) {
        this.userService = userService;
        this.addressService = addressService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("/profile")
    public String appProfile() {
        return "app/app-profile";
    }

    @GetMapping("/profile/edit")
    public String appEditProfile() {
        return "app/profile/profile-edit";
    }

    @PostMapping("/profile/edit")
    public String appEditProfileSuccess(@AuthenticationPrincipal CurrentUser currentUser, @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "app/app-profile-edit";
        }
        userService.updateUser(currentUser, user);
        return "redirect:/app/profile";
    }

    @GetMapping("/profile/edit/{id}")
    public String appEditAddress(@PathVariable long id, Model model) {
        Address address = addressService.findById(id);
        model.addAttribute("address", address);
        return "app/profile/profile-edit-address";
    }

    @PostMapping("/profile/edit/{id}")
    public String appEditAddressSuccess(@Valid Address address, BindingResult result, @PathVariable long id) {
        if (result.hasErrors()) {
            return "app/app-profile-edit-address";
        }
        addressService.updateAddress(address);
        return "redirect:/app/profile";
    }
}
