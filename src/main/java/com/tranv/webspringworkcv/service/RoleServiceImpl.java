package com.tranv.webspringworkcv.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.RoleDAO;
import com.tranv.webspringworkcv.entity.Role;

@Service
public class RoleServiceImpl implements RoleService {
	// Service handles operations related to the Role object
	@Autowired
	private RoleDAO roleDAO;

	// Get the Role object by Id
	@Override
	@Transactional
	public Role getRolebyRoleId(int theId) {
		return roleDAO.getRolebyRoleId(theId);
	}

}
