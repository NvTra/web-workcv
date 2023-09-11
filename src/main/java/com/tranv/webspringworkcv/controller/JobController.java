package com.tranv.webspringworkcv.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tranv.webspringworkcv.entity.ApplyPost;
import com.tranv.webspringworkcv.entity.Cv;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.ApplyPostService;
import com.tranv.webspringworkcv.service.CvService;
import com.tranv.webspringworkcv.service.RecruitmentService;
import com.tranv.webspringworkcv.service.SaveJobService;
import com.tranv.webspringworkcv.service.UserService;

@Controller
@RequestMapping("/job")
public class JobController {
	@Autowired
	private UserService userService;

	@Autowired
	private CvService cvService;

	@Autowired
	private ApplyPostService applyPostService;

	@Autowired
	private SaveJobService saveJobService;

	@Autowired
	private RecruitmentService recruitmentService;

	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB

	private User getUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
		return theUser;
	}

	@PostMapping("/apply-job")
	public String applyJob(@ModelAttribute("applyJob") ApplyPost applyPost) {
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		User theUser = getUser();
		int theId = theUser.getId();
		Cv cv = cvService.getCvByUserId(theId);
		applyPost.setCreatedAt(formater.format(new Date()));
		applyPost.setNameCv(cv.getFileName());
		applyPost.setUser(theUser);
		applyPost.setStatus(0);
		applyPostService.saveOrUpdateApplyPost(applyPost);
		return "redirect:/";
	}

	@PostMapping("/apply-job2")
	public ModelAndView saveimage(@ModelAttribute("applyJob") ApplyPost applyPost,
			@RequestParam CommonsMultipartFile file, HttpSession session) throws Exception {
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		User theUser = getUser();
		int theId = theUser.getId();
		Cv theCv = cvService.getCvByUserId(theId);

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		File f = new File(System.getProperty("user.dir"));
		factory.setRepository(f);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		if (theCv == null) {
			theCv = new Cv();
		}
		theCv.setUser(theUser);
		theCv.setFileName(fileName);
		cvService.saveCv(theCv);
		String helper = session.getServletContext().getRealPath("/");
		List y = Arrays.asList(helper.split("\\\\"));
		String rootDir = y.get(0) + java.io.File.separator + y.get(1) + java.io.File.separator + y.get(y.size() - 1)
				+ java.io.File.separator + "src\\main\\webapp\\image";
		String path = rootDir + File.separator + file.getOriginalFilename();
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		applyPost.setCreatedAt(formater.format(new Date()));
		applyPost.setNameCv(theCv.getFileName());
		applyPost.setUser(theUser);
		applyPost.setStatus(0);
		applyPostService.saveOrUpdateApplyPost(applyPost);

		return new ModelAndView("redirect:/", "filesuccess", "File successfully saved!");
	}

	@PostMapping("/saveJob")
	public String saveJob(@RequestParam("recruitmentId") int recruitmentId) {
		User theUser = getUser();
		int userId = theUser.getId();

		Recruitment recruitment = recruitmentService.getRecruitmentById(recruitmentId);

		boolean isSaveJob = theUser.getRecruitments().stream()
				.anyMatch(saveJob -> saveJob.getId() == recruitment.getId());
		if (isSaveJob) {
			saveJobService.unSaveJob(recruitmentId, userId);
		} else {
			saveJobService.saveJob(recruitmentId, userId);
		}
		return "redirect:/";
	}

	@PostMapping("/unsaveJob")
	public String unSaveJob(@RequestParam("recruitmentId") int recruitmentId) {
		User theUser = getUser();
		int userId = theUser.getId();
		saveJobService.unSaveJob(recruitmentId, userId);
		return "redirect:/job/list-save-job";
	}

	@GetMapping("list-save-job")
	public String listSaveJob(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model theModel) {
		User theUser = getUser();
		int theId = theUser.getId();
		List<Recruitment> recruitments = saveJobService.listSaveJobByUser(theId);
		int itemsPerPage = 5;
		int totalPages = (int) Math.ceil((double) recruitments.size() / itemsPerPage);
		int startIndex = (currentPage - 1) * itemsPerPage;
		List<Recruitment> currentPageDonations = recruitments.subList(startIndex,
				Math.min(startIndex + itemsPerPage, recruitments.size()));
		theModel.addAttribute("currentPage", currentPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("recruitments", currentPageDonations);
		return "list-save-job";
	}

	@GetMapping("/deleteJob")
	public String deleteJob(@RequestParam("applyPostId") int theId) {
		applyPostService.deleteJob(theId);
		return "redirect:/recruitment/list-apply-job";
	}
}
