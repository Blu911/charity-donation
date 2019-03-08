package pl.blu911.oddam.controller.admin;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.impl.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class UsersController {

    private final UserServiceImpl userService;

    public UsersController(UserServiceImpl userService) {
        this.userService = userService;
    }

    @ModelAttribute("currentUser")
    public void getCurrentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User currentUser = customUser.getUser();
        model.addAttribute("currentUser", currentUser);
    }

    //USER MANAGEMENT ACTIONS

    @GetMapping("/users")
    public String adminUsers(Model model) {
        List<User> userList = userService.findAllByRole("ROLE_USER");
        model.addAttribute("userList", userList);
        return "/admin/admin-users";
    }

    @GetMapping("/users/view/{id}")
    public String viewUser(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        return "admin/users/user-view";
    }

    @GetMapping("/users/edit/{id}")
    public String editUser(@PathVariable long id, Model model) {
        User userToEdit = userService.findByUserId(id);
        model.addAttribute("user", userToEdit);
        return "admin/users/user-edit";
    }

    @PostMapping("/users/edit/{id}")
    public String editUserSuccess(@Valid User user, BindingResult result, @PathVariable long id) {
        if (result.hasErrors()) {
            return "admin/users/user-edit";
        }
        userService.updateUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/block/{id}")
    public String lockUser(@PathVariable long id, Model model) {
        User userToView = userService.findByUserId(id);
        model.addAttribute("user", userToView);
        return "admin/users/user-block";
    }

    @PostMapping("/users/block/{id}")
    public String lockUserSuccess(@PathVariable long id) {
        User userToBlock = userService.findByUserId(id);
        if (userToBlock.getEnabled() == 1) {
            userService.lockAndUnlockUserById(id, 0);
        } else {
            userService.lockAndUnlockUserById(id, 1);
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/users/delete/{id}")
    public String removeUser(@PathVariable Long id, Model model) {
        User userToDelete = userService.findByUserId(id);
        model.addAttribute("user", userToDelete);
        return "admin/users/user-delete";
    }

    @PostMapping("/users/delete/{id}")
    public String removeUserSuccess(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/users";
    }

}
