package com.tranv.webspringworkcv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tranv.webspringworkcv.dao.ApplyPostDAO;
import com.tranv.webspringworkcv.entity.ApplyPost;

@Service
public class ApplyPostServiceImpl implements ApplyPostService {
	@Autowired
	private ApplyPostDAO applyPostDAO;

	@Override
	@Transactional
	public void saveOrUpdateApplyPost(ApplyPost applyPost) {
		applyPostDAO.saveOrUpdateApplyPost(applyPost);

	}

	@Override
	@Transactional
	public List<ApplyPost>  listApplyPostByRecruitmentId(int theId) {
		return applyPostDAO.listApplyPostByRecruitmentId(theId);
		
	}

}
