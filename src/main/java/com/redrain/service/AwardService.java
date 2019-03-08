package com.redrain.service;

import java.util.List;

import com.redrain.model.Award;
import com.redrain.model.Info;
import com.redrain.model.Rule;


public interface AwardService {
	public Award getAwardById(int awardid);
	
	public List<Award> selectList(Award award);
	
	public List<Award> selectCount(Award award);
	
	public int insert(Award award);
	
	public int update(Award award);
	
	public int deletebyid(int awardid);
	
	public List<Award> selectAll();
}
