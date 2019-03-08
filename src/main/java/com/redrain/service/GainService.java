package com.redrain.service;

import java.util.List;

import com.redrain.model.Gain;
import com.redrain.model.Info;
import com.redrain.model.Rule;
import com.redrain.model.Throw;


public interface GainService {
	public Gain getGainById(int gainid);
	
	public List<Gain> selectList(Gain record);
	
	public List<Gain> selectCount(Gain record);
	
	public List<Gain> selectAllList();
	
	public List<Gain> selectListbyuser(Gain record);
	
	public List<Gain> selectCountbyuser(Gain record);
	
	public int insert(Gain record);
	
	public int update(Gain record);
	
	public int deletebyid(int gainid);
	
	public int delete();
	
	public int finish();
	
	public List<Gain> selectListbyusername(Gain record);
	
	public List<Gain> selectCountbyusername(Gain record);
}
