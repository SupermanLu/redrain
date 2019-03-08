package com.redrain.dao;

import java.util.List;

import com.redrain.model.Throw;

public interface ThrowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Throw record);

    int insertSelective(Throw record);

    Throw selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Throw record);

    int updateByPrimaryKey(Throw record);
    
    List<Throw> selectList(Throw record);
    
    List<Throw> selectCount(Throw record);
    
    int finish();
    
    int delete();
    
    List<Throw> selectTodayCount(Throw record);
}