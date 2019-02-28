package pl.blu911.oddam.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.blu911.oddam.domain.CurrentUser;

@Controller
@RequestMapping("/app")
public class UserController {

    @GetMapping("")
    public String userPanel(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        return "/user/user-panel";
    }
}
