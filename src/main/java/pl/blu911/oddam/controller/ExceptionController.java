package pl.blu911.oddam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class ExceptionController {

    @GetMapping("/403")
    public String forbidden() {
        return "403";
    }
}
