package com.redrain.service;

import java.util.List;

import com.redrain.model.Info;
import com.redrain.model.Rule;
import com.redrain.model.Throw;


public interface ThrowService {
	public Throw getThrowById(int throwid);
	
	public List<Throw> selectList(Throw record);
	
	public List<Throw> selectCount(Throw record);
	
	public int insert(Throw record);
	
	public int update(Throw record);
	
	public int deletebyid(int throwid);
	
	public int delete();
	
	public int finish();
	
	public List<Throw> selectTodayCount(Throw record);
}
