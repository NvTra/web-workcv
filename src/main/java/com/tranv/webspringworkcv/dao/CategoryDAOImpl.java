package com.tranv.webspringworkcv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tranv.webspringworkcv.entity.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Category> getCategories() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Category> theQuery = currentSession.createQuery("from Category", Category.class);
		List<Category> categories = theQuery.getResultList();
		return categories;
	}

	@Override
	public Category getCategoryById(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Category category = currentSession.get(Category.class, theId);
		return category;
	}

	@Override
	public List<Category> getTop4Categorys() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Category> theQuerry = currentSession.createQuery("SELECT c FROM Category c ORDER BY c.numberChoose DESC",
				Category.class);
		theQuerry.setMaxResults(4);
		List<Category> Categorys = theQuerry.getResultList();
		return Categorys;
	}
}
