package com.tranv.webspringworkcv.service;

import java.util.List;

import com.tranv.webspringworkcv.entity.ApplyPost;

public interface ApplyPostService {

	public void saveOrUpdateApplyPost(ApplyPost applyPost);

	public List<ApplyPost>  listApplyPostByRecruitmentId(int theId);
}
