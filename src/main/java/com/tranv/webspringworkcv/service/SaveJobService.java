package com.tranv.webspringworkcv.service;

public interface SaveJobService {
	public void saveJob(int recruitmentId, int userId);

	public void unSaveJob(int recruitmentId, int userId);
}
