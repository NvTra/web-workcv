package com.tranv.webspringworkcv.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.SaveJobDAO;

@Service
public class SaveJobServiceImpl implements SaveJobService {
	@Autowired
	private SaveJobDAO saveJobDAO;

	@Override
	@Transactional
	public void saveJob(int recruitmentId, int userId) {
		saveJobDAO.saveJob(recruitmentId, userId);

	}

	@Override
	@Transactional
	public void unSaveJob(int recruitmentId, int userId) {
		saveJobDAO.unSaveJob(recruitmentId, userId);

	}

}
