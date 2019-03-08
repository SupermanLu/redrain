package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.InfoMapper;
import com.redrain.dao.ThrowMapper;
import com.redrain.dao.UserMapper;
import com.redrain.model.Info;
import com.redrain.model.Throw;
import com.redrain.model.User;
import com.redrain.service.InfoService;
import com.redrain.service.ThrowService;
import com.redrain.service.UserService;


@Service("throwService")  
public class ThrowServiceImpl implements ThrowService {

	  	@Resource  
	    private ThrowMapper throwDao;  
	 
	    public Throw getThrowById(int throwid) {  
	        // TODO Auto-generated method stub  
	        return this.throwDao.selectByPrimaryKey(throwid);  
	    }

		public List<Throw> selectList(Throw record) {
			// TODO Auto-generated method stub
			return this.throwDao.selectList(record);
		}

		public List<Throw> selectCount(Throw record) {
			// TODO Auto-generated method stub
			return this.throwDao.selectCount(record);
		}

		public int insert(Throw record) {
			// TODO Auto-generated method stub
			return this.throwDao.insertSelective(record);
		}

		public int update(Throw record) {
			// TODO Auto-generated method stub
			return this.throwDao.updateByPrimaryKeySelective(record);
		}

		public int deletebyid(int throwid) {
			// TODO Auto-generated method stub
			return this.throwDao.deleteByPrimaryKey(throwid);
		}

		public int delete() {
			// TODO Auto-generated method stub
			return this.throwDao.delete();
		}

		public int finish() {
			// TODO Auto-generated method stub
			return this.throwDao.finish();
		} 
		
		public List<Throw> selectTodayCount(Throw record) {
			// TODO Auto-generated method stub
			return this.throwDao.selectTodayCount(record);
		}


}