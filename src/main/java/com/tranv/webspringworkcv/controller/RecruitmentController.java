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
import com.tranv.webspringworkcv.service.SaveJobService;
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
	@Autowired
	private SaveJobService saveJobService;

	// Retrieve the company associated with the currently authenticated user.
	private Company getCompanyByUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		Company company = companyService.getCompanyByUserId(theUser.getId());
		return company;
	};

	// Retrieve the currently authenticated user.
	private User getUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		return theUser;
	};

	// Handle the request to display the job post form.
	@GetMapping("/post")
	public String postJob(Model theModel) {
		List<Category> categories = categoryService.getCategories();
		theModel.addAttribute("jobCategories", categories);
		return "job-post";
	}

	// Handle the request to display the list of job posts.
	@GetMapping("/list-post")
	public String showDonation(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model theModel) {
		Company company = getCompanyByUser();
		List<Recruitment> recruitments = recruitmentService.getResultRecruitmentByCompany(company.getId());
		int itemsPerPage = 5;
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		int startIndex = (currentPage - 1) * itemsPerPage;
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitment", currentPageDonations);
		return "list-post";
	}

	// Handle the request to add a new job post.
	@PostMapping("/addRecruitment")
	public String addRecruitment(@ModelAttribute("recruitment") Recruitment newRecruitment) {
		Company company = getCompanyByUser();
		newRecruitment.setCompany(company);
		recruitmentService.saveRecruitment(newRecruitment);
		return "redirect:/recruitment/list-post";
	}

	// Handle the request to show the form for updating a job post.
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("recruitmentId") int theId, Model theModel) {
		List<Category> categories = categoryService.getCategories();
		theModel.addAttribute("jobCategories", categories);
		Recruitment recruitment = recruitmentService.getRecruitmentById(theId);
		theModel.addAttribute("recruitment", recruitment);
		return "job-edit";
	}

	// This method updates the provided recruitment object using the
	// recruitmentService,
	@PostMapping("/updateRecruitment")
	public String updateRecruitment(@ModelAttribute("recruitment") Recruitment recruitment) {
		recruitmentService.update(recruitment);
		return "redirect:/recruitment/list-post";
	}

	// Display the details of a job post.
	@GetMapping("/detail")
	public String detailJob(@RequestParam("recruitmentId") int theId, Model theModel) {
		Recruitment recruitment = recruitmentService.getRecruitmentById(theId);
		User theUser = getUser();
		if (theUser != null) {
			int userId = theUser.getId();
			boolean isSaveJob = theUser.getRecruitments().stream()
					.anyMatch(saveJob -> saveJob.getId() == recruitment.getId());
			if (isSaveJob) {
				saveJobService.unSaveJob(theId, userId);
			} else {
				saveJobService.saveJob(theId, userId);
			}
			theModel.addAttribute("isSaveJob", isSaveJob);
		}

		List<ApplyPost> listApplyPosts = applyPostService.listApplyPostByRecruitmentId(theId);
		theModel.addAttribute("applyPosts", listApplyPosts);
		theModel.addAttribute("recruitment", recruitment);

		return "job-detail";
	}

	// Delete a job post.
	@GetMapping("/delete")
	public String deleteRecruitment(@RequestParam("recruitmentId") int theId) {
		recruitmentService.deleteRecruitment(theId);
		return "redirect:/recruitment/list-post";
	}

	// Search for job posts based on a search term.
	@GetMapping("/search")
	public String searchRecruitment(@RequestParam(name = "page", defaultValue = "1") int currentPage,
			@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultRecruitment(searchTerm);
		int itemsPerPage = 5;
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		int startIndex = (currentPage - 1) * itemsPerPage;
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitment", currentPageDonations);

		return "result-search";
	}

	// Search for job posts based on an address search term.
	@GetMapping("/searchaddress")
	public String searchAdress(@RequestParam(name = "page", defaultValue = "1") int currentPage,
			@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultAdress(searchTerm);
		int itemsPerPage = 5;
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		int startIndex = (currentPage - 1) * itemsPerPage;
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitment", currentPageDonations);
		return "result-search-address";
	}

	// Search for job posts based on a company search term.
	@GetMapping("/searchcompany")
	public String searchCompany(@RequestParam(name = "page", defaultValue = "1") int currentPage,
			@RequestParam("keySearch") String searchTerm, Model theModel) {
		List<Recruitment> recruitments = recruitmentService.getResultCompany(searchTerm);
		int itemsPerPage = 5;
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		int startIndex = (currentPage - 1) * itemsPerPage;
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitment", currentPageDonations);
		return "result-search-company";
	}

	// Confirm an applied job post.
	@GetMapping("/confirmPost")
	public String confirmPost(@RequestParam("applyPostId") int theId) {
		applyPostService.confirmPost(theId);
		ApplyPost applyPost = applyPostService.getApplyPostbyId(theId);
		int recruitmentId = applyPost.getRecruitment().getId();
		System.out.println(recruitmentId);
		return "redirect:/recruitment/detail?recruitmentId=" + recruitmentId;
	}

	// Display the list of job applications for the currently authenticated user.
	@GetMapping("/list-apply-job")
	public String listApplyJob(Model theModel) {
		User theUser = getUser();
		int theId = theUser.getId();
		List<ApplyPost> applyPosts = applyPostService.listApplyPostsByUser(theId);
		theModel.addAttribute("applyPosts", applyPosts);
		return "list-apply-job";
	}

	// Download a large file.
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
