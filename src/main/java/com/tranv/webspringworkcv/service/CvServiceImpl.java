package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.CvDAO;
import com.tranv.webspringworkcv.entity.Cv;

@Service
public class CvServiceImpl implements CvService {
	@Autowired
	private CvDAO cvDAO;

	@Override
	@Transactional
	public List<Cv> getListCvs() {
		return cvDAO.getListCvs();
	}

	@Override
	@Transactional
	public Cv getCvById(int theId) {
		return cvDAO.getCvById(theId);
	}

	@Override
	@Transactional
	public void saveCv(Cv theCv) {
		cvDAO.saveCv(theCv);

	}

	@Override
	@Transactional
	public void update(Cv theCv) {
		cvDAO.update(theCv);

	}

	@Override
	@Transactional
	public void deleteCv(int theId) {
		cvDAO.deleteCv(theId);

	}

	@Override
	@Transactional
	public Cv getCvByUserId(int theId) {
		return cvDAO.getCvById(theId);
	}

}
