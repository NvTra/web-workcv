package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.FollowCompanyDAO;
import com.tranv.webspringworkcv.entity.Company;

@Service
public class FollowCompanyServiceImpl implements FollowCompanyService {
	@Autowired
	private FollowCompanyDAO followCompanyDAO;

	@Override
	@Transactional
	public void followCompany(int userId, int companyId) {
		followCompanyDAO.followCompany(userId, companyId);

	}

	@Override
	@Transactional
	public void unFollowCompany(int userId, int companyId) {
		followCompanyDAO.unFollowCompany(userId, companyId);

	}

	@Override
	@Transactional
	public List<Company> listCompanyFollow(int userId) {
		return followCompanyDAO.listCompanyFollow(userId);
	}

}
