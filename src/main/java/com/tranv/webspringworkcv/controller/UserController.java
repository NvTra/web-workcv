package com.tranv.webspringworkcv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;

	@PostMapping("/addUser")
	public String addUser(@ModelAttribute("user") User newUser) {
		userService.saveUser(newUser);
		return "redirect:/";
	}

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute("user") User theUser) {
		userService.update(theUser);
		return "redirect:/detail";
	}

	@PostMapping("/update-company")
	public String updateCompany(@ModelAttribute("company") Company theCompany) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);

		theCompany.setStatus(1);
		theCompany.setUser(theUser);
		companyService.saveOrUpdateCompany(theCompany);
		return "redirect:/detail";
	}

	@PostMapping(value = "/uploadFile")
	public String submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) {
		modelMap.addAttribute("file", file);
		return "fileUploadView";
	}

	@PostMapping("/confirm-account")
	public String confirmAccount() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		int theId = theUser.getId();
		theUser.setStatus(1);
		userService.update(theUser);

		return "redirect:/detail";
	}


}
