package com.tranv.webspringworkcv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.security.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@PostMapping("/addUser")
	public String addUser(@ModelAttribute("user") User newUser) {
		userService.saveUser(newUser);
		return "redirect:/";
	}
}
