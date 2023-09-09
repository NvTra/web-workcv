package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.ApplyPost;

@Repository
public class ApplyPostDAOImpl implements ApplyPostDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveOrUpdateApplyPost(ApplyPost theApplyPost) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theApplyPost);
	}

	@Override
	public List<ApplyPost> listApplyPostByRecruitmentId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ApplyPost> theQuery = currentSession.createQuery(
				"SELECT a FROM ApplyPost a JOIN FETCH a.recruitment r JOIN FETCH a.user u WHERE r.id = :theId",
				ApplyPost.class);
		theQuery.setParameter("theId", theId);

		List<ApplyPost> applyPosts = theQuery.getResultList();
		return applyPosts;

	}

	@Override
	public void confirmPost(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		ApplyPost applyPost = currentSession.get(ApplyPost.class, theId);
		applyPost.setStatus(1);
		currentSession.update(applyPost);
	}

	@Override
	public ApplyPost getApplyPostbyId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		ApplyPost applyPost = currentSession.get(ApplyPost.class, theId);
		return applyPost;
	}

	@Override
	public List<ApplyPost> listApplyPostsByCompany(int companyId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ApplyPost> theQuery = currentSession.createQuery("SELECT a FROM ApplyPost a JOIN FETCH a.recruitment r "
				+ "JOIN FETCH a.user u JOIN FETCH r.company c " + "WHERE c.id = :companyId", ApplyPost.class);
		theQuery.setParameter("companyId", companyId);
		List<ApplyPost> applyPosts = theQuery.getResultList();
		return applyPosts;
	}

}
