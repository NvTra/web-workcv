package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.tranv.webspringworkcv.entity.Company;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Company> getListCompanys() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Company> theQuery = currentSession.createQuery("from Company", Company.class);
		List<Company> companys = theQuery.getResultList();
		return companys;
	}

	@Override
	public Company getCompanyByUserId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Company> theQuery = currentSession
				.createQuery("SELECT c FROM Company c JOIN c.user u WHERE u.id = :theId", Company.class);
		theQuery.setParameter("theId", theId);
		Company company = theQuery.getSingleResult();
		return company;
	}

	@Override
	public Company getCompanyById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Company company = currentSession.get(Company.class, theId);
		return company;
	}

	@Override
	public void saveOrUpdateCompany(Company theCompany) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theCompany);

	}

}
