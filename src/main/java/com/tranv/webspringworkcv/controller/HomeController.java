package com.tranv.webspringworkcv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.security.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String showHome() {
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/addUser")
	public String addUser(@ModelAttribute("user") User newUser) {
		userService.saveUser(newUser);
		return "redirect:/";
	}
}
