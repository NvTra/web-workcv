package com.tranv.webspringworkcv.controller;

import java.io.IOException;
import java.util.List;

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

import com.tranv.webspringworkcv.entity.ApplyPost;
import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.ApplyPostService;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private ApplyPostService applyPostService;

	private User getUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		return theUser;
	};

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

	@PostMapping("/update-avatar")
	public String updateAvatar(@RequestParam("userId") int theId, @RequestParam("avatar") MultipartFile multipartFile)
			throws IOException {
		User user = userService.getUserById(theId);
		byte[] image = multipartFile.getBytes();
		user.setImage(image);
		userService.update(user);
		return "redirect:/detail";
	}

	@PostMapping("/update-company")
	public String updateCompany(@ModelAttribute("company") Company theCompany) {
		User theUser = getUser();
		theCompany.setStatus(1);
		theCompany.setUser(theUser);
		companyService.saveOrUpdateCompany(theCompany);
		return "redirect:/detail";
	}

	@PostMapping("/update-logo-company")
	public String updateLogoCompany(@RequestParam("id") int theId,
			@RequestParam("logoCompany") MultipartFile multipartFile) throws IOException {
		Company company = companyService.getCompanyById(theId);
		byte[] logo = multipartFile.getBytes();
		company.setLogo(logo);
		companyService.saveOrUpdateCompany(company);
		return "redirect:/detail";
	}

	@PostMapping(value = "/uploadFile")
	public String submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) {
		modelMap.addAttribute("file", file);
		return "fileUploadView";
	}

	@PostMapping("/confirm-account")
	public String confirmAccount() {
		User theUser = getUser();
		theUser.setStatus(1);
		userService.update(theUser);
		return "redirect:/detail";
	}

	@GetMapping("/post-company")
	public String postCompany(@RequestParam("companyId") int companyId, Model theModel) {
		Company theCompany = companyService.getCompanyById(companyId);
		theModel.addAttribute("company", theCompany);
		return "post-company";
	}

	@GetMapping("/list-user")
	public String listUser(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model theModel) {
		User theUser = getUser();
		int userId = theUser.getId();
		Company theCompany = companyService.getCompanyByUserId(userId);
		int companyId = theCompany.getId();

		List<ApplyPost> applyPosts = applyPostService.listApplyPostsByCompany(companyId);

		int itemsPerPage = 5;
		// tổng số trang
		int totalPages = (int) Math.ceil((double) applyPosts.size() / itemsPerPage);
		// tính vị trí chỉ mục đầu tiên trên trnag hiện tại
		int startIndex = (currentPage - 1) * itemsPerPage;
		// lấy danh sách đợt quyên góp cho trang hiện tại
		List<ApplyPost> currentPageDonations = applyPosts.subList(startIndex,
				Math.min(startIndex + itemsPerPage, applyPosts.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("applyPosts", currentPageDonations);

		return "list-user";
	}

}
