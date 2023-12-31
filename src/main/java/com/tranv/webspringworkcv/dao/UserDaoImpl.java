package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Role;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.RoleService;

@Repository
public class UserDaoImpl implements UserDAO {
	
	// DAO handles operations related to the User object
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private RoleService roleService;

	// Method to get a list of all users from the database
	@Override
	public List<User> getListUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theQuery = currentSession.createQuery("from User", User.class);
		List<User> users = theQuery.getResultList();
		return users;
	}

	// Method to get information about a user based on ID
	@Override
	public User getUserById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theId);
		return theUser;
	}

	// Method to save user to database
	@Override
	public void saveUser(User theUser) {
		Role role = roleService.getRolebyRoleId(theUser.getRole().getId());
		Session currentSession = sessionFactory.getCurrentSession();
		String pass = theUser.getPassword();
		theUser.setPassword("{noop}" + pass);
		theUser.setRole(role);
		theUser.setStatus(1);
		currentSession.save(theUser);

	}

	// Method to update a user based on ID
	@Override
	public void update(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theUser);

	}

	// Method to delete a user based on ID
	@Override
	public void deleteUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from User where id:=userId", User.class);
		theQuery.setParameter("userId", theId);
		theQuery.executeUpdate();

	}

	// Method to get information about a user based on email
	@Override
	public User findByEmail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theQuery = currentSession.createQuery("from User where email = :email", User.class);
		theQuery.setParameter("email", email);
		User user = theQuery.getSingleResult();
		return user;
	}

	// Method to unlock a user based on ID
	@Override
	public User lockUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theId);
		theUser.setStatus(1);
		currentSession.update(theUser);
		return theUser;
	}
}
