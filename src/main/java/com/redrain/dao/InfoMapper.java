package com.redrain.dao;

import java.util.List;

import com.redrain.model.Info;

public interface InfoMapper {
    int deleteByPrimaryKey(String infoid);

    int insert(Info record);

    int insertSelective(Info record);

    Info selectByPrimaryKey(String infoid);

    int updateByPrimaryKeySelective(Info record);

    int updateByPrimaryKeyWithBLOBs(Info record);

    int updateByPrimaryKey(Info record);
    
    List<Info> selectList(Info record);
    
    List<Info> selectCount(Info record);
}