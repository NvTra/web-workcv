package com.tranv.webspringworkcv.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.entity.Company;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.CompanyService;
import com.tranv.webspringworkcv.service.UserService;

@Repository
public class FollowCompanyDAOImpl implements FollowCompanyDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@Override
	public void followCompany(int userId, int companyId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = userService.getUserById(userId);
		Company theCompany = companyService.getCompanyById(companyId);
		theUser.getCompanies().add(theCompany);
		theCompany.getUsers().add(theUser);
		currentSession.merge(theUser);
	}

	@Override
	public void unFollowCompany(int userId, int companyId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = userService.getUserById(userId);
		Company theCompany = companyService.getCompanyById(companyId);
		theUser.getCompanies().remove(theCompany);
		theCompany.getUsers().remove(theUser);
		currentSession.merge(theUser);
	}

	@Override
	public List<Company> listCompanyFollow(int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Company> theQuery = currentSession
				.createQuery("SELECT c FROM User u JOIN u.companies c WHERE u.id = :userId", Company.class);
		theQuery.setParameter("userId", userId);
		List<Company> companies = theQuery.getResultList();
		return companies;
	}

}
