package com.tranv.webspringworkcv.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Role;



@Repository
public class RoleDAOImpl implements RoleDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Role getRolebyRoleId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Role theRole = currentSession.get(Role.class, theId);
		return theRole;
	}
}
