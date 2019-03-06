package pl.blu911.oddam.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.Address;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    private final UserServiceImpl userService;

    public AppController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @GetMapping("")
    public String appPanel() {
        return "/app/app";
    }

    @GetMapping("/profile")
    public String appProfile() {
        return "app/app-profile";
    }

    @GetMapping("/profile/edit")
    public String appEditProfile(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User user = userService.findByUserId(currentUser.getUser().getId());
        List<Address> userAddresses = user.getAddresses();
        model.addAttribute("userAddresses", userAddresses);
        return "app/app-profile-edit";
    }

    @PostMapping("/profile/edit")
    public String appEditProfileSuccess(@AuthenticationPrincipal CurrentUser currentUser, @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "app/app-profile-edit";
        }
        userService.updateUser(currentUser, user);
        return "redirect:/app/profile";
    }

}
