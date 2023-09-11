package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.RecruitmentDAO;
import com.tranv.webspringworkcv.entity.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	@Autowired
	private RecruitmentDAO recruitmentDAO;

	@Override
	@Transactional
	public List<Recruitment> getListRecruitments() {
		return recruitmentDAO.getListRecruitments();
	}

	@Override
	@Transactional
	public Recruitment getRecruitmentById(int theId) {
		return recruitmentDAO.getRecruitmentById(theId);
	}

	@Override
	@Transactional
	public void saveRecruitment(Recruitment theRecruitment) {
		recruitmentDAO.saveRecruitment(theRecruitment);

	}

	@Override
	@Transactional
	public void update(Recruitment theRecruitment) {
		recruitmentDAO.update(theRecruitment);

	}

	@Override
	@Transactional
	public void deleteRecruitment(int theId) {
		recruitmentDAO.deleteRecruitment(theId);

	}

	@Override
	@Transactional
	public List<Recruitment> getResultRecruitmentByCompany(int theId) {
		return recruitmentDAO.getResultRecruitmentByCompany(theId);
	}



	@Override
	@Transactional
	public List<Recruitment> getResultRecruitmentBySalary() {
		return recruitmentDAO.getResultRecruitmentBySalary();
	}

	// search recruitment by condition
	@Override
	@Transactional
	public List<Recruitment> getResultRecruitment(String searchTerm) {
		return recruitmentDAO.getResultRecruitment(searchTerm);
	}

	@Override
	@Transactional
	public List<Recruitment> getResultAdress(String searchTerm) {
		return recruitmentDAO.getResultAdress(searchTerm);
	}

	@Override
	@Transactional
	public List<Recruitment> getResultCompany(String searchTerm) {
		return recruitmentDAO.getResultCompany(searchTerm);
	}

}
