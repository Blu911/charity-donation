package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.*;
import pl.blu911.oddam.service.impl.AddressServiceImpl;
import pl.blu911.oddam.service.impl.CategoryServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app")
public class FormController {

    private final UserServiceImpl userService;
    private final AddressServiceImpl addressService;
    private final CategoryServiceImpl categoryService;

    public FormController(UserServiceImpl userService, AddressServiceImpl addressService, CategoryServiceImpl categoryService) {
        this.userService = userService;
        this.addressService = addressService;
        this.categoryService = categoryService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = userService.findByUserId(customUser.getUser().getId());
        model.addAttribute("currentUser", currentUser);
    }

    @ModelAttribute("categoryList")
    public List<Category> categoryList() {
        return categoryService.findByParentId(4l);
    }

    @GetMapping("/form")
    public String appProfile(@ModelAttribute Donation donation) {

        return "app/app-form";
    }


}
