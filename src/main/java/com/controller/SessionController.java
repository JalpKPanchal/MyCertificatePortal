package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SessionController {
	  @GetMapping("/forgotPassword")
	    public String showForgotPasswordPage() {
	        return "ForgotPassword";
	    }
	  
	  @GetMapping("/updatePassword")
	    public String updatePasswordPage() {
	        return "UpdatePassword";
	    }
}