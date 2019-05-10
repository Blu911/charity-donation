package pl.blu911.oddam.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.registration.ConfirmationToken;

import pl.blu911.oddam.service.impl.ConfirmationTokenServiceImpl;
import pl.blu911.oddam.service.impl.EmailSenderServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserAccountController {

    private final UserServiceImpl userService;
    private final ConfirmationTokenServiceImpl tokenService;
    private final EmailSenderServiceImpl emailSenderService;

    public UserAccountController(UserServiceImpl userService,
                                 ConfirmationTokenServiceImpl tokenService,
                                 EmailSenderServiceImpl emailSenderService) {
        this.userService = userService;
        this.tokenService = tokenService;
        this.emailSenderService = emailSenderService;
    }

    @GetMapping("/register")
    public String displayRegistration(@ModelAttribute User user) {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {
        String view;
        User existingUser = userService.findByUserEmail(user.getEmail());

        if (existingUser != null) {
            model.addAttribute("message", "Ten adres e-mail jest już zarejestrowany!");
            view = "register-error";
        } else {
            userService.saveUser(user, "ROLE_USER");
            ConfirmationToken token = tokenService.generateToken(user);
            tokenService.saveToken(token);
            emailSenderService.sendEmail(user, token);

            model.addAttribute("email", user.getEmail());
            view = "register-success";
        }
        return view;
    }

    @GetMapping("/register/confirm-account")
    public String confirmUserAccount(@RequestParam("token") String confirmationToken, Model model) {
        ConfirmationToken token = tokenService.findByConfirmationToken(confirmationToken);
        String view;
        if (token != null) {
            User user = userService.findByUserEmail(token.getUser().getEmail());
            userService.lockAndUnlockUserById(user.getId(), true);
            view = "register-verified";
        } else {
            model.addAttribute("message", "Link aktywacyjny jest uszkodzony lub wygasł!");
            view = "register-error";
        }
        return view;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login";
    }

    @GetMapping("/default")
    public String defaultAfterLogin(HttpServletRequest request) {
        if (request.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/admin";
        }
        return "redirect:/app";
    }
}
