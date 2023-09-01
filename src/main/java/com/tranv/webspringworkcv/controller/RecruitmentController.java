package com.tranv.webspringworkcv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tranv.webspringworkcv.entity.Category;
import com.tranv.webspringworkcv.service.CategoryService;

@Controller
@RequestMapping("/recruitment")
public class RecruitmentController {
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/post")
	public String postJob(Model theModel) {
		List<Category> categories = categoryService.getCategories();
		theModel.addAttribute("jobCategories", categories);
		return "post-job";
	}
	
	@PostMapping("/addRecruitment")
	public String addRecruitment() {
		return "";
	}
}
