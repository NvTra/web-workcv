package com.tranv.webspringworkcv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller

public class HomeController {

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
}
