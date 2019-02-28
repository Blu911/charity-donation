package pl.blu911.oddam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping("")
    public String home() {
        return "home";
    }

    @GetMapping("/steps")
    public String steps() {
        return "steps";
    }

    @GetMapping("/about-us")
    public String aboutUs() {
        return "about-us";
    }

    @GetMapping("/help")
    public String help() {
        return "help";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

}
