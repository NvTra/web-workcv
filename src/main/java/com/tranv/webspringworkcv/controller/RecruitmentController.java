package com.tranv.webspringworkcv.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;

import com.tranv.webspringworkcv.entity.ApplyPost;
import com.tranv.webspringworkcv.entity.Category;
import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.ApplyPostService;
import com.tranv.webspringworkcv.service.CategoryService;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.RecruitmentService;
import com.tranv.webspringworkcv.service.UserService;

@Controller
@RequestMapping("/recruitment")
public class RecruitmentController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	RecruitmentService recruitmentService;
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private ApplyPostService applyPostService;

	@GetMapping("/post")
	public String postJob(Model theModel) {
		List<Category> categories = categoryService.getCategories();
		theModel.addAttribute("jobCategories", categories);
		return "job-post";
	}

	@PostMapping("/addRecruitment")
	public String addRecruitment(@ModelAttribute("recruitment") Recruitment newRecruitment) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		Company company = companyService.getCompanyByUserId(theUser.getId());
		newRecruitment.setCompany(company);
		recruitmentService.saveRecruitment(newRecruitment);
		return "redirect:/recruitment/list-post";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("recruitmentId") int theId, Model theModel) {
		List<Category> categories = categoryService.getCategories();
		theModel.addAttribute("jobCategories", categories);
		Recruitment recruitment = recruitmentService.getRecruitmentById(theId);
		theModel.addAttribute("recruitment", recruitment);
		return "job-edit";
	}

	@PostMapping("/updateRecruitment")
	public String updateRecruitment(@ModelAttribute("recruitment") Recruitment recruitment) {
		recruitmentService.update(recruitment);
		return "redirect:/recruitment/list-post";
	}

	@GetMapping("/list-post")
	public String showDonation(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getListRecruitments();
		int itemsPerPage = 5;
		// tổng số trang
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		// tính vị trí chỉ mục đầu tiên trên trnag hiện tại
		int startIndex = (currentPage - 1) * itemsPerPage;
		// lấy danh sách đợt quyên góp cho trang hiện tại
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitment", currentPageDonations);

		return "list-post";
	}

	@GetMapping("/detail")
	public String detailJob(@RequestParam("recruitmentId") int theId, Model theModel) {
		Recruitment recruitment = recruitmentService.getRecruitmentById(theId);
		List<ApplyPost> listApplyPosts = applyPostService.listApplyPostByRecruitmentId(theId);
		theModel.addAttribute("applyPosts", listApplyPosts);
		theModel.addAttribute("recruitment", recruitment);
		return "job-detail";
	}

	@GetMapping("/delete")
	public String deleteRecruitment(@RequestParam("recruitmentId") int theId) {
		recruitmentService.deleteRecruitment(theId);
		return "redirect:/recruitment/list-post";
	}

	@GetMapping("/search")
	public String searchRecruitment(@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultRecruitment(searchTerm);
		theModel.addAttribute("recruitment", recruitments);
		return "result-search";
	}

	@GetMapping("/searchaddress")
	public String searchAdress(@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultAdress(searchTerm);
		theModel.addAttribute("recruitment", recruitments);
		return "result-search-address";
	}

	@GetMapping("/searchcompany")
	public String searchCompany(@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultCompany(searchTerm);
		theModel.addAttribute("recruitment", recruitments);
		return "result-search-address";
	}

	@GetMapping("/confirmPost")
	public String confirmPost(@RequestParam("applyPostId") int theId) {
		applyPostService.confirmPost(theId);
		ApplyPost applyPost = applyPostService.getApplyPostbyId(theId);
		int recruitmentId = applyPost.getRecruitment().getId();
		System.out.println(recruitmentId);
		return "redirect:/recruitment/detail?recruitmentId=" + recruitmentId;
	}

	@SuppressWarnings("unused")
	@GetMapping("/downloadFile")
	@ResponseBody
	public ResponseEntity<InputStreamResource> downloadLargeFile(@RequestParam("name") String fileName)
			throws Exception {
		File f = new File(System.getProperty("user.dir"));
		System.out.println(f);
		File file = new File(System.getProperty("user.dir") + File.separator + fileName);
		System.out.println(file);

		if (file == null) {
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		final InputStream inputStream = new FileInputStream(file);
		final InputStreamResource resource = new InputStreamResource(inputStream);
		final HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.set(HttpHeaders.LAST_MODIFIED, String.valueOf(file.lastModified()));
		httpHeaders.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"");
		httpHeaders.set(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()));
		return ResponseEntity.ok().headers(httpHeaders).contentLength(file.length())
				.contentType(MediaType.APPLICATION_OCTET_STREAM).body(resource);
	}
}
