package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.User;

public interface UserService {
	public List<User> getListUsers();

	public User getUserById(int theId);

	public void saveUser(User theUser);

	public void update(User theUser);

	public void deleteUser(int theId);

	public User findByEmail(String email);
}
