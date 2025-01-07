package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.UserEntity;
//import com.repository.UserRepository;
import com.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    // GetMapping to display the signup form
    @GetMapping("/Signup")
    public String showSignupForm(Model model) {
        return "Signup"; // Return the signup.jsp page
    }

    // PostMapping to save the user
    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute UserEntity user) {
        // Check if the email already exists in the database
        if (userRepository.findByEmail(user.getEmail()) != null) {
            // If email already exists, return to the signup page with a message
            return "redirect:/Signup?error=emailExists";
        }

        // Save the user into the MongoDB collection
        user.setRole("Student");
        userRepository.save(user);
        return "Login"; // Redirect to the login page with a success message
    }
    
    @GetMapping("/StudentHome")
    public String studentHome() {
    	return "StudentHome";
    }

    @GetMapping("/login")
    public String login() {
        return "Login"; // Display the login.jsp page
    }

    // PostMapping to handle login
    @PostMapping("/loginUser")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        // Fetch the user from the database using the email
        UserEntity user = userRepository.findByEmail(email);

        if (user == null) {
            // If user is not found, show error on the login page
            model.addAttribute("error", "Invalid email or password!");
            return "Login";
        }

        // Check if the entered password matches the stored password
        if (!user.getPassword().equals(password)) {
            model.addAttribute("error", "Invalid email or password!");
            return "Login";
        }

        // Redirect based on the user's role
        if ("Student".equals(user.getRole())) {
            model.addAttribute("user", user); // Pass user details to the next page if needed
            return "redirect:/StudentHome";
        } else if ("Admin".equals(user.getRole())) {
            model.addAttribute("user", user); // Pass user details to the next page if needed
            return "redirect:/home";
        }

        // Default case (if role is neither Student nor Admin)
        model.addAttribute("error", "User role is not recognized!");
        return "Login";
    }

}
