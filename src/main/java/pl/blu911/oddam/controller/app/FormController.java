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
import java.util.ArrayList;
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

//    @ModelAttribute("whatToDonate")
//    public List<Category> categoryList() {
//        return categoryService.findByParentId(4l);
//    }

//    @ModelAttribute("addressList")
//    public List<Address> institutionAddresses() {
//        List<Address> addressList = new ArrayList<>();
//        List<User> institutions = userService.findAllByRole("ROLE_INSTITUTION");
//        institutions.forEach(item -> addressList.addAll(item.getAddresses()));
//
//
//        return addressList;
//    }

    @GetMapping("/form")
    public String appProfile(@ModelAttribute Donation donation, Model model) {
        List<Category> whatToDonateList = categoryService.findByParentId(4l);
        model.addAttribute("whatToDonate", whatToDonateList);

        List<Address> addressList = new ArrayList<>();
        List<User> institutions = userService.findAllByRole("ROLE_INSTITUTION");
        institutions.forEach(item -> addressList.addAll(item.getAddresses()));
        model.addAttribute("institutionAddresses", addressList);

        List<Category> helpsWhoList = categoryService.findByParentId(2l);
        model.addAttribute("helpsWho", helpsWhoList);


        return "app/app-form";
    }


}
