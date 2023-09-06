package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Cv;
import com.tranv.webspringworkcv.entity.Cv;

@Repository
public class CvDaoImpl implements CvDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Cv> getListCvs() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cv> theQuery = currentSession.createQuery("from Cv", Cv.class);
		List<Cv> cvs = theQuery.getResultList();
		return cvs;
	}

	@Override
	public Cv getCvById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Cv cv = currentSession.get(Cv.class, theId);
		return cv;
	}

	@Override
	public void saveCv(Cv theCv) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(theCv);
	}

	@Override
	public void update(Cv theCv) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theCv);

	}

	@Override
	public void deleteCv(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Cv where id:=theId");
		theQuery.setParameter("theId", theId);
		theQuery.executeUpdate();
	}
	@Override
	public Cv getCvByUserId(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cv> theQuery = currentSession
				.createQuery("SELECT c FROM Cv c JOIN c.user u WHERE u.id = :theId", Cv.class);
		theQuery.setParameter("theId", theId);

		Cv Cv = theQuery.getSingleResult();
		return Cv;
	}
}
