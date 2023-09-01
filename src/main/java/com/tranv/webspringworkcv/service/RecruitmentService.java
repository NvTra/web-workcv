package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.Recruitment;

public interface RecruitmentService {
	public List<Recruitment> getListRecruitments();

	public Recruitment getRecruitmentById(int theId);

	public void saveRecruitment(Recruitment theRecruitment);

	public void update(Recruitment theRecruitment);

	public void deleteRecruitment(int theId);

}
