package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.InfoMapper;
import com.redrain.dao.UserMapper;
import com.redrain.model.Info;
import com.redrain.model.User;
import com.redrain.service.InfoService;
import com.redrain.service.UserService;


@Service("infoService")  
public class InfoServiceImpl implements InfoService {

	  	@Resource  
	    private InfoMapper infoDao;  
	 
	    public Info getInfoById(String infoid) {  
	        // TODO Auto-generated method stub  
	        return this.infoDao.selectByPrimaryKey(infoid);  
	    }

		public List<Info> selectList(Info info) {
			// TODO Auto-generated method stub
			return this.infoDao.selectList(info);
		}

		public List<Info> selectCount(Info info) {
			// TODO Auto-generated method stub
			return this.infoDao.selectCount(info);
		}

		public int insert(Info info) {
			// TODO Auto-generated method stub
			return this.infoDao.insertSelective(info);
		}

		public int update(Info info) {
			// TODO Auto-generated method stub
			return this.infoDao.updateByPrimaryKeySelective(info);
		}

		public int deletebyid(String infoid) {
			// TODO Auto-generated method stub
			return this.infoDao.deleteByPrimaryKey(infoid);
		} 


}