package pl.blu911.oddam.controller;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping("/app")
public class AppController {

    private final UserServiceImpl userService;

    public AppController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
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
    public String appEditProfile(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("user", currentUser);
        return "app/app-profile-edit";
    }

    @PostMapping("/profile/edit")
    public String appEditProfileSuccess(@AuthenticationPrincipal CurrentUser currentUser, @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "app/app-profile-edit";
        }
        System.out.println(user);
        System.out.println(currentUser);
        userService.updateUser(currentUser, user);
        return "redirect:/app/profile";
    }

}
