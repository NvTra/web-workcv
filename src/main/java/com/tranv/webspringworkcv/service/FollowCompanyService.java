package com.tranv.webspringworkcv.service;

public interface FollowCompanyService {
	public void followCompany(int userId, int companyId);

	public void unFollowCompany(int userId, int companyId);
}
