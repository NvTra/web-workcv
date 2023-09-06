package com.tranv.webspringworkcv.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.Cv;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CvService;
import com.tranv.webspringworkcv.service.UserService;

@Controller

public class UploadFileController {
	@Autowired
	private UserService userService;

	@Autowired
	private CvService cvService;

	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB

	@RequestMapping("uploadform")
	public ModelAndView uploadForm() {
		return new ModelAndView("uploadform");
	}

	@PostMapping("saveCvFile")
	public ModelAndView saveimage(@RequestParam("userId") int theId, @RequestParam CommonsMultipartFile file,
			HttpSession session) throws Exception {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		File f = new File(System.getProperty("user.dir"));
		factory.setRepository(f);

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);

		User theUser = userService.getUserById(theId);
		Cv theCv = new Cv();
		theCv.setUser(theUser);
		theCv.setFileName(fileName);
		cvService.saveCv(theCv);

		String helper = session.getServletContext().getRealPath("/");
		List y = Arrays.asList(helper.split("\\\\"));
		String rootDir = y.get(0) + java.io.File.separator + y.get(1) + java.io.File.separator + y.get(y.size() - 1)
				+ java.io.File.separator + "src\\main\\webapp\\image";
		String path = rootDir + File.separator + file.getOriginalFilename();
		System.out.println(path);
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		return new ModelAndView("redirect:/detail", "filesuccess", "File successfully saved!");
	}
}
