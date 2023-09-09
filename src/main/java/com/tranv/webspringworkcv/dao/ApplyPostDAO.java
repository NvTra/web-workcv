package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.ApplyPost;

public interface ApplyPostDAO {
	public void saveOrUpdateApplyPost(ApplyPost applyPost);

	public ApplyPost getApplyPostbyId(int theId);

	public List<ApplyPost> listApplyPostByRecruitmentId(int theId);

	public void confirmPost(int theId);
	
	public List<ApplyPost> listApplyPostsByCompany(int companyId);
}
