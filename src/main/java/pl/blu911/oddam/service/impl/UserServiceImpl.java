package pl.blu911.oddam.service.impl;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Role;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.repository.RoleRepository;
import pl.blu911.oddam.repository.UserRepository;
import pl.blu911.oddam.service.UserService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository,
                           RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> findAllByRole(String name) {
        return userRepository.findAllByRolesNameOrderByCreatedDesc(name);
    }

    public User findByUserId(Long id) {
        return userRepository.getOne(id);
    }

    @Override
    public User findByUserUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void saveUser(User user, String role) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName(role);
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public void updateUser(@AuthenticationPrincipal CurrentUser customUser, @Valid User user) {
        User userToUpdate = userRepository.getOne(customUser.getUser().getId());
        userToUpdate.setUserFirstName(user.getUserFirstName());
        userToUpdate.setUserLastName(user.getUserLastName());
        userToUpdate.setEmail(user.getEmail());
        userToUpdate.setPhoneNumber(user.getPhoneNumber());
        userToUpdate.setUsername(user.getUsername());
        userToUpdate.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(userToUpdate);
    }

    public void updateUser(@Valid User user) {
        User userToUpdate = userRepository.getOne(user.getId());
        userToUpdate.setInstitutionName(user.getInstitutionName());
        userToUpdate.setUserFirstName(user.getUserFirstName());
        userToUpdate.setUserLastName(user.getUserLastName());
        userToUpdate.setEmail(user.getEmail());
        userToUpdate.setPhoneNumber(user.getPhoneNumber());
        userToUpdate.setUsername(user.getUsername());
        userToUpdate.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(userToUpdate);
    }

    public void lockAndUnlockUserById(Long id, int lock) {
        User userToBlock = userRepository.getOne(id);
        userToBlock.setEnabled(lock);
        userRepository.save(userToBlock);
    }

    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }
}