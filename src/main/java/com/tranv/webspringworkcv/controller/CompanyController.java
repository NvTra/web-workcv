package com.tranv.webspringworkcv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.FollowCompanyService;
import com.tranv.webspringworkcv.service.RecruitmentService;
import com.tranv.webspringworkcv.service.UserService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private FollowCompanyService followCompanyService;

	@Autowired
	private UserService userService;

	@GetMapping("/post-company")
	public String postCompany(@RequestParam(name = "page", defaultValue = "1") int currentPage,
			@RequestParam("companyId") int CompanyId, Model theModel) {
		Company theCompany = companyService.getCompanyById(CompanyId);
		List<Recruitment> recruitments = recruitmentService.getResultRecruitmentByCompany(CompanyId);
		int itemsPerPage = 5;
		// tổng số trang
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		// tính vị trí chỉ mục đầu tiên trên trnag hiện tại
		int startIndex = (currentPage - 1) * itemsPerPage;
		// lấy danh sách đợt quyên góp cho trang hiện tại
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("company", theCompany);
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitments", currentPageDonations);
		return "post-company";
	}

	@GetMapping("/detail-company")
	public String detailCompany(@RequestParam("companyId") int companyId, Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		Company theCompany = companyService.getCompanyById(companyId);
		theModel.addAttribute("company", theCompany);
		theModel.addAttribute("theUser", theUser);
		return "detail-company";
	}

	@PostMapping("/follow-company")
	public String followCompany(@RequestParam("companyId") int companyId, Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		int userId = theUser.getId();
		followCompanyService.followCompany(userId, companyId);
		return "redirect:/company/detail-company?companyId=" + companyId;
	}

	@PostMapping("/unfollow-company")
	public String unFollowCompany(@RequestParam("companyId") int companyId, Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		int userId = theUser.getId();
		followCompanyService.unFollowCompany(userId, companyId);
		return "redirect:/company/detail-company?companyId=" + companyId;
	}
}
