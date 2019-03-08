package com.redrain.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.redrain.model.Info;
import com.redrain.model.User;


public interface UserService {
	public User getUserById(String userId);	
	
	public int insert(User user);
	
	public int updateByPrimaryKey(User user);
		
	public int deleteByPrimaryKey(String id);
	
	public List<User> getUserByUserName(String userName);
	
	public int importExcel(MultipartFile myFile) throws Exception;
	
	public List<User> selectList(User user);
	
	public List<User> selectCount(User user);
	
	public int update(User user);
	
	public int deletebyid(String userId);
	
	public int delete();
	
}
