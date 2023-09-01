package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.Company;

public interface CompanyDAO {
	public List<Company> getListCompanys();

	public Company getCompanyByUserId(int theId);

	public void saveOrUpdateCompany(Company theCompany);

}
