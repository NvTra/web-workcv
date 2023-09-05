package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.CompanyDAO;
import com.tranv.webspringworkcv.entity.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	private CompanyDAO companyDAO;

	@Override
	@Transactional
	public List<Company> getListCompanys() {
		return companyDAO.getListCompanys();
	}

	@Override
	@Transactional
	public Company getCompanyById(int theId) {
		return companyDAO.getCompanyById(theId);
	}

	@Override
	@Transactional
	public Company getCompanyByUserId(int theId) {
		return companyDAO.getCompanyByUserId(theId);
	}

	@Override
	@Transactional
	public void saveOrUpdateCompany(Company theCompany) {
		companyDAO.saveOrUpdateCompany(theCompany);
	}



}
