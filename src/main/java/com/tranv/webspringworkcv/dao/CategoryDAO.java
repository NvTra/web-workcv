package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.Category;

public interface CategoryDAO {
	public List<Category> getCategories();

	public Category getCategoryById(int theId);
}
