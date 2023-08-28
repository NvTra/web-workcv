package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Role;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.security.RoleService;

@Repository
public class UserDaoImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private RoleService roleService;

	@Override
	public List<User> getListUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theQuery = currentSession.createQuery("from User", User.class);
		List<User> users = theQuery.getResultList();
		return users;
	}

	@Override
	public User getUserById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theId);
		return theUser;
	}

	@Override
	public void saveUser(User theUser) {
		Role role = roleService.getRolebyRoleId(theUser.getRole().getId());
		Session currentSession = sessionFactory.getCurrentSession();
		theUser.setRole(role);
		theUser.setStatus(1);
		currentSession.save(theUser);

	}

	@Override
	public void update(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theUser);

	}

	@Override
	public void deleteUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from User where id:=userId", User.class);
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();

	}

}
