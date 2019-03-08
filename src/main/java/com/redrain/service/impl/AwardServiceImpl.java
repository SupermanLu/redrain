package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.AwardMapper;
import com.redrain.dao.InfoMapper;
import com.redrain.dao.UserMapper;
import com.redrain.model.Award;
import com.redrain.model.Info;
import com.redrain.model.User;
import com.redrain.service.AwardService;
import com.redrain.service.InfoService;
import com.redrain.service.UserService;


@Service("AwardService")  
public class AwardServiceImpl implements AwardService {

	  	@Resource  
	    private AwardMapper awardDao;  
	 
	    public Award getAwardById(int awardid) {  
	        // TODO Auto-generated method stub  
	        return this.awardDao.selectByPrimaryKey(awardid);  
	    }

		public List<Award> selectList(Award award) {
			// TODO Auto-generated method stub
			return this.awardDao.selectList(award);
		}

		public List<Award> selectCount(Award award) {
			// TODO Auto-generated method stub
			return this.awardDao.selectCount(award);
		}

		public int insert(Award award) {
			// TODO Auto-generated method stub
			return this.awardDao.insertSelective(award);
		}

		public int update(Award award) {
			// TODO Auto-generated method stub
			return this.awardDao.updateByPrimaryKeySelective(award);
		}

		public int deletebyid(int awardid) {
			// TODO Auto-generated method stub
			return this.awardDao.deleteByPrimaryKey(awardid);
		}

		public List<Award> selectAll() {
			// TODO Auto-generated method stub
			return this.awardDao.selectAll();
		}

}