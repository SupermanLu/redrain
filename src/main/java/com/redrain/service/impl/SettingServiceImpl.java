package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.RuleMapper;
import com.redrain.dao.SettingMapper;
import com.redrain.model.Rule;
import com.redrain.model.Setting;
import com.redrain.model.User;
import com.redrain.service.RuleService;
import com.redrain.service.SettingService;


@Service("settingService")  
public class SettingServiceImpl implements SettingService {

	  	@Resource  
	    private SettingMapper settingDao;  
	 
	  	public List<Setting> getAllSetting(){
	  		return settingDao.selectAllSetting();
	  	}
	  	
	  	
	  	public Setting getSettingById(Integer settingId) {  
	        // TODO Auto-generated method stub  
	        return this.settingDao.selectByPrimaryKey(settingId);  
	    }  
	  	
	  	
	  	 public int updateByPrimaryKey(Setting setting) {
		    return this.settingDao.updateByPrimaryKey(setting);
		 }
	  	 
	  	public int insert(Setting setting) {
	  		return this.settingDao.insert(setting);
	  	}


}