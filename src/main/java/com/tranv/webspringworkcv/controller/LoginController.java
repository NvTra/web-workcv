package com.tranv.webspringworkcv.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tranv.webspringworkcv.entity.User;

@Controller
public class LoginController {

	@GetMapping("/showFormLogin")
	public String showFormLogin() {
		return "login";
	}

	@GetMapping("/sign-up")
	public String showFormSignUp(HttpServletRequest request, Model theModel) {
		
		theModel.addAttribute("user", new User());
		return "registration";
	}

	// khi người dùng logout khỏi hệ thống
	@GetMapping("/logoutSuccessful")
	public String logoutSuccessfulPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "home";
	}

}
