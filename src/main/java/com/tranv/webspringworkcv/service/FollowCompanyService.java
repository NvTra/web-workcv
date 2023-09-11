package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.Company;

public interface FollowCompanyService {
	public void followCompany(int userId, int companyId);

	public void unFollowCompany(int userId, int companyId);

	public List<Company> listCompanyFollow(int userId);
}
