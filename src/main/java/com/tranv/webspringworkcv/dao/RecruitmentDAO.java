package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.Recruitment;

public interface RecruitmentDAO {
	public List<Recruitment> getListRecruitments();

	public Recruitment getRecruitmentById(int theId);

	public void saveRecruitment(Recruitment theRecruitment);

	public void update(Recruitment theRecruitment);

	public void deleteRecruitment(int theId);

	public List<Recruitment> getResultRecruitment(String searchTerm);

	public List<Recruitment> getResultAdress(String searchTerm);

	public List<Recruitment> getResultCompany(String searchTerm);
}
