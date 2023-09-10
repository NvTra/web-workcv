package com.tranv.webspringworkcv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.RecruitmentService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	@Autowired
	RecruitmentService recruitmentService;

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
		Company theCompany = companyService.getCompanyById(companyId);
		theModel.addAttribute("company", theCompany);
		return "detail-company";
	}
}
