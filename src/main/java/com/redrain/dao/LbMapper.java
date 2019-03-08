package com.redrain.dao;

import java.util.List;

import com.redrain.model.Gain;
import com.redrain.model.Lb;
import com.redrain.model.User;

public interface LbMapper {
    int deleteByPrimaryKey(Integer lbid);

    int insert(Lb record);

    int insertSelective(Lb record);

    Lb selectByPrimaryKey(Integer lbid);

    int updateByPrimaryKeySelective(Lb record);

    int updateByPrimaryKey(Lb record);
    
    List<Lb> selectList(Lb record);
    
    List<Lb> selectCount(Lb record);
    
    List<Lb> selectAllList();
    
    int deleteAllLb();
}