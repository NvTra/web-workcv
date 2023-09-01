package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.Category;

public interface CategoryService {
	public List<Category> getCategories();

	public Category getCategorybayId(int theId);
}
