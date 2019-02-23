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

    @GetMapping("kontakt")
    public String contact() {

        return "contact";
    }

    @GetMapping("o-nas")
    public String about() {

        return "about";
    }
}
