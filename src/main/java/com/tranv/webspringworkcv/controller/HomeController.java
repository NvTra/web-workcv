package com.tranv.webspringworkcv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.UserService;

@Controller

public class HomeController {
	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@GetMapping("/")
	public String showHome() {
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/access-denied")
	public String accessDeniel() {
		return "access-denied";
	}

	@GetMapping("/detail")
	public String detail(Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		int userId = theUser.getId();
		Company theCompany = companyService.getCompanyByUserId(userId);
		theModel.addAttribute("user", theUser);
		theModel.addAttribute("company", theCompany);
		return "profile";
	}

	
}
