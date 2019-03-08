package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.GainMapper;
import com.redrain.dao.InfoMapper;
import com.redrain.dao.ThrowMapper;
import com.redrain.dao.UserMapper;
import com.redrain.model.Gain;
import com.redrain.model.Info;
import com.redrain.model.Throw;
import com.redrain.model.User;
import com.redrain.service.GainService;
import com.redrain.service.InfoService;
import com.redrain.service.ThrowService;
import com.redrain.service.UserService;


@Service("gainService")  
public class GainServiceImpl implements GainService {

	  	@Resource  
	    private GainMapper gainDao;  
	 
	    public Gain getGainById(int gainid) {  
	        // TODO Auto-generated method stub  
	        return this.gainDao.selectByPrimaryKey(gainid);  
	    }

		public List<Gain> selectList(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.selectList(record);
		}
		
		public List<Gain> selectAllList() {
			// TODO Auto-generated method stub
			return this.gainDao.selectAllList();
		}

		public List<Gain> selectCount(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.selectCount(record);
		}

		public int insert(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.insertSelective(record);
		}

		public int update(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.updateByPrimaryKeySelective(record);
		}

		public int deletebyid(int gainid) {
			// TODO Auto-generated method stub
			return this.gainDao.deleteByPrimaryKey(gainid);
		}

		public int delete() {
			// TODO Auto-generated method stub
			return this.gainDao.delete();
		}

		public int finish() {
			// TODO Auto-generated method stub
			return this.gainDao.finish();
		}

		public List<Gain> selectListbyuser(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.selectListbyuser(record);
		}

		public List<Gain> selectCountbyuser(Gain record) {
			// TODO Auto-generated method stub
			return this.gainDao.selectCountbyuser(record);
		} 

		public List<Gain> selectListbyusername(Gain record){
			return this.gainDao.selectListbyusername(record);
		}
		
		public List<Gain> selectCountbyusername(Gain record){
			return this.gainDao.selectCountbyusername(record);
		}


}