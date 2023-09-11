package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.Recruitment;



public interface SaveJobService {
	public void saveJob(int recruitmentId, int userId);

	public void unSaveJob(int recruitmentId, int userId);
	
	public List<Recruitment> listSaveJobByUser(int theId);
}
