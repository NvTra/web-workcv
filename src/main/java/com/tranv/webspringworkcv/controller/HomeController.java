package com.tranv.webspringworkcv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tranv.webspringworkcv.entity.Category;
import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Cv;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CategoryService;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.CvService;
import com.tranv.webspringworkcv.service.RecruitmentService;
import com.tranv.webspringworkcv.service.UserService;

@Controller

public class HomeController {
	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CvService cvService;

	// Handle the request to show the home page.
	@GetMapping("/")
	public String showHome(HttpServletRequest request, Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		theModel.addAttribute("theUser", theUser);
		if (theUser != null) {
			Cv cv = cvService.getCvByUserId(theUser.getId());
			theModel.addAttribute("userCv", cv);
		}
		request.setAttribute("msg_register_success", "done");
		List<Category> categories = categoryService.getTop4Categorys();
		theModel.addAttribute("categories", categories);
		List<Recruitment> recruitments = recruitmentService.getResultRecruitmentBySalary();
		theModel.addAttribute("recruitments", recruitments);
		List<Company> companies = companyService.getCompanyTop();
		theModel.addAttribute("companies", companies);
		return "home";
	}

	// Handle the request to show the login page.
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// Handle the request to show the access denied page.
	@GetMapping("/access-denied")
	public String accessDeniel() {
		return "access-denied";
	}

	// Handle the request to show the user profile page.
	@GetMapping("/detail")
	public String detail(Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		int userId = theUser.getId();
		Company theCompany = companyService.getCompanyByUserId(userId);
		Cv theCv = cvService.getCvByUserId(userId);
		theModel.addAttribute("Cv", theCv);
		theModel.addAttribute("user", theUser);
		theModel.addAttribute("company", theCompany);
		return "profile";
	}

}
