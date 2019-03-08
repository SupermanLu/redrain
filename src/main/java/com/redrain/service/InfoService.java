package com.redrain.service;

import java.util.List;

import com.redrain.model.Info;
import com.redrain.model.Rule;


public interface InfoService {
	public Info getInfoById(String infoid);
	
	public List<Info> selectList(Info info);
	
	public List<Info> selectCount(Info info);
	
	public int insert(Info info);
	
	public int update(Info info);
	
	public int deletebyid(String infoid);
}
