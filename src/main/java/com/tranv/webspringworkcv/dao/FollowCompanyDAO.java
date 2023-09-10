package com.tranv.webspringworkcv.dao;

public interface FollowCompanyDAO {
	public void followCompany(int userId, int companyId);

	public void unFollowCompany(int userId, int companyId);
}
