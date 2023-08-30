package com.tranv.webspringworkcv.controller;


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
	public String showFormSignUp(Model theModel) {
		theModel.addAttribute("user", new User());
		return "registration";
	}



	// khi người dùng logout khỏi hệ thống
	@GetMapping("/logoutSuccessful")
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		return "home";
	}

}
