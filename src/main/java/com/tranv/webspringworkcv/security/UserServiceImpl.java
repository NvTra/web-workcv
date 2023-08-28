package com.tranv.webspringworkcv.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.UserDAO;
import com.tranv.webspringworkcv.entity.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public List<User> getListUsers() {
		return userDAO.getListUsers();
	}

	@Override
	@Transactional
	public User getUserById(int theId) {
		return userDAO.getUserById(theId);
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		userDAO.saveUser(theUser);

	}

	@Override
	@Transactional
	public void update(User theUser) {
		userDAO.update(theUser);

	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		userDAO.deleteUser(theId);

	}

}
