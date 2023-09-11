package com.tranv.webspringworkcv.dao;

public interface SaveJobDAO {
	public void saveJob(int recruitmentId, int userId);

	public void unSaveJob(int recruitmentId, int userId);
}
