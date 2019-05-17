package pl.blu911.oddam.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.ConfirmationToken;

import pl.blu911.oddam.domain.dto.PasswordChangeDto;
import pl.blu911.oddam.service.impl.ConfirmationTokenServiceImpl;
import pl.blu911.oddam.service.impl.EmailSenderServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

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
            emailSenderService.sendActivationEmail(user, token);

            model.addAttribute("email", user.getEmail());
            view = "register-success";
        }
        return view;
    }

    @RequestMapping(value = "/register/confirm-account", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmUserAccount(@RequestParam("token") String confirmationToken, Model model) {
        ConfirmationToken token = tokenService.findByConfirmationToken(confirmationToken);
        String view;
        if (token != null && !token.getUser().isEnabled()) {
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

    @GetMapping("/reset-password")
    public String resetPassword(@ModelAttribute User user) {
        return "reset-password";
    }

    @PostMapping("/reset-password")
    public String resetPasswordSent(@ModelAttribute User user, Model model) {
        User userToResetPassword = userService.findByUserEmail(user.getEmail());
        String view;
        if (userToResetPassword == null) {
            model.addAttribute("message", "Podany adres e-mail jest niepoprawny!");
            view = "reset-password-error";
        } else {
            ConfirmationToken token = new ConfirmationToken(userToResetPassword);
            tokenService.saveToken(token);
            emailSenderService.sendResetPasswordEmail(userToResetPassword, token);

            model.addAttribute("email", userToResetPassword.getEmail());
            view = "reset-password-send";
        }
        return view;
    }

    @GetMapping("/reset-password/confirm")
    public String resetPasswordForm(@RequestParam("token") String confirmationToken,
                                    Model model) {
        ConfirmationToken token = tokenService.findByConfirmationToken(confirmationToken);
        String view;
        if (token != null) {
            model.addAttribute("message", "Podaj nowe hasło");
            model.addAttribute("password", new PasswordChangeDto());
            view = "reset-password-form";
        } else {
            model.addAttribute("message", "Link jest uszkodzony lub wygasł!");
            view = "reset-password-error";
        }
        return view;
    }

    @PostMapping("/reset-password/confirm")
    public String resetPasswordConfirm(@Valid PasswordChangeDto password,
                                       BindingResult result,
                                       Model model) {
        if (result.hasErrors() || !(password.getPasswordNew().equals(password.getPasswordNewConfirm()))) {
            model.addAttribute("message", "Hasła muszą być takie same!");
            model.addAttribute("password", new PasswordChangeDto());
            return "reset-password-form";
        }
        return "reset-password-complete";
    }
}
