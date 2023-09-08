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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tranv.webspringworkcv.entity.ApplyPost;
import com.tranv.webspringworkcv.entity.Cv;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.ApplyPostService;
import com.tranv.webspringworkcv.service.CvService;
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

	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB

	@PostMapping("/apply-job")
	public String applyJob(@ModelAttribute("applyJob") ApplyPost applyPost) {
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
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
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User theUser = userService.findByEmail(email);
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
}
