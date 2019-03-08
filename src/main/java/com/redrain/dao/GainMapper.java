package com.redrain.dao;

import java.util.List;

import com.redrain.model.Gain;
import com.redrain.model.Throw;

public interface GainMapper {
    int deleteByPrimaryKey(Integer gainid);

    int insert(Gain record);

    int insertSelective(Gain record);

    Gain selectByPrimaryKey(Integer gainid);

    int updateByPrimaryKeySelective(Gain record);

    int updateByPrimaryKey(Gain record);
    
    List<Gain> selectList(Gain record);
    
    List<Gain> selectCount(Gain record);
    
    List<Gain> selectAllList();
    
    List<Gain> selectListbyusername(Gain record);
    
    List<Gain> selectCountbyusername(Gain record);
    
    List<Gain> selectListbyuser(Gain record);
    
    List<Gain> selectCountbyuser(Gain record);
    
    int finish();
    
    int delete();
}