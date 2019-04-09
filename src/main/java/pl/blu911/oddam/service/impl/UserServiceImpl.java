package pl.blu911.oddam.service.impl;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Role;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.repository.RoleRepository;
import pl.blu911.oddam.repository.UserRepository;
import pl.blu911.oddam.service.UserService;

import java.util.*;

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

    public Map<String, Integer> countAllRoles() {
        Map<String, Integer> numberOfUsersMap = new HashMap<>();

        numberOfUsersMap.put("admins", userRepository.countAllByRolesName("ROLE_ADMIN"));
        numberOfUsersMap.put("users", userRepository.countAllByRolesName("ROLE_USER"));
        numberOfUsersMap.put("institutions", userRepository.countAllByRolesName("ROLE_INSTITUTION"));

        return numberOfUsersMap;
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
    public void updateUser(CurrentUser currentUser, User newUser) {
        User userToUpdate = userRepository.getOne(currentUser.getUser().getId());
        userToUpdate.setUserFirstName(newUser.getUserFirstName());
        userToUpdate.setUserLastName(newUser.getUserLastName());
        userToUpdate.setEmail(newUser.getEmail());
        userToUpdate.setPhoneNumber(newUser.getPhoneNumber());
        userToUpdate.setUsername(newUser.getUsername());
        if (!userToUpdate.getPassword().equals(newUser.getPassword())) {
            userToUpdate.setPassword(passwordEncoder.encode(newUser.getPassword()));
        }
        userRepository.save(userToUpdate);
    }

    public void updateUser(User user) {
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

    @Override
    public User findByUserEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void lockAndUnlockUserById(Long id, int lock) {
        User userToBlock = userRepository.getOne(id);
//        userToBlock.setEnabled(userToBlock.getEnabled());
        userToBlock.setEnabled(lock);
        userRepository.save(userToBlock);
    }

    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }
}