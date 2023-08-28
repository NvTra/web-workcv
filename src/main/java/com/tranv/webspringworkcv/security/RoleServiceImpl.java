package com.tranv.webspringworkcv.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.RoleDAO;
import com.tranv.webspringworkcv.entity.Role;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDAO roleDAO;

	@Override
	@Transactional
	public Role getRolebyRoleId(int theId) {
		return roleDAO.getRolebyRoleId(theId);
	}

}
