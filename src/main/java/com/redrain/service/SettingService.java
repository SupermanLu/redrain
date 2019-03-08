package com.redrain.service;

import java.util.List;

import com.redrain.model.Rule;
import com.redrain.model.Setting;


public interface SettingService {
	public List<Setting> getAllSetting();
	
	public Setting getSettingById(Integer settingId);
	
	public int updateByPrimaryKey(Setting setting);
	
	public int insert(Setting setting);
}
