package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.Company;

public interface CompanyService {
	public List<Company> getListCompanys();

	public List<Company> getCompanyTop();

	public Company getCompanyByUserId(int theId);

	public Company getCompanyById(int theId);

	public void saveOrUpdateCompany(Company theCompany);

}
