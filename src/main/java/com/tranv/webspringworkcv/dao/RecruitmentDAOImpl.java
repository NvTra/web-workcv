package com.tranv.webspringworkcv.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Category;
import com.tranv.webspringworkcv.entity.Recruitment;
import com.tranv.webspringworkcv.service.CategoryService;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	CategoryService categoryService;

	@Override
	public List<Recruitment> getListRecruitments() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Recruitment> theQuerry = currentSession.createQuery("from Recruitment", Recruitment.class);
		List<Recruitment> recruitments = theQuerry.getResultList();
		return recruitments;
	}

	@Override
	public Recruitment getRecruitmentById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Recruitment recruitment = currentSession.get(Recruitment.class, theId);
		return recruitment;
	}

	@Override
	public void saveRecruitment(Recruitment theRecruitment) {
		Session currentSession = sessionFactory.getCurrentSession();
		Category theCategory = categoryService.getCategoryById(theRecruitment.getCategory().getId());
		theRecruitment.setCategory(theCategory);
		theRecruitment.setStatus(1);
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		theRecruitment.setCreatedAt(formater.format(new Date()));
		currentSession.save(theRecruitment);
	}

	@Override
	public void update(Recruitment theRecruitment) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theRecruitment);

	}

	@Override
	public void deleteRecruitment(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Recruitment where Id=:recruitmentId");
		theQuery.setParameter("recruitmentId", theId);
		theQuery.executeUpdate();
	}

}
