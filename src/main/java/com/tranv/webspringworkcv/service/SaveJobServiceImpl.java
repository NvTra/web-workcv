package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.SaveJobDAO;
import com.tranv.webspringworkcv.entity.Recruitment;

@Service
public class SaveJobServiceImpl implements SaveJobService {
	// Service handles operations related to the Save Job object

	@Autowired
	private SaveJobDAO saveJobDAO;

	// Save a job by associating it with a user.
	@Override
	@Transactional
	public void saveJob(int recruitmentId, int userId) {
		saveJobDAO.saveJob(recruitmentId, userId);

	}

	// unSave a job by associating it with a user.
	@Override
	@Transactional
	public void unSaveJob(int recruitmentId, int userId) {
		saveJobDAO.unSaveJob(recruitmentId, userId);

	}

	// Retrieve the list of recruitment save by the user with the given ID
	@Override
	@Transactional
	public List<Recruitment> listSaveJobByUser(int theId) {
		return saveJobDAO.listSaveJobByUser(theId);
	}

}
