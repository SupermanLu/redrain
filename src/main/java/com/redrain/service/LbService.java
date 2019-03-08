package com.redrain.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.redrain.model.Gain;
import com.redrain.model.Info;
import com.redrain.model.Lb;
import com.redrain.model.User;


public interface LbService {
	public Lb getObjectById(Integer objectId);	
	
	public int insert(Lb object);
	
	public int updateByPrimaryKey(Lb object);
		
	public int deleteByPrimaryKey(Integer id);
	
	public int importExcel(MultipartFile myFile) throws Exception;
	
	public List<Lb> selectList(Lb object);
	
	public List<Lb> selectCount(Lb object);
	
	public int update(Lb user);
	
	public int deletebyid(Integer objectId);
	
	public List<Lb> selectAllList();
	
	public int delete();

	
}
