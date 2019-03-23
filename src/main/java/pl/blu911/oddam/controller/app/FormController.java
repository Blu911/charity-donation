package pl.blu911.oddam.controller.app;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.*;
import pl.blu911.oddam.domain.dto.DonationDto;
import pl.blu911.oddam.service.impl.AddressServiceImpl;
import pl.blu911.oddam.service.impl.CategoryServiceImpl;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/app")
@SessionAttributes("donation")
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

    @GetMapping("/form")
    public String appFormStep1(Model model) {
        DonationDto donationDto = new DonationDto();
        model.addAttribute("donation", donationDto);

        List<Category> whatToDonateList = categoryService.findByParentId(4l);
        model.addAttribute("whatToDonate", whatToDonateList);

        List<User> institutionList = userService.findAllByRole("ROLE_INSTITUTION");
        model.addAttribute("institutions", institutionList);

        List<Address> addressList = new ArrayList<>();
        institutionList.forEach(item -> addressList.addAll(item.getAddresses()));
        model.addAttribute("institutionAddresses", addressList);

        List<Category> helpsWhoList = categoryService.findByParentId(2l);
        model.addAttribute("helpsWho", helpsWhoList);

        return "app/form/form";
    }

    @PostMapping("/form")
    public String appFormStep1(@ModelAttribute DonationDto donation, @RequestParam String[] whatToDonate) {
        System.out.println(donation.toString());
        System.out.println(Arrays.toString(whatToDonate));

        return "redirect:/app";
    }


    @GetMapping("/temp")
    public String appFormTemp(Model model) {
        DonationDto donationDto = new DonationDto();
        model.addAttribute("donation", donationDto);


        List<Category> whatToDonateList = categoryService.findByParentId(4l);
        model.addAttribute("whatToDonate", whatToDonateList);

        List<User> institutionList = userService.findAllByRole("ROLE_INSTITUTION");
        model.addAttribute("institutions", institutionList);

        List<Address> addressList = new ArrayList<>();
        institutionList.forEach(item -> addressList.addAll(item.getAddresses()));
        model.addAttribute("institutionAddresses", addressList);

        List<Category> helpsWhoList = categoryService.findByParentId(2l);
        model.addAttribute("helpsWho", helpsWhoList);

        return "app/form/temp";
    }

    @PostMapping("/temp")
    public String appFormTemp2(@Valid DonationDto donation, BindingResult result) {
        System.out.println(donation.toString());
        if (result.hasErrors()) {
            return "app/form/temp";
        }
        return "redirect:/app";
    }


    @GetMapping("/formStep1")
    public String appFormStepOne(Model model) {
        DonationDto donationDto = new DonationDto();
        model.addAttribute("donation", donationDto);

        List<Category> whatToDonateList = categoryService.findByParentId(4l);
        model.addAttribute("whatToDonate", whatToDonateList);

        return "app/form/formStep1";
    }

    @PostMapping("/formStep1")
    public String appFormStepOneError(@Valid DonationDto donation, BindingResult result) {
        System.out.println(donation.toString());
        if (result.hasErrors()) {
            return "app/form/formStep1";
        }
        return "redirect:/app";
    }
}
