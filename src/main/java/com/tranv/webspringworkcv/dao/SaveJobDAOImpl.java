package com.tranv.webspringworkcv.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.entity.User;
import com.tranv.webspringworkcv.service.RecruitmentService;
import com.tranv.webspringworkcv.service.UserService;

@Repository
public class SaveJobDAOImpl implements SaveJobDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private UserService userService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Override
	public void saveJob(int recruitmentId, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = userService.getUserById(userId);
		Recruitment theRecruitment = recruitmentService.getRecruitmentById(recruitmentId);

		theUser.getRecruitments().add(theRecruitment);
		theRecruitment.getUsers().add(theUser);

		currentSession.merge(theUser);
	}

	@Override
	public void unSaveJob(int recruitmentId, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = userService.getUserById(userId);
		Recruitment theRecruitment = recruitmentService.getRecruitmentById(recruitmentId);

		theUser.getRecruitments().remove(theRecruitment);
		theRecruitment.getUsers().remove(theUser);

		currentSession.merge(theUser);
	}

}
