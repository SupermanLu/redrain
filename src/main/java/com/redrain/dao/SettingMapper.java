package com.redrain.dao;

import java.util.List;

import com.redrain.model.Rule;
import com.redrain.model.Setting;

public interface SettingMapper {
    int deleteByPrimaryKey(Integer settingid);

    int insert(Setting record);

    int insertSelective(Setting record);

    Setting selectByPrimaryKey(Integer settingid);

    int updateByPrimaryKeySelective(Setting record);

    int updateByPrimaryKey(Setting record);
    
    List<Setting> selectAllSetting();
    
    List<Setting> selectSetting(Setting record);
}