package com.tranv.webspringworkcv.dao;

import java.util.List;

import com.tranv.webspringworkcv.entity.ApplyPost;

public interface ApplyPostDAO {
	public void saveOrUpdateApplyPost(ApplyPost applyPost);
	
	public List<ApplyPost>  listApplyPostByRecruitmentId(int theId);
}
