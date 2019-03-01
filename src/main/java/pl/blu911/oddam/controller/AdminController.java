package pl.blu911.oddam.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserServiceImpl userService;

    public AdminController(UserServiceImpl userService) {
        this.userService = userService;
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

        return "redirect:/admin/admins";
    }


    @GetMapping("/users")
    public String adminUsers() {
        return "/admin/admin-users";
    }

    @GetMapping("/institutions")
    public String adminInstitution() {
        return "/admin/admin-institutions";
    }

    @GetMapping("/donations")
    public String admins() {
        return "/admin/admin-donations";
    }
}
