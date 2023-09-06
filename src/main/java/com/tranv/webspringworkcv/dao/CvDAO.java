package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.Cv;

public interface CvDAO {
	public List<Cv> getListCvs();

	public Cv getCvById(int theId);

	public void saveCv(Cv theCv);

	public void update(Cv theCv);

	public void deleteCv(int theId);

	public Cv getCvByUserId(int theId);
}
